class Workout < ActiveRecord::Base
  attr_accessible :comment, :date, :user_id

  has_many :exercises
  belongs_to :workout

  # @todo -> вынести в декоратор
  def formatted_date
    I18n.localize date, format: :workout_title
  end

  # Мы отдаем день, чтобы по нему соритровать коллекцию, отображающую тренировки за месяц.
  # Скорее всего день можно получать уже и на клиенте, исходя из даты, но так пока быстрее.
  def day
    date.strftime '%d'
  end

  def month_number
    (date.strftime '%m').to_i
  end

  def month
    I18n.localize date, format: :only_month
  end

  # @param [String] gymnastic_name
  # @return [Exercise]
  def add_exercise(gymnastic_name)
    gymnastic = Gymnastic.find_or_create_by_name(gymnastic_name)
    exercises.create(gymnastic: gymnastic)
  end
end
