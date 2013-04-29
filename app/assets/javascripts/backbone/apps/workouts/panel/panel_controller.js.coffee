@FitdiaryApp.module "WorkoutsApp.Panel", (Panel, App, Backbone, Marionette, $, _) ->

  Panel.Controller =

    # При первом показе
    # Запрашиваем список тренировок с сервера
    # Рендерим панель с тренировоками
    # Отсылаем запрос на показ первой тренировки из списка
    Show: (workouts) ->
      workouts  = App.request 'workout:entities'

      workouts.on 'reset', =>
        workoutsView = @getWorkoutsView workouts
        App.workoutsRegion.show workoutsView
        App.vent.trigger 'show:workout', workouts.first()


    # При последующих показах
    # Запрашиваем список тренировок из локального кеша
    # Перерисовываем панель с тренировками
    Render: ->
      workouts = App.request 'workout:present:entities'
      workoutsView = @getWorkoutsView workouts
      App.workoutsRegion.show workoutsView

    getWorkoutsView: (workouts) ->

      workoutsView = new Panel.WorkoutBar({collection: workouts})

      workoutsView.on 'workout:clicked', (workout) ->
        App.vent.trigger 'show:workout', workout

      workoutsView.on 'add:workout', (workout) ->
#        App.vent.trigger 'add:workout', workout
        App.vent.trigger 'show:new:workout:form'