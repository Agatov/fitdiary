@FitdiaryApp.module "WorkoutsApp.List", (List, App, Backbone, Marionette, $, _) ->

  List.Controller =

    listWorkouts: ->

      workouts = App.request 'workout:entities'

      workoutsView = @getWorkoutsView workouts

      workoutsView.on 'itemview:workout:edit:exercise:clicked', (iv, exercise) ->
        App.vent.trigger 'edit:exercise:clicked', exercise

      workoutsView.on 'itemview:workout:add:exercise', (iv, workout) ->
        App.vent.trigger 'add:exercise', workout

      App.mainRegion.show workoutsView

    getWorkoutsView: (workouts) ->
      new List.Workouts
        collection: workouts
