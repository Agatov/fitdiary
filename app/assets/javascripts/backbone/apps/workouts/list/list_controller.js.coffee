@FitdiaryApp.module "WorkoutsApp.List", (List, App, Backbone, Marionette, $, _) ->

  List.Controller =

    Show: (workout) ->

      workoutView = @getWorkoutView(workout)

      workoutView.on 'workout:edit:exercise:clicked', (exercise) ->
        App.vent.trigger 'edit:exercise:clicked', exercise

      workoutView.on 'workout:add:exercise', (workout) ->
        App.vent.trigger 'add:exercise', workout

      workoutView.on 'workout:destroy', (workout) ->
        App.vent.trigger 'destroy:workout', workout

      # Выкидываем собитие, которое ловит панель с тренировками и выделяет показанную тренировку
      workout.trigger 'shown'

      App.mainRegion.show workoutView


    Create: ->
      workout = App.request 'new:workout'
      workouts = App.request 'workout:present:entities'

      workout.save null,
        success: ->
          workouts.add workout
          App.vent.trigger 'render:workouts'
          App.vent.trigger 'show:workout', workout

    Destroy: (workout) ->
      workout.destroy


      workouts = App.request 'workout:present:entities'
      App.vent.trigger 'show:workout', workouts.first()


    getWorkoutView: (workout) ->
      new List.Workout
        model: workout

    getWorkoutsView: (workouts) ->
      new List.Workouts
        collection: workouts
