attributes :id, :date, :formatted_date, :month, :exercises_preview

child :exercises do
  extends 'exercises/nested'
end