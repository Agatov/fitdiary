@FitdiaryApp.module "WorkoutsApp.List", (List, App, Backbone, Marionette, $, _) ->

  List.Controller =

    Show: (workout) ->

      workoutView = @getWorkoutView(workout)

      workoutView.on 'workout:edit:exercise:clicked', (exercise) ->
        App.vent.trigger 'edit:exercise:clicked', exercise

      workoutView.on 'workout:add:exercise', (workout) ->
        App.vent.trigger 'add:exercise', workout

      workoutView.on 'destroy:workout', (workout) ->
        App.vent.trigger 'show:workout:destroy:dialog', workout

      # Выкидываем собитие, которое ловит панель с тренировками и выделяет показанную тренировку
      workout.trigger 'shown'

      App.mainRegion.show workoutView

    Destroy: (workout) ->

      workout.destroy()

      workouts = App.request 'workout:present:entities'

      App.vent.trigger 'render:workouts'
      App.vent.trigger 'show:workout', workouts.first()


    getWorkoutView: (workout) ->
      new List.Workout
        model: workout

    getWorkoutsView: (workouts) ->
      new List.Workouts
        collection: workouts
