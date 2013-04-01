class Fitdiary.NavbarView extends Backbone.Marionette.Layout
  template: 'common/navbar'

  events: {
    'click .add-workout': 'add_workout'
  }

  add_workout: ->
    workout = new Fitdiary.Workout
    workout.save()
    Fitdiary.workouts.unshift(workout)