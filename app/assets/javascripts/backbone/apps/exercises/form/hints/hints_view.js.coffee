@FitdiaryApp.module "ExercisesApp.Form.Hints", (Hints, App, Backbone, Marionette, $, _) ->

  class Hints.GymnasticHint extends Marionette.ItemView
    template: 'exercises/form/templates/gymnastic_hint'
    className: 'gymnastic'

    modelEvents:
      'change': 'modelChanged'

    events:
      'mouseenter': -> @trigger 'mouseenter', @model,
        'click': -> @trigger 'clicked', @model

    modelChanged: ->
      if @model.selected()
        @$el.addClass('selected')
      else if @model.not_selected() and @$el.hasClass('selected')
        @$el.removeClass('selected')

  class Hints.NoGymnasticHints extends Marionette.ItemView
    template: 'exercises/form/templates/no_gymnastic_hints'

  class Hints.GymnasticHints extends Marionette.CollectionView
    itemView: Hints.GymnasticHint
    emptyView: Hints.NoGymnasticHints
    className: 'gymnastics'

    mouseIsOverDropdown: false

    events:
      'mouseenter': -> @mouseIsOverDropdown = true
      'mouseleave': -> @mouseIsOverDropdown = false