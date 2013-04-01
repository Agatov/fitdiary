class Fitdiary.ExerciseSetForm extends Backbone.Marionette.ItemView
  template: 'exercise_sets/exercise_set_form'
  className: 'row'

  ui: {
    weight: 'input[name=weight]',
    repeats: 'input[name=repeats]'
  }

  events: {
    'click .remove-set': 'remove'
  }

  update: ->
    @update_attributes()
    @model.save()


  update_attributes: ->
    @model.set({
      weight: @ui.weight.val(),
      repeats: @ui.repeats.val()
    })

  remove: ->
    @model.destroy()
    @el.remove()
