class window.Workout extends Model

  url: (id) ->
    return "/exercises/#{id}.json"

  initialize: ->
    console.log('initializing workout collections')
    @collections = {
      exercises: new ExercisesCollection()
    }

    @initialize_attrs({
      date: null
    })