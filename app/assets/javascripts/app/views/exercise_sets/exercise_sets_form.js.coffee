class Fitdiary.ExerciseSetsForm extends Backbone.Marionette.CollectionView
  itemView: Fitdiary.ExerciseSetForm

  update: ->
    @children.each((child) ->
      child.update()
    )

  add_set: ->
    @collection.add({
      weight: @children.last().ui.weight.val(),
      repeats: @children.last().ui.repeats.val()
    })