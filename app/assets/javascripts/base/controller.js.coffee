class window.Controller

  constructor: ->
    @exercise = null

  initialize: (id) ->
    @exercise = new Exercise()
    @exercise.get(1)

    @exerciseView = new View(@exercise)
    @exerciseView.render()

