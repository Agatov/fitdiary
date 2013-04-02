class Fitdiary.GymnasticsListItemView extends Backbone.Marionette.ItemView
  template: 'gymnastics/list_item'
  className: 'gymnastic'

  modelEvents: {
    'change': 'modelChanged'
  }

  modelChanged: ->
    if @model.get('selected')
      @$el.addClass('selected')
    else if @model.get('selected') == false and @$el.hasClass('selected')
      @$el.removeClass('selected')