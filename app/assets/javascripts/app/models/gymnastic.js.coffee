class Fitdiary.Gymnastic extends Backbone.Model

  selected: ->
    @get('selected')

  not_selected: ->
    !@get('selected')

  select: ->
    @set('selected', true)

  unselect: ->
    @set('selected', false)

