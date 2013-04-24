@FitdiaryApp.module "WorkoutsApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Exercise extends Marionette.Layout
    template: 'workouts/list/templates/exercise'
    className: 'exercise'

    regions:
      setsRegion: '.sets'
      headerRegion: 'header'

    sets: null
    name: null

    events:
      'click': -> @trigger 'edit:exercise:clicked', @model

    initialize: ->
      @sets = new List.Sets({ collection: @model.sets })
      @name = new List.ExerciseName({ model: @model })

    onRender: ->
      @setsRegion.show @sets if @setsRegion.currentView == undefined
      @headerRegion.show @name if @headerRegion.currentView == undefined


  class List.ExerciseName extends Marionette.ItemView
    template: 'workouts/list/templates/name'
    className: 'name'

    modelEvents: ->
      'change': -> @render()


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
      'click .delete': -> @trigger 'destroy:workout', @model

    initialize: ->
      @exercises = new List.Exercises({ collection: @model.exercises })

      @exercises.on 'itemview:edit:exercise:clicked', (iv, exercise) =>
        @trigger 'workout:edit:exercise:clicked', exercise

    onRender: ->
      @bodyRegion.show @exercises