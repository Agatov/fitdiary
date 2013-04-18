@FitdiaryApp.module "ExercisesApp.Form", (Form, App, Backbone, Marionette, $, _) ->

  Form.Controller =

    New: (workout) ->
      exercise = App.request 'new:exercise'
      workout.exercises.add exercise

      formView = @getFormView(exercise)
      App.dialogRegion.show formView


    Edit: (exercise) ->
      formView = @getFormView(exercise)
      App.dialogRegion.show formView


    Create: (exercise) ->
      exercise.save null,
        success: ->
          exercise.sets.saveAll()


    Update: (exercise) ->
      exercise.saveIfChanged()
      exercise.sets.saveChanged()
      exercise.sets.saveFresh()
      exercise.sets.destroyHiddenModels()

    Cancel: (exercise) ->
      if exercise.isNew()
        exercise.destroy()
      else
        exercise.revert()
        exercise.sets.revert()


    Destroy: (exercise) ->



    Close: ->
      App.dialogRegion.close()




    getFormView: (exercise) ->
      formView = new Form.Exercise
        model: exercise

      # @todo - Возможно здесь стоит держать только определение колбэков,
      # @todo -> а реализацию вынести куда-нибудь в другое место

      formView.on 'exercise:form:close', (exercise) ->
        App.vent.trigger 'close:exercise:form', exercise


      formView.on 'exercise:form:save', (exercise) ->
        App.vent.trigger 'close:exercise:form'
        App.vent.trigger 'save:exercise', exercise

      formView.on 'exercise:form:cancel:changes', (exercise) ->
        App.vent.trigger 'close:exercise:form'
        App.vent.trigger 'cancel:exercise:changes', exercise


      formView.on 'exercise:form:add:set', (exercise) =>
        lastSetView = formView.getLastSet()
        exercise.addSet lastSetView.ui.weight.val(), lastSetView.ui.repeats.val()

      formView.on 'exercise:form:remove:set', (exercise, set) ->
        set.hide()

      formView.on 'exercise:form:name:show:hints', (inputView) ->
        Form.Hints.Controller.showHints inputView

      formView.on 'exercise:form:name:hide:hints', (inputView) ->
        Form.Hints.Controller.hideHints inputView

      formView.on 'exercise:form:name:update:hints', (inputView) ->
        Form.Hints.Controller.updateHints inputView

      formView.on 'exercise:form:name:update:value', (inputView) ->
        exercise.set 'gymnastic_name', inputView.ui.name.val()




