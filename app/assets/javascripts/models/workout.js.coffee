class window.Workout

  url: (id) ->
    return "/exercises/#{id}.json"

  initialize: ->
    @collections = {
      exercise_sets: new ExerciseSetsCollection()
    }

    @initialize_attrs({
      date: null
    })