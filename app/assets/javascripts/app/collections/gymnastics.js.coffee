class Fitdiary.Gymnastics extends Backbone.Collection
  model: Fitdiary.Gymnastic
  search_string: null

  url: ->
    if @search_string
      "/gymnastics.json?s=#{@search_string}"
    else
      '/gymnastics.json'


  initialize: ->
    @picked_item_key = null
    @selected_item_key = null

  # @todo - отрефакторить этот метод
  select_next: ->

    if @selected_item_key == null
      @selected_item_key = 0
      @models[@selected_item_key].set('selected', true)
    else if @selected_item_key == @models.length - 1
      @models[@selected_item_key].set('selected', false)
      @selected_item_key = 0
      @models[@selected_item_key].set('selected', true)
    else
      @models[@selected_item_key].set('selected', false)
      @selected_item_key += 1
      @models[@selected_item_key].set('selected', true)


  # @todo - реализовать этот метод
  select_prev: ->

  get_selected: ->
    @models[@selected_item_key]
