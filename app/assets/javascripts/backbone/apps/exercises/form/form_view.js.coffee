@FitdiaryApp.module "ExercisesApp.Form", (Form, App, Backbone, Marionette, $, _) ->

  class Form.Exercise extends Marionette.Layout
    template: 'exercises/form/templates/exercise'

    sets: null
    name: null

    regions:
      setsRegion: '.sets',
      nameRegion: '.name'

    events:
      'click .dialog-background': -> @trigger 'exercise:form:close', @model,
      'click .dialog .footer .buttons .add-set': -> @trigger 'exercise:form:add:set', @model,
      'click .dialog .footer .buttons .save': -> @trigger 'exercise:form:save', @model
      'click .dialog .footer .buttons .cancel': -> @trigger 'exercise:form:cancel:changes', @model
      'click .dialog .footer .buttons .delete': -> @trigger 'exercise:form:destroy', @model

    initialize: ->
      @sets = new Form.Sets({ collection: @model.sets })
      @name = new Form.ExerciseName({ model: @model })

      @sets.on 'itemview:set:form:remove', (iv, set) =>
        @trigger 'exercise:form:remove:set', @model, set

      @name.on 'input:focused', =>
        @trigger 'exercise:form:name:show:hints', @name

      @name.on 'down:key:pressed', =>
        if @name.dropdownClosed
          @trigger 'exercise:form:name:show:hints', @name

      @name.on 'some:key:pressed', =>
        @trigger 'exercise:form:name:update:hints', @name

      @name.on 'input:blured', =>
        @trigger 'exercise:form:name:update:value', @name
        @trigger 'exercise:form:name:hide:hints', @name



    onRender: ->
      @setsRegion.show @sets
      @nameRegion.show @name

    getLastSet: ->
      @sets.children.last()


  class Form.ExerciseName extends Marionette.Layout
    template: 'exercises/form/templates/name'

    inputDefaultValue: null
    dropdownClosed: null

    ui:
      name: 'input[name=gymnastic_name]'

    regions:
      hintsRegion: '.hints'

    events:
      'focus input': -> @trigger 'input:focused'
      'blur input': -> @trigger 'input:blured'
      'keydown input': 'inputKeydownHandler'
      'keyup input': 'inputKeyupHandler'


    inputKeydownHandler: (e) ->
      if e.keyCode == 40 # down key
        @trigger 'down:key:pressed'

      else if e.keyCode == 38 # up key
        @trigger 'up:key:pressed'

      else if e.keyCode == 13 # Enter
        @trigger 'enter:key:pressed'

      else if e.keyCode == 27 # Escape
        @trigger 'escape:key:pressed'


    inputKeyupHandler: (e) ->
      return false if $.inArray(e.keyCode, [13, 27, 38, 40]) >= 0

      @trigger 'some:key:pressed'

    # @todo - вынести это из View в Controller
    setNameValue: (gymnasticName) ->
      if gymnasticName
        @initDefaultValue()
        @ui.name.val gymnasticName
      else
        @setDefaultValue()


    setDefaultValue: ->
      # @todo Но в этой ситуации не понятно, что делать, если изначально значение было пустым
      unless @inputDefaultValue == null
        @ui.name.val @inputDefaultValue
        @inputDefaultValue = null

    setNewValue: (newValue) ->
      @ui.name.val newValue
      @inputDefaultValue = newValue
      @model.set('gymnastic_name', newValue)

    initDefaultValue: ->
      @inputDefaultValue = @ui.name.val() if @inputDefaultValue == null


  class Form.Set extends Marionette.ItemView
    template: 'exercises/form/templates/set'
    className: 'row'

    ui:
      weight: 'input[name=weight]'
      repeats: 'input[name=repeats]'

    events:
      'click .remove-set': -> @trigger 'set:form:remove', @model,
      'blur input[name=weight]': 'check_weight_changed',
      'blur input[name=repeats]': 'check_repeats_changed'


    initialize: ->

      @model.on 'hide', =>
        @$el.hide()

    check_weight_changed: ->
      @model.set({weight: parseFloat(@ui.weight.val())})


    check_repeats_changed: ->
      @model.set({repeats: parseInt(@ui.repeats.val())})



  class Form.Sets extends Marionette.CollectionView
    itemView: Form.Set

    collectionEvents:
      'change': -> @render()