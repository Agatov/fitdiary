class Fitdiary.ExerciseNameView extends Backbone.Marionette.Layout

  gymnasticHints: null
  inputDefaultValue: null
  dropdownClosed: true

  template: 'exercises/exercise_name_input'

  ui: {
    name: 'input[name=gymnastic_name]'
  }

  regions: {
    hintsRegion: '.hints',
  }

  events: {
    'focus input': 'showHints',
    'blur input': 'handle_blur',
    'keydown input': 'input_keydown',
    'keyup input': 'input_keyup'
  }

  initialize: ->
    @.on('blured', @resetNameValue)
    @.on('blured', @pickSelectedHintByClick)
    @.on('blured', @hide_hints)


  handle_blur: ->
    @.trigger('blured')

  showHints: ->
    gs = new Fitdiary.Gymnastics
    gs.search_string = @ui.name.val() if @ui.name.val() != ''

    gs.fetch()

    @gymnasticHints = new Fitdiary.GymnasticsListView({ collection:  gs})
    @hintsRegion.show(@gymnasticHints)

    @dropdownClosed = false
    @inputDefaultValue = @ui.name.val() if @inputDefaultValue == null

  hide_hints: ->
    @hintsRegion.close()
    @dropdownClosed = true


  input_keydown: (e) ->

    if e.keyCode == 40 # down key
      if @dropdownClosed
        @showHints()
      else
        @selectNextHint()

    else if e.keyCode == 38 # up key
      @selectPreviousHint()

    else if e.keyCode == 13 # Enter
      @pickSelectedHint()

    else if e.keyCode == 27 # Escape
      @hide_hints()
      # @todo - resetNameValue раз )))
      @ui.name.val(@inputDefaultValue)
      @inputDefaultValue = null

  input_keyup: (e) ->
    return false if $.inArray(e.keyCode, [13, 27, 38, 40]) >= 0

    @inputDefaultValue = @ui.name.val()

    @gymnasticHints.collection.search_string = @ui.name.val()
    @gymnasticHints.collection.fetch()


  selectNextHint: ->
    @gymnasticHints.collection.selectNext()
    @setNameValue()


  selectPreviousHint: ->
    @gymnasticHints.collection.selectPrevious()
    @setNameValue()


  setNameValue: ->
    if @gymnasticHints.selectedGymnastic()
      @inputDefaultValue = @ui.name.val() if @inputDefaultValue == null
      @ui.name.val(@gymnasticHints.selectedGymnasticName())
    else
      # @todo - resetNameValue два )))
      @ui.name.val(@inputDefaultValue)
      @inputDefaultValue = null

  # @todo - resetNameValue как бы три )))
  resetNameValue: ->
    unless @gymnasticHints.mouseIsOverDropdown
      @ui.name.val(@inputDefaultValue)
      @inputDefaultValue = null


  pickSelectedHint: ->
    if @gymnasticHints.selectedGymnastic()
      @ui.name.val(@gymnasticHints.selectedGymnasticName())
      @inputDefaultValue = @ui.name.val()

    @hide_hints()

  pickSelectedHintByClick: ->
    if @gymnasticHints.mouseIsOverDropdown
      @pickSelectedHint()
