class window.Model

  constructor: (options = {}) ->

    if options.data
      @data = options.data

    if options.parent
      @parent = options.parent


    @initialize_attrs()

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
    _this = @
    _.each(data, (value, key) ->
      console.log("#{key} / #{value}")
      if _this.attrs[key] or _this.attrs[key] == null
        _this.attrs[key] = value
      else if _this.collections[key]
        _this.collections[key].fetch(value)
    )


  url: (id) ->
    