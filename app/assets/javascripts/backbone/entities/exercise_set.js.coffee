@FitdiaryApp.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  #
  # @todo - removed возможно правильнее делать не свойством, а методом. И запретить прямой доступ к свойству.
  #

  class Entities.ExerciseSet extends Backbone.Model

    hidden: false

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

    revert: ->
      _.each @models, (model) ->
        model.revert()

      _.each @model, (model) ->
        model.unhide() if @model.isHidden()