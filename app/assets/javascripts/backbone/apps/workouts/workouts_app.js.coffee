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

    showNewWorkoutForm: ->
      WorkoutsApp.Form.Controller.Show()

    closeNewWorkoutForm: ->
      WorkoutsApp.Form.Controller.Close()

    createWorkout: (workout) ->
      WorkoutsApp.Form.Controller.Create(workout)

    showWorkoutDestroyDialog: (workout) ->
      WorkoutsApp.Dialogs.Controller.showWorkoutDestroyDialog(workout)

    closeWorkoutDestroyDialog: ->
      WorkoutsApp.Dialogs.Controller.closeWorkoutDestroyDialog()


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

  App.vent.on 'show:new:workout:form', ->
    API.showNewWorkoutForm()

  App.vent.on 'close:new:workout:form', ->
    API.closeNewWorkoutForm()

  App.vent.on 'create:workout', (workout) ->
    API.createWorkout(workout)


  App.vent.on 'show:workout:destroy:dialog', (workout) ->
    API.showWorkoutDestroyDialog workout


  App.vent.on 'close:workout:destroy:dialog', ->
    API.closeWorkoutDestroyDialog()





