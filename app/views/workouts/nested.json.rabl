attributes :id, :date, :day, :formatted_date, :month

child :exercises do
  extends 'exercises/nested'
end