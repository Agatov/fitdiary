#= require_self
#= require_tree ./base
#= require_tree ./models
#= require_tree ./collections
#= require_tree ./views

$ ->
  window.workouts = new WorkoutsCollection()