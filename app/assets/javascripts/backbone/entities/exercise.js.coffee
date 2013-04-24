@FitdiaryApp.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Exercise extends Backbone.Model

    sets: null

    validation:
      gymnastic_name:
        required: true
        msg: 'gymnastic name is required'

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
        unless attributeName == 'id'
          @set(attributeName, @previous(attributeName))



  class Entities.Exercises extends Backbone.Collection
    model: Entities.Exercise

    workout: null


    initialize: (models, options = {}) ->
      if options.workout
        @workout = options.workout

    getGymnasticNamesPreview: ->
      names = @map (e) ->
        e.get('gymnastic_name')

      names_string = names.join(', ')

      if names_string.length > 100
        "#{names_string.slice(0, 101)}..."
      else
        names_string


  API =
    getNewExercise: ->
      exercise = new Entities.Exercise
      exercise.addSet()
      exercise



  App.reqres.addHandler 'new:exercise', ->
    API.getNewExercise()