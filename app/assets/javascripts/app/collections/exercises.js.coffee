class Fitdiary.Exercises extends Backbone.Collection
  model: Fitdiary.Exercise
  workout: null

  url: ->
    "/workouts/#{@workout.id}/exercises.json"