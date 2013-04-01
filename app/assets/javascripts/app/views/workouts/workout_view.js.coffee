class Fitdiary.WorkoutView extends Backbone.Marionette.Layout
  template: 'workouts/workout_view'
  className: 'workout'

  regions: {
    bodyRegion: '.body'
  }

  events: {
    'click .add-exercise': 'add_exercise'
  }

  initialize: ->
    @exercisesView = new Fitdiary.ExercisesView({collection: @model.exercises })

  onRender: ->
    @bodyRegion.show(@exercisesView)

  # Добавляем пустое упражнение с одним подходом
  add_exercise: ->
    @model.exercises.add({gymnastic_name: 'какое-то упражнение', exercise_sets: [{weight: 0, repeats: 0}]})
