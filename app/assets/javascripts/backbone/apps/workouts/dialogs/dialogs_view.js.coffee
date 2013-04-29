@FitdiaryApp.module "WorkoutsApp.Dialogs", (Dialogs, App, Backbone, Marionette, $, _) ->

  class Dialogs.WorkoutDestroyDialog extends Marionette.ItemView
    template: 'workouts/dialogs/templates/workout_destroy_dialog'

    events:
      'click .destroy': -> @trigger 'destroy:button:clicked', @model
      'click .cancel': -> @trigger 'cancel:button:clicked'
