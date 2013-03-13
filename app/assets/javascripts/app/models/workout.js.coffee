class Fitdiary.Workout extends Backbone.Model

  initialize: ->
    exercises = @get('exercises')
    if exercises
      @exercises = new Fitdiary.Exercises(exercises)
