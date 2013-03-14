class Fitdiary.Exercise extends Backbone.Model

  initialize: ->
    exercise_sets = @get('exercise_sets')
    if exercise_sets
      @exercise_sets = new Fitdiary.ExerciseSets(exercise_sets)
      @exercise_sets.exercise_id = @get('id')

