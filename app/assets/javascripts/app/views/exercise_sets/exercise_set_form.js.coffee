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
    @model.save() if @model.hasChanged()


  update_attributes: ->
    @model.set({
      weight: parseFloat(@ui.weight.val()),
      repeats: parseInt(@ui.repeats.val())
    })

  remove: ->
    @model.destroy()
    @el.remove()
