@FitdiaryApp.module "WorkoutsApp.Form", (Form, App, Backbone, Marionette, $, _) ->

  class Form.Workout extends Marionette.ItemView
    template: 'workouts/form/templates/workout'
    className: 'workout-form-dialog'

    calendar: null

    events:
      'click .save': -> @trigger 'save:button:clicked', @model
      'click .cancel': -> @trigger 'cancel:button:clicked'

    initialize: ->

      @calendar = new Backbone.UI.Calendar
        model: @model,
        date: new Date()
        onSelect: =>
          d = @calendar.date

          year = d.getFullYear()

          month = d.getMonth() + 1
          month = "0#{month}" if month < 10

          day = d.getDate()
          day = "0#{day}" if day < 10

          utc_date =  "#{year}-#{month}-#{day}"
          @model.set('date', utc_date)

          console.log @model.get('date')

    onRender: ->
      @$el.find('.my-calendar').html @calendar.render().$el

