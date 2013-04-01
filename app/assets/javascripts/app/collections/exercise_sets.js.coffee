class Fitdiary.ExerciseSets extends Backbone.Collection
  model: Fitdiary.ExerciseSet
  exercise: null

  initialize: ->
    @exercise_attributes = []

  url: ->
    "/exercises/#{@exercise.id}/sets"

  to_params: ->
    @add_to_exercise_attributes(model.attributes) for model in @models
    @exercise_attributes

  add_to_exercise_attributes: (attribute) ->
    @exercise_attributes.push(attribute)