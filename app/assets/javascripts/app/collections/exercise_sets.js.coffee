class Fitdiary.ExerciseSets extends Backbone.Collection
  model: Fitdiary.ExerciseSet

  url: ->
    "/exercises/#{@exercise_id}/sets"