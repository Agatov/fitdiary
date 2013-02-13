class window.Exercise extends Model

  url: (id) ->
    return "/exercises/#{id}.json"

  initialize: ->
    console.log('exercise model initialized')
    @collections = {
      exercise_sets: new ExerciseSetsCollection()
    }



