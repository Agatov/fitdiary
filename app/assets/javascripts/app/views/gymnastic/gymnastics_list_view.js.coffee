class Fitdiary.GymnasticsListView extends Backbone.Marionette.CollectionView
  itemView: Fitdiary.GymnasticsListItemView
  emptyView: Fitdiary.GymnasticsListNoItemView
  className: 'gymnastics'

  mouseIsOverDropdown: false

  events: {
    'mouseenter': 'handle_mouseenter',
    'mouseleave': 'handle_mouseleave'
  }

  handle_mouseenter: ->
    @mouseIsOverDropdown = true

  handle_mouseleave: ->
    @mouseIsOverDropdown = false

  selectedGymnastic: ->
    @collection.get_selected()

  selectedGymnasticName: ->
    @selectedGymnastic().get('name') if @selectedGymnastic()



