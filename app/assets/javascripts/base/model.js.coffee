class window.Model

  constructor: (options = {})

    if options.data
      @data = options.data

    if options.parent
      @parent = options.parent

    @initialize_attrs()

    @initialize()


  initialize_attrs: ->
    @attrs = {id: null}