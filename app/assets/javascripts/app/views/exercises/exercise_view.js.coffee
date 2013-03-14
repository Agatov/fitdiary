class Fitdiary.ExerciseView extends Backbone.Marionette.Layout
  template: 'exercises/exercise_view'
  className: 'exercise'

  regions: {
    setsRegion: '.sets'
  }

  events: {
    'mouseenter': 'show_actions',
    'mouseleave': 'hide_actions'
  }

  initialize: ->
    @exerciseSetsView = new Fitdiary.ExerciseSetsView({ collection: @model.exercise_sets })

  onRender: ->
    @setsRegion.show(@exerciseSetsView)


  show_actions: ->
    $(@el).find('.actions').show()

  hide_actions: ->
    $(@el).find('.actions').hide()
