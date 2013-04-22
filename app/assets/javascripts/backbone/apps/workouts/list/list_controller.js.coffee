@FitdiaryApp.module "WorkoutsApp.List", (List, App, Backbone, Marionette, $, _) ->

  List.Controller =

    Show: (workout) ->

      workoutView = @getWorkoutView(workout)

      workoutView.on 'workout:edit:exercise:clicked', (exercise) ->
        App.vent.trigger 'edit:exercise:clicked', exercise

      workoutView.on 'workout:add:exercise', (workout) ->
        App.vent.trigger 'add:exercise', workout

      App.mainRegion.show workoutView


    getWorkoutView: (workout) ->
      new List.Workout
        model: workout

    getWorkoutsView: (workouts) ->
      new List.Workouts
        collection: workouts
