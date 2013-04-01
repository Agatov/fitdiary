class Fitdiary.Exercise extends Backbone.Model

  url: ->
    if @isNew()
      "/workouts/#{@collection.workout.id}/exercises.json"
    else
      "/workouts/#{@collection.workout.id}/exercises/#{@get('id')}.json"

  initialize: ->
    @initialize_sets()

  prepare_attributes: ->
    @set('exercise_sets', @exercise_sets.to_params())

  initialize_sets: ->
    exercise_sets = @get('exercise_sets')
    if exercise_sets
      @exercise_sets = new Fitdiary.ExerciseSets(exercise_sets)
      @exercise_sets.exercise = @
      console.log(@exercise_sets)


  update_exercise_sets_ids: ->
    ex_sets = @get('exercise_sets')
    @exercise_sets.models[i].set('id', ex_sets[i]['id']) for i in [0..(@exercise_sets.models.length - 1)]
