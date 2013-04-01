class Fitdiary.WorkoutsView extends Backbone.Marionette.CollectionView
  itemView: Fitdiary.WorkoutView
  emptyView: Fitdiary.NoWorkoutsView

  appendHtml: (collectionView, itemView) ->
    if itemView.model.isNew()
      collectionView.$el.prepend(itemView.$el)
    else
      collectionView.$el.append(itemView.$el)