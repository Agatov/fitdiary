class Fitdiary.ExerciseContainerView extends Backbone.Marionette.Layout
  template: 'exercises/exercise_container'
  className: 'exercise-container'

  regions: {
    exerciseRegion: '.exercise',
    exerciseFormRegion: '.exercise-form'
  }

  events: {
    'click .exercise .actions .edit': 'show_edit_form',
    'click .exercise .actions .delete': 'show_delete_confirmation',
    'click .exercise-form .save': 'save_exercise',
    'click .exercise-form .cancel': 'cancel_exercise_changes'
  }

  initialize: ->
    @exerciseView = new Fitdiary.ExerciseView({model: @model})
    @exerciseForm = new Fitdiary.ExerciseForm({model: @model})


  onRender: ->
    @exerciseRegion.show(@exerciseView)


  show_edit_form: ->
    @exerciseRegion.$el.hide()
    @exerciseFormRegion.show(@exerciseForm)
    @exerciseFormRegion.$el.show()

  show_delete_confirmation: ->

  save_exercise: ->
    @exerciseForm.changeName()
    @exerciseFormRegion.$el.hide()
    @exerciseView.render()
    @exerciseRegion.$el.show()

  cancel_exercise_changes: ->
    @
