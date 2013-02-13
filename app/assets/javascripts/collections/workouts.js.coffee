class window.WorkoutsCollection extends Collection

  url: ->
    "/workouts.json"

  initialize: ->
    @resource_model_name = "Workout"
    @get()