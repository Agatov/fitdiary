@FitdiaryApp.module "WorkoutsApp.Form", (Form, App, Backbone, Marionette, $, _) ->

  Form.Controller =

    Show: ->
      workout = App.request 'new:workout'
      formView = @getNewWorkoutFormView workout

      formView.on 'save:button:clicked', (workout) ->
        App.vent.trigger 'close:new:workout:form'
        App.vent.trigger 'create:workout', workout

      formView.on 'cancel:button:clicked', ->
        App.vent.trigger 'close:new:workout:form'

      App.dialogRegion.show formView


    Create: (workout) ->
      workouts = App.request 'workout:present:entities'

      workout.save null,
        success: ->
          workouts.add workout
          App.vent.trigger 'render:workouts'
          App.vent.trigger 'show:workout', workout


    Close: ->
      App.dialogRegion.close()



    getNewWorkoutFormView: (workout) ->
      new Form.Workout
        model: workout
