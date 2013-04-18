@FitdiaryApp.module "ExercisesApp", (ExercisesApp, App, Backbone, Marionette, $, _) ->

  API =

    newExercise: (workout) ->
      ExercisesApp.Form.Controller.New(workout)

    editExercise: (exercise) ->
      ExercisesApp.Form.Controller.Edit(exercise)

    saveExercise: (exercise) ->
      if exercise.isNew()
        ExercisesApp.Form.Controller.Create(exercise)
      else
        ExercisesApp.Form.Controller.Update(exercise)


    cancelExercise: (exercise) ->
      ExercisesApp.Form.Controller.Cancel(exercise)

    closeExerciceForm: ->
      ExercisesApp.Form.Controller.Close()


  class ExercisesApp.Router extends Marionette.AppRouter
    appRoutes:
      'olo': 'editExercise'

  App.vent.on 'add:exercise', (workout) ->
    API.newExercise(workout)

  App.vent.on 'edit:exercise:clicked', (exercise) ->
    API.editExercise(exercise)

  App.vent.on 'close:exercise:form', (exercise) ->
    API.closeExerciceForm()

  App.vent.on 'save:exercise', (exercise) ->
    API.saveExercise(exercise)

  App.vent.on 'cancel:exercise:changes', (exercise) ->
    API.cancelExercise(exercise)




  App.addInitializer ->
    new ExercisesApp.Router
      controller: API

