@FitdiaryApp.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.ExerciseSet extends Backbone.Model

    hidden: false

    validation:
      weight:
        required: true
        min: 1
        msg: 'incorrect weight'
      repeats:
        required: true
        min: 1
        msg: 'blank repeats'

    url: ->
      if @isNew()
        "/exercises/#{@collection.exercise.get('id')}/sets"
      else
        "/sets/#{@get('id')}"

    isHidden: ->
      @hidden

    hide: ->
      if @isNew()
        @destroy()
      else
        @hidden = true
        @.trigger 'hide'

    unhide: ->
      @hidden = false

    revert: ->
      _.each @changedAttributes(), (attributeValue, attributeName) =>
        unless attributeName == 'id'
          @set(attributeName, @previous(attributeName))



  class Entities.ExerciseSets extends Backbone.Collection
    model: Entities.ExerciseSet

    exercise: null

    initialize: (models, options = {}) ->
      if options.exercise
        @exercise = options.exercise


    getChangedModels: ->
      _.filter @models, (model) ->
        model.hasChanged()

    getHiddenModels: ->
      _.filter @models, (model) ->
        model.isHidden()

    # Модели, которые были созданы и не изменены
    getFreshModels: ->
      _.filter @models, (model) ->
        (model.isNew() and !model.hasChanged())

    getNewModels: ->
      _.filter @models, (model) ->
        model.isNew()

    getPresentModels: ->
      _.filter @models, (model) ->
        !model.isNew()

    saveChanged: ->
      _.each @getChangedModels(), (model) ->
        model.save()

    saveFresh: ->
      _.each @getFreshModels(), (model) ->
        model.save()

    saveAll: ->
      _.each @models, (model) ->
        model.save()

    destroyHiddenModels: ->
      _.each  @getHiddenModels(), (model) ->
        model.destroy()

    destroyNewModels: ->
      model.destroy() for model in @getNewModels()
      @trigger 'new:models:destroyed'

    revert: ->
      _.each @getPresentModels(), (model) =>
          model.revert()

      _.each @models, (model) ->
        model.unhide() if model.isHidden()


    validate: ->
      model.validate() for model in @models

    # @todo - кривая какая-то реализация ;)
    isValid: ->
      invalidModel = @find (model) ->
        !model.isValid()

      return true if invalidModel == undefined
      false