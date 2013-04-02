class Fitdiary.ExerciseForm extends Backbone.Marionette.Layout
  template: 'exercises/exercise_form'
  className: 'exercise-form'

  regions: {
    setsFormRegion: '.sets-form',
    hintsRegion: '.hints'
  }

  ui: {
    gymnastic_name: 'input[name=gymnastic_name]'
  }

  events: {
    'click .buttons .add-set': 'add_set'
    'focus input ': 'show_hints',
    'focusout input': 'hide_hints',
    'keydown input': 'input_keydown'
  }

  initialize: ->
    @exerciseSetsForm = new Fitdiary.ExerciseSetsForm({ collection: @model.exercise_sets })

  onRender: ->
    @setsFormRegion.show(@exerciseSetsForm)

  save: ->
    if !@model.get('id')
      @create_exercise()
    else
      @update_exercise()


  create_exercise: ->
    @model.set({gymnastic_name: @ui.gymnastic_name.val()})
    @exerciseSetsForm.create()
    @model.prepare_attributes()
    @model.save(
      null,
      {
      success: (model, response) =>
        @model.set(response)
        @model.update_exercise_sets_ids()
      }
    )

  update_exercise: ->
    @exerciseSetsForm.update()

  add_set: ->
    @exerciseSetsForm.add_set()
    console.log(@exerciseSetsForm.collection)

  show_hints: ->
    gs = new Fitdiary.Gymnastics
    gs.fetch()

    @gymnasticHints = new Fitdiary.GymnasticsListView({ collection:  gs})
    @hintsRegion.show(@gymnasticHints)

    console.log(@gymnasticHints)

  hide_hints: ->
    @hintsRegion.close()


  input_keydown: (e) ->
    if e.keyCode == 40 #key down
      @next_hint()

    else if e.keyCode == 38 # key up
      @prev_hint()

    else if e.keyCode == 13 # Enter
      @pick_hint()

    else if e.keyCode == 27 # Escape
      console.log('escape pressed')


  next_hint: ->
    @gymnasticHints.collection.select_next()
    @ui.gymnastic_name.val(@gymnasticHints.collection.get_selected().get('name'))


  prev_hint: ->

  pick_hint: ->
    @ui.gymnastic_name.val(@gymnasticHints.collection.get_selected().get('name'))
