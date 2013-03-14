class Fitdiary.ExercisesView extends Backbone.Marionette.CollectionView
  itemView: Fitdiary.ExerciseContainerView
  emptyView: Fitdiary.NoExercisesView
  className: 'exercises'