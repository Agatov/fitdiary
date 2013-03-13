class Fitdiary.WorkoutView extends Backbone.Marionette.Layout
  template: 'workouts/workout_view'
  className: 'workout'

  regions: {
    bodyRegion: '.body'
  }

  initialize: ->
    @exercisesView = new Fitdiary.ExercisesView({collection: @model.exercises })

  onRender: ->
    @bodyRegion.show(@exercisesView)
