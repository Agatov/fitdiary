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
    'click .exercise-form .buttons .save': 'save_exercise',
    # А такой кнопки пока нет.
    'click .exercise-form .cancel': 'cancel_exercise_changes'
  }

  initialize: ->
    @exerciseForm = new Fitdiary.ExerciseForm({ model: @model })
    @exerciseView = new Fitdiary.ExerciseView({ model: @model })


  onRender: ->
    if @model.isNew()
      @exerciseFormRegion.show(@exerciseForm)
    else
      @exerciseRegion.show(@exerciseView)


  show_edit_form: ->

    @exerciseRegion.$el.hide()

    if @exerciseFormRegion.$el
      @exerciseFormRegion.$el.show()
    else
      @exerciseFormRegion.show(@exerciseForm)


    false

  show_delete_confirmation: ->
    @

  save_exercise: ->
    @exerciseForm.save()

    @exerciseFormRegion.$el.hide()

    if @exerciseRegion.$el
      @exerciseView.render()
      @exerciseRegion.$el.show()
    else
      @exerciseRegion.show(@exerciseView)


  cancel_exercise_changes: ->
    @
