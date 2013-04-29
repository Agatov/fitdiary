@FitdiaryApp.module "WorkoutsApp.Dialogs", (Dialogs, App, Backbone, Marionette, $, _) ->

  Dialogs.Controller =

    showWorkoutDestroyDialog: (workout) ->

      workoutDestroyDialogView = @getWorkoutDestroyDialogView(workout)

      workoutDestroyDialogView.on 'destroy:button:clicked', (workout) ->
        App.vent.trigger 'close:workout:destroy:dialog'
        App.vent.trigger 'destroy:workout', workout

      workoutDestroyDialogView.on 'cancel:button:clicked', ->
        App.vent.trigger 'close:workout:destroy:dialog'


      App.dialogRegion.show workoutDestroyDialogView


    closeWorkoutDestroyDialog: ->
      App.dialogRegion.close()


    getWorkoutDestroyDialogView: (workout) ->

      new Dialogs.WorkoutDestroyDialog
        model: workout