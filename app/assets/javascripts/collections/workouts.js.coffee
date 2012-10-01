class window.WorkoutsCollection

  url: ->
    "/workouts.json"

  initialize: ->
    @resource_model_name = "Workout"