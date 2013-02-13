class window.Model

  constructor: (options = {}) ->

    if options.data
      @data = options.data

    if options.parent
      @parent = options.parent


    @initialize_attrs

    @initialize()


  initialize_attrs: (attrs = {}) ->

    if attrs
      @attrs = attrs
      @attrs["id"] = null
    else
      @attrs = {id: null}
    
    @collections = {}

  get: (id) ->

    _this = @

    $.get(
      @url(id),
      (data) ->
        unless data.status
          _this.fetch(data)
        
    )

  fetch: (data) ->
    _.each(data, (value, key) =>
      console.log("#{key} / #{value}")
      if @.attrs[key] or @.attrs[key] == null
        @.attrs[key] = value
      else if @.collections[key]
        @.collections[key].fetch(value)
    )


  url: (id) ->
    