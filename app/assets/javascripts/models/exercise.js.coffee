class window.Exercise extends Model

  url: (id) ->
    return "/exercises/#{id}.json"

  initialize: ->
    @collections = {
      exercise_sets: new ExerciseSetsCollection()
    }



