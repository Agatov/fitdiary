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

  selectNext: ->

    if @selected_item_key == null
      @selected_item_key = 0

    else
      @models[@selected_item_key].set('selected', false)

      if @selected_item_key == @models.length - 1
        @selected_item_key = null
      else
        @selected_item_key += 1

    @models[@selected_item_key].set('selected', true) unless @selected_item_key == null


  selectPrevious: ->

    if @selected_item_key == null
      @selected_item_key = @models.length - 1

    else
      @models[@selected_item_key].set('selected', false)

      if @selected_item_key == 0
        @selected_item_key = null
      else
        @selected_item_key -= 1

    @models[@selected_item_key].set('selected', true) unless @selected_item_key == null


  get_selected: ->
    return null if @selected_item_key == null
    @models[@selected_item_key]

  select_one: (model_to_select) ->
    @models[@selected_item_key].unselect() if @selected_item_key != null
    @selected_item_key = $.inArray(model_to_select, @models)
    model_to_select.select()



