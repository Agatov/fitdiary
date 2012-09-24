class window.ExerciseSetsCollection

  constructor: (data, collection) ->
    @exercise_sets = []
    @collection = collection

    @initialize(data)

  initialize: (data) ->

    @add_exercise_set(exercise_set) for exercise_set in data

  add_exercise_set: (data) ->
    exercise_set = new ExerciseSet(data, @)
    @exercise_sets.push exercise_set