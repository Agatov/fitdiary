@FitdiaryApp.module "WorkoutsApp", (WorkoutsApp, App, Backbone, Marionette, $, _) ->


  API =
    listWorkouts: ->
      WorkoutsApp.Panel.Controller.Show()

    showWorkout: (workout) ->
      WorkoutsApp.List.Controller.Show(workout)

  class WorkoutsApp.Router extends Marionette.AppRouter
    appRoutes:
      'workouts': 'listWorkouts'


  App.addInitializer ->
    new WorkoutsApp.Router
      controller: API

  App.vent.on 'show:workout', (workout) ->
    API.showWorkout workout





