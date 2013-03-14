class Fitdiary.ExerciseForm extends Backbone.Marionette.Layout
  template: 'exercises/exercise_form'
  className: 'exercise-form'

  regions: {
    setsFormRegion: '.sets-form'
  }

  ui: {
    gymnastic_name: 'input[name=gymnastic_name]'
  }

  events: {
    'click .add-set': 'add_set'
  }

  initialize: ->
    @exerciseSetsForm = new Fitdiary.ExerciseSetsForm({ collection: @model.exercise_sets })

  onRender: ->
    @setsFormRegion.show(@exerciseSetsForm)

  changeName: ->
    @model.set({gymnastic_name: @ui.gymnastic_name.val()})
    @exerciseSetsForm.update()

  add_set: ->
    @exerciseSetsForm.add_set()