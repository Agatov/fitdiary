@FitdiaryApp.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Exercise extends Backbone.Model

    sets: null

    url: ->
      if @isNew()
        "/workouts/#{@collection.workout.get('id')}/exercises"
      else
        "/exercises/#{@get('id')}"

    initialize: ->
      @sets = new Entities.ExerciseSets(@get('sets'), {exercise: @})


    addSet: (weight = 0, repeats = 0) ->
      @sets.add({weight: weight, repeats: repeats})

    saveIfChanged: ->
      @save() if @hasChanged()

    revert: ->
      _.each @changedAttributes(), (attributeValue, attributeName) =>
        @set(attributeName, @previous(attributeName))



  class Entities.Exercises extends Backbone.Collection
    model: Entities.Exercise

    workout: null


    initialize: (models, options = {}) ->
      if options.workout
        @workout = options.workout


  API =
    getNewExercise: ->
      exercise = new Entities.Exercise
      exercise.addSet()
      exercise



  App.reqres.addHandler 'new:exercise', ->
    API.getNewExercise()