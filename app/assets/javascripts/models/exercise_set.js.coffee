class window.ExerciseSet extends Model

  initialize: ->


  initialize_attrs: ->
    super
    @attrs = {
      id: null,
      weight: null,
      repeats: null,
    }