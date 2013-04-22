@FitdiaryApp.module "WorkoutsApp.Panel", (Panel, App, Backbone, Marionette, $, _) ->

  class Panel.Workout extends Marionette.ItemView
    template: 'workouts/panel/templates/workout'
    className: 'workout'

    events: ->
      'click': -> @trigger 'workout:clicked', @model

    markAsSelected: ->
      @$el.addClass 'selected'

    unselect: ->
      @$el.removeClass 'selected'

  class Panel.WorkoutSection extends Marionette.CompositeView
    template: 'workouts/panel/templates/section'
    itemView: Panel.Workout
    itemViewContainer: '.workouts'
    tagName: 'section'

    initialize: ->
      @collection = new Backbone.Collection _.toArray(@model.attributes)

  class Panel.WorkoutBar extends Marionette.CompositeView
    template: 'workouts/panel/templates/bar'
    itemView: Panel.WorkoutSection
    itemViewContainer: '.sections'
    className: 'panel'

    selectedWorkout: null

    initialize: ->
      sections = @collection.groupBy (model) ->
        model.get('month')

      @collection = new Backbone.Collection _.toArray(sections)

      @.on 'itemview:itemview:workout:clicked', (iv, iiv, workout) =>
        @selectWorkout iiv
        @trigger 'workout:clicked', workout


    selectWorkout: (workout) ->
      if @selectedWorkout
        @selectedWorkout.unselect()

      workout.markAsSelected()
      @selectedWorkout = workout

