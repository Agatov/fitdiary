attributes :id, :date, :formatted_date

child :exercises do
  extends 'exercises/nested'
end