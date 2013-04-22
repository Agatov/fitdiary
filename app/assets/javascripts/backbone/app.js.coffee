@FitdiaryApp = do (Backbone, Marionette) ->

  App = new Marionette.Application

  App.addRegions
    mainRegion: '#main-region',
    workoutsRegion: '#workouts-list-region',
    dialogRegion: '#dialog-region'


#  App.addInitializer ->
#    App.module("HeaderApp").start()
#    App.module("FooterApp").start()

  App.on 'initialize:after', ->
    if Backbone.history
      Backbone.history.start()

  App