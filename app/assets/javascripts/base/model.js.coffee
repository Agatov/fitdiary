class window.Model

  constructor: (options = {}) ->

    if options.data
      @data = options.data

    if options.parent
      @parent = options.parent

    @initialize_attrs()

    @initialize()


  initialize_attrs: ->
    @attrs = {id: null}

  get: (id) ->

    _this = @

    $.get(
      @url(id),
      (data) ->
        if data.status == 'ok'
          _this.fetch(data)
        
    )

  fetch: (data) ->
    _.each(@attrs, (value, key) ->
      if data[@name][key]
        @attrs[key] = value
    )


  url: (id) ->
    