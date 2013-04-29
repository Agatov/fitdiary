@FitdiaryApp.module "WorkoutsApp.Panel", (Panel, App, Backbone, Marionette, $, _) ->

  class Panel.Workout extends Marionette.ItemView
    template: 'workouts/panel/templates/workout'
    className: 'workout'

    modelEvents:
      'shown': -> @trigger 'workout:shown', @model

    events: ->
      'click': 'handleClick'

    initialize: ->
      @model.exercises.on 'add', => @render()
      @model.exercises.on 'change', => @render()

    markAsSelected: ->
      @$el.addClass 'selected'

    unselect: ->
      @$el.removeClass 'selected'

    handleClick: ->
      @trigger 'workout:clicked', @model
      @trigger 'workout:shown', @model

  class Panel.WorkoutSection extends Marionette.CompositeView
    template: 'workouts/panel/templates/section'
    itemView: Panel.Workout
    itemViewContainer: '.workouts'
    tagName: 'section'

    initialize: ->
      @collection = new Backbone.Collection _.toArray(@model.attributes)
      @collection.comparator = (workout) ->
        - parseInt workout.get('day')
      @collection.sort()



  class Panel.WorkoutBar extends Marionette.CompositeView
    template: 'workouts/panel/templates/bar'
    itemView: Panel.WorkoutSection
    itemViewContainer: '.sections'
    className: 'panel'

    selectedWorkoutView: null

    events:
      'click .add-workout': -> @trigger 'add:workout'

    initialize: ->

      @collection.comparator = (workout) ->
        - parseInt workout.get('month_number')
      @collection.sort()

      sections = @collection.groupBy (model) ->
        model.get('month')

      @collection = new Backbone.Collection _.toArray(sections)

      @on 'itemview:itemview:workout:clicked', (iv, iiv, workout) =>
        @trigger 'workout:clicked', workout

      @on 'itemview:itemview:workout:shown', (iv, iiv, workout) =>
        @selectWorkout iiv


    selectWorkout: (workoutView) ->
      if @selectedWorkoutView
        @selectedWorkoutView.unselect()

      workoutView.markAsSelected()
      @selectedWorkoutView = workoutView

