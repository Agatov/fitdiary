class window.ExerciseSet

  constructor: (data, collection) ->

    @attrs = {
      id: null,
      weight: null,
      repeats: null,
    }

    @collection = collection
    @initialize(data)


  initialize: (data) ->