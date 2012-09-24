class window.Workout

  attrs: {
    id: null,
    date: null
  }

  constructor: (data, collection) ->
    @collection = collection
    @exercises_collection = null
    @initialize(data)


  initialize: (data) ->
    @attrs.id = data.id
    @attrs.date = data.date

    @exercises_collection = new ExercisesCollection(data.exercises, @)