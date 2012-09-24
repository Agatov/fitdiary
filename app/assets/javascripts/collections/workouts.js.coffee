class window.WorkoutsCollection

  url: "/workouts.json"
  workouts: []

  constructor: ->
    @initialize()


  # #
  # Метод производит первичную инициализацию и подсасывает тренировки.
  # #
  initialize: ->
    _this = @
    $.get(
      @url,
      (data) ->
        if data.status == 'ok'
          _this.add_workout(workout) for workout in data.workouts
        else
          # Выбрасываем исключение

    )

  # #
  # Добавляет тренировку в коллекцию
  # #
  add_workout: (data) ->
    workout = new Workout(data, @)
    @workouts.push workout