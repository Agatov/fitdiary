@FitdiaryApp.module "WorkoutsApp", (WorkoutsApp, App, Backbone, Marionette, $, _) ->


  API =
    listWorkouts: ->
      WorkoutsApp.Panel.Controller.Show()

    renderWorkouts: ->
      WorkoutsApp.Panel.Controller.Render()

    showWorkout: (workout) ->
      WorkoutsApp.List.Controller.Show(workout)

    addWorkout: ->
      WorkoutsApp.List.Controller.Create()

    destroyWorkout: (workout) ->
      WorkoutsApp.List.Controller.Destroy(workout)

  class WorkoutsApp.Router extends Marionette.AppRouter
    appRoutes:
      'workouts': 'listWorkouts'


  App.addInitializer ->
    new WorkoutsApp.Router
      controller: API

  App.vent.on 'render:workouts', ->
    API.renderWorkouts()

  App.vent.on 'show:workout', (workout) ->
    API.showWorkout workout

  App.vent.on 'add:workout', ->
    API.addWorkout()

  App.vent.on 'destroy:workout', (workout) ->
    API.destroyWorkout(workout)





