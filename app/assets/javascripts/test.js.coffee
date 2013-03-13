#class window.Fitdiary extends Backbone.Marionette.Application


Backbone.Marionette.Renderer.render = (template, data) ->
  if (!JST[template])
    throw "Template '" + template + "' not found!"
  return JST[template](data)






$ ->
    window.fitdiary = new Backbone.Marionette.Application()

    fitdiary.addRegions({
      workouts_region: '#workouts'
    })


    fitdiary.addInitializer( ->
      fitdiary.workouts = new Workouts
      fitdiary.workouts_region.show(new WorkoutsView({collection: fitdiary.workouts }))
    )

    fitdiary.start()

