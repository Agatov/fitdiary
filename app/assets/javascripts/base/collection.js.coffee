class window.Collection

  constructor: (options = {}) ->

    if options.data
      @data = data

    if options.parent
      @parent = parent

    @resource_model_name = null
    @elements = []

    @initialize()


  initialize: ->



  get: ->
    _this = @

    $.get(
      @url(),
      (data) ->
        unless data.status
          _this.fetch(data)
    )

  fetch: (resources_array) ->
    @fetch_resource(resource) for resource in resources_array

  fetch_resource: (resource) ->
    element = new window[@resource_model_name]
    element.fetch(resource)
    @elements.push element





