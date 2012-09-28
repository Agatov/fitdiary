class window.Exercise extends Model

  url: (id) ->
    return "/exercises/#{id}.json"
  
  ###
  constructor: (data, collection) ->

    @attrs =  {
      id: null,
      gymnastic: {
        id: null,
        name: null
      }
    }

    @collection = collection
    @exercise_sets_collection = null
    @initialize(data)
  ###

  initialize: ->
    #@attrs.id = data.id
    #@attrs.gymnastic.id = data.gymnastic.id
    #@attrs.gymnastic.name = data.gymnastic.name

    #@exercise_sets_collection = new ExerciseSetsCollection(data.exercise_sets, @)

    @model_name = "exercise"
    @collections = {
      exercise_sets: new ExerciseSetsCollection()
    }



