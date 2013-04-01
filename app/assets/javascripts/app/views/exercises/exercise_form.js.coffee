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
    'click .buttons .add-set': 'add_set'
  }

  initialize: ->
    @exerciseSetsForm = new Fitdiary.ExerciseSetsForm({ collection: @model.exercise_sets })

  onRender: ->
    @setsFormRegion.show(@exerciseSetsForm)

  save: ->
    if !@model.get('id')
      @create_exercise()
    else
      @update_exercise()


  create_exercise: ->
    @model.set({gymnastic_name: @ui.gymnastic_name.val()})
    @exerciseSetsForm.create()
    @model.prepare_attributes()
    @model.save(
      null,
      {
      success: (model, response) =>
        @model.set(response)
        @model.update_exercise_sets_ids()
      }
    )

  update_exercise: ->
    @exerciseSetsForm.update()

  add_set: ->
    @exerciseSetsForm.add_set()
    console.log(@exerciseSetsForm.collection)