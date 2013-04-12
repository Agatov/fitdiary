class Fitdiary.ExerciseView extends Backbone.Marionette.Layout
  template: 'exercises/exercise_view'
  className: 'exercise'

  regions: {
    setsRegion: '.sets'
  }

  initialize: ->
    @exerciseSetsView = new Fitdiary.ExerciseSetsView({ collection: @model.exercise_sets })

  onRender: ->
    @setsRegion.show(@exerciseSetsView)
