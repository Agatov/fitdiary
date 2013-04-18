@FitdiaryApp.module "WorkoutsApp", (WorkoutsApp, App, Backbone, Marionette, $, _) ->


  API =
    listWorkouts: ->
      WorkoutsApp.List.Controller.listWorkouts()


  class WorkoutsApp.Router extends Marionette.AppRouter
    appRoutes:
      'workouts': 'listWorkouts'


  App.addInitializer ->
    new WorkoutsApp.Router
      controller: API




