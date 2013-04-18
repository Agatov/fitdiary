attributes :id, :gymnastic_name

child :exercise_sets => :sets do
  extends 'sets/base'
end