@FitdiaryApp.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Gymnastic extends Backbone.Model

    selected: ->
      @get('selected')

    not_selected: ->
      !@get('selected')

    select: ->
      @set('selected', true)

    deselect: ->
      @set('selected', false)

  class Entities.Gymnastics extends Backbone.Collection
    model: Entities.Gymnastic
    searchString: null

    selectedItemKey: null

    url: ->
      if @searchString
        "/gymnastics?s=#{@searchString}"
      else
        '/gymnastics'


    initialize: (models, options = {}) ->
      @searchString = options.searchString if options.searchString


    selectNext: ->
      if @selectedItemKey == null
        @selectedItemKey = 0

      else
        @models[@selectedItemKey].deselect()

        if @selectedItemKey == @models.length - 1
          @selectedItemKey = null
        else
          @selectedItemKey += 1

      @models[@selectedItemKey].select() unless @selectedItemKey == null


    selectPrevious: ->
      if @selectedItemKey == null
        @selectedItemKey = @models.length - 1

      else
        @models[@selectedItemKey].deselect()

        if @selectedItemKey == 0
          @selectedItemKey = null
        else
          @selectedItemKey -= 1

      @models[@selectedItemKey].select() unless @selectedItemKey == null


    getSelected: ->
      return null if @selectedItemKey == null
      @models[@selectedItemKey]

    getSelectedName: ->
      @getSelected().get('name') if @getSelected()

    selectOne: (model_to_select) ->
      @models[@selectedItemKey].deselect() if @selectedItemKey != null
      @selectedItemKey = $.inArray(model_to_select, @models)
      model_to_select.select()

  API =
    getGymnasticEntities: (searchString) ->
      gymnastics = new Entities.Gymnastics(null, searchString: searchString)
      gymnastics.fetch()

      # @todo Нормальный ли это подход?
      App.reqres.addHandler 'gymnastic:present:entities', ->
        gymnastics

      gymnastics

  App.reqres.addHandler 'gymnastic:entities', (searchString) ->
    API.getGymnasticEntities(searchString)