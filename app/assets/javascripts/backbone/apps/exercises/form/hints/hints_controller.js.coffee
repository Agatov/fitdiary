@FitdiaryApp.module "ExercisesApp.Form.Hints", (Hints, App, Backbone, Marionette, $, _) ->

  Hints.Controller =

    showHints: (inputView) ->

      gymnastics = App.request 'gymnastic:entities', inputView.ui.name.val()
      gymnasticHintsView = new Hints.GymnasticHints({ collection: gymnastics })

      gymnasticHintsView.on 'itemview:mouseenter', (iv, set) ->
        gymnastics.selectOne(set)

      inputView.on 'down:key:pressed', ->
        unless inputView.dropdownClosed  # дублирование кода
          gymnastics.selectNext()
          @.setNameValue gymnastics.getSelectedName()

      inputView.on 'up:key:pressed', ->
        unless inputView.dropdownClosed # дублирование кода
          gymnastics.selectPrevious()
          @.setNameValue gymnastics.getSelectedName()


      # При нажатии Enter поле меняет значение на значение выделенного в момент нажатия хинта
      # Дродаун закрывается
      inputView.on 'enter:key:pressed', =>
        if gymnastics.getSelected()
          inputView.setNewValue if gymnastics.getSelectedName()

        @closeHints inputView


      # При нажатии Escape, устанавливается значение поля до открытия дропдауна
      # и дропдаун закрывается
      inputView.on 'escape:key:pressed', =>
        unless inputView.dropdownClosed # дублирование кода
          inputView.setDefaultValue()
          @closeHints inputView


      inputView.initDefaultValue()
      inputView.hintsRegion.show gymnasticHintsView
      inputView.dropdownClosed = false # @todo Сделать это функцией?



    updateHints: (inputView) ->
      gymnastics = App.request('gymnastic:present:entities')
      inputView.inputDefaultValue = inputView.ui.name.val()
      gymnastics.searchString = inputView.ui.name.val()
      gymnastics.fetch()




    hideHints: (inputView) ->
      gymnasticHintsView = inputView.hintsRegion.currentView

      # Если мышка не над дропдауном, то просто скидываем значение на предыдущее
      unless gymnasticHintsView.mouseIsOverDropdown
        inputView.setDefaultValue()

      # Если курсор мыши над дропдауном, то был произведен клик по одному из хинтов
      if gymnasticHintsView.mouseIsOverDropdown
        inputView.setNewValue gymnasticHintsView.collection.getSelectedName()

      @closeHints inputView



    closeHints: (inputView) ->
      inputView.hintsRegion.close()
      # @todo Сделать это функцией?
      inputView.dropdownClosed = true


