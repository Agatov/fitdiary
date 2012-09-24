class window.ExercisesCollection extends Collection

  initialize: ->
    @add_exercise(exercise) for exercise in @data

  add_exercise: (data) ->
    exercise = new Exercise(data, @)
    @exercises.push exercise
