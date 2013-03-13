Backbone.Marionette.Renderer.render = (template, data) ->
  if (!JST[template])
    throw "Template '" + template + "' not found!"
  return JST[template](data)


window.Fitdiary = new Backbone.Marionette.Application()