#= require ./app/fitdiary
#= require_tree ./app/views
#= require_tree ./app/models
#= require_tree ./app/collections

$ ->
    Fitdiary.addRegions({
      workouts_region: '#workouts',
      navbar_region: '#navbar'
    })

    Fitdiary.addInitializer( ->
      Fitdiary.workouts = new Fitdiary.Workouts
      Fitdiary.workouts_region.show(new Fitdiary.WorkoutsView({ collection: Fitdiary.workouts }))
      Fitdiary.navbar_region.show(new Fitdiary.NavbarView)
    )

    Fitdiary.start()

    Fitdiary.workouts.fetch()