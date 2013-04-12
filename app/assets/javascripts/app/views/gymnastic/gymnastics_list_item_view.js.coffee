class Fitdiary.GymnasticsListItemView extends Backbone.Marionette.ItemView
  template: 'gymnastics/list_item'
  className: 'gymnastic'

  modelEvents: {
    'change': 'modelChanged'
  }

  events: {
    'mouseenter': 'select_model',
    'click': 'item_click'
  }

  modelChanged: ->
    if @model.selected()
      @$el.addClass('selected')
    else if @model.not_selected() and @$el.hasClass('selected')
      @$el.removeClass('selected')


  # @todo - ну говнокод редкостный же.
  select_model: ->
    @model.collection.select_one(@model)

  item_click: ->
    console.log('asdasdasd')