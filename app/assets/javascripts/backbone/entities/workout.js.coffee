@FitdiaryApp.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Workout extends Backbone.Model

    exercises: null

    initialize: ->
      if @get('exercises')
        @exercises = new Entities.Exercises(@get('exercises'), workout: @)

  class Entities.Workouts extends Backbone.Collection
    model: Entities.Workout
    url: '/workouts'


  API =
    getWorkoutEntities: ->
      workouts = new Entities.Workouts
      workouts.fetch()
      workouts

  App.reqres.addHandler 'workout:entities', ->
    API.getWorkoutEntities()
