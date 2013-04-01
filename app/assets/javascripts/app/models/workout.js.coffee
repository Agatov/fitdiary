class Fitdiary.Workout extends Backbone.Model

  url: ->
    if @isNew()
      '/workouts.json'
    else
      "workouts/#{@get('_id')}.json"

  initialize: ->
    exercises = @get('exercises')
    if exercises
      @exercises = new Fitdiary.Exercises(exercises)
      @exercises.workout = @
#      @exercises.workout_id = @get('id')
    else
      @exercises = new Fitdiary.Exercises
      @exercises.workout = @


  after_save: ->
    @exercises.workout_id = @get('id')