class Fitdiary.ExerciseForm extends Backbone.Marionette.Layout
  template: 'exercises/exercise_form'
  className: 'exercise-form'

  @exerciseSetsForm: null
  @exerciseNameView: null

  regions: {
    setsFormRegion: '.sets-form',
    gymnasticNameRegion: '.gymnastic-name'
  }

  events: {
    'click .buttons .add-set': 'add_set'
  }

  initialize: ->
    @exerciseSetsForm = new Fitdiary.ExerciseSetsForm({ collection: @model.exercise_sets })
    @exerciseNameView = new Fitdiary.ExerciseNameView({ model: @model })

  onRender: ->
    @setsFormRegion.show(@exerciseSetsForm)
    @gymnasticNameRegion.show(@exerciseNameView)

  save: ->
    if !@model.get('id')
      @create_exercise()
    else
      @update_exercise()


  create_exercise: ->
    @model.set({gymnastic_name:  @exerciseNameView.ui.name.val()})
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
    @model.set({gymnastic_name:  @exerciseNameView.ui.name.val()})
    @model.save() if @model.hasChanged()
    @exerciseSetsForm.update()

  add_set: ->
    @exerciseSetsForm.add_set()
