class Fitdiary.ExercisesView extends Backbone.Marionette.CollectionView
  itemView: Fitdiary.ExerciseView
  emptyView: Fitdiary.NoExercisesView
  className: 'exercises'