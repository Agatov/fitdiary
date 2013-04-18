@FitdiaryApp.module "WorkoutsApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Exercise extends Marionette.Layout
    template: 'workouts/list/templates/exercise'
    className: 'exercise'

    regions:
      setsRegion: '.sets'

    sets: null

    events:
      'click': -> @trigger 'edit:exercise:clicked', @model

    modelEvents:
      'change': -> @render()

    initialize: ->
      @sets = new List.Sets({ collection: @model.sets })

    onRender: ->
      @setsRegion.show @sets

  class List.ExercisesEmpty extends Marionette.ItemView
    template: 'workouts/list/templates/no_exercises'


  class List.Set extends Marionette.ItemView
    template: 'workouts/list/templates/set'
    className: 'set'

    modelEvents:
      'change': -> @render()


  class List.SetsEmpty extends Marionette.ItemView
    template: 'workouts/list/templates/no_sets'


  class List.Sets extends Marionette.CollectionView
    itemView: List.Set
    emptyView: List.SetsEmpty

  class List.Exercises extends Marionette.CollectionView
    itemView: List.Exercise
    emptyView: List.ExercisesEmpty
    className: 'exercises'

  class List.Workout extends Marionette.Layout
    template: 'workouts/list/templates/workout'
    className: 'workout'

    exercises: null

    regions:
      bodyRegion: '.body'

    events:
      'click .add-exercise': -> @trigger 'workout:add:exercise', @model

    initialize: ->
      @exercises = new List.Exercises({ collection: @model.exercises })

      @exercises.on 'itemview:edit:exercise:clicked', (iv, exercise) =>
        @trigger 'workout:edit:exercise:clicked', exercise

    onRender: ->
      @bodyRegion.show @exercises


  class List.EmptyWorkouts extends Marionette.ItemView
    template: 'workouts/list/templates/no_workouts'

  class List.Workouts extends Marionette.CollectionView
    itemView: List.Workout
    emptyView: List.EmptyWorkouts
    className: 'workouts'