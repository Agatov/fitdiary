attributes :id, :date, :day, :month_number, :formatted_date, :month

child :exercises do
  extends 'exercises/nested'
end