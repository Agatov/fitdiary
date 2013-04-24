@FitdiaryApp.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Workout extends Backbone.Model

    exercises: null

    url: ->
      if @isNew()
        '/workouts'
      else
        "/workouts/#{@get('id')}"

    initialize: ->
      @exercises = new Entities.Exercises(@get('exercises'), workout: @)

      @exercises.on 'change', => @updateGymnasticNamesPreview()
      @exercises.on 'add', => @updateGymnasticNamesPreview()

      @updateGymnasticNamesPreview()



    updateGymnasticNamesPreview: ->
      @set 'gymnastic_names_preview', @exercises.getGymnasticNamesPreview()

  class Entities.Workouts extends Backbone.Collection
    model: Entities.Workout
    url: '/workouts'


  API =
    getWorkoutEntities: ->
      workouts = new Entities.Workouts
      workouts.fetch()

      App.reqres.addHandler 'workout:present:entities', ->
        workouts

      workouts

    getNewWorkout: ->
      new Entities.Workout

  App.reqres.addHandler 'workout:entities', ->
    API.getWorkoutEntities()

  App.reqres.addHandler 'new:workout', ->
    API.getNewWorkout()
