@FitdiaryApp.module "WorkoutsApp.Panel", (Panel, App, Backbone, Marionette, $, _) ->

  Panel.Controller =

    Show: ->

      workouts  = App.request 'workout:entities'

      workouts.on 'reset', ->
        workoutsView = new Panel.WorkoutBar({collection: workouts})

        workoutsView.on 'workout:clicked', (workout) ->
          App.vent.trigger 'show:workout', workout

        App.workoutsRegion.show workoutsView