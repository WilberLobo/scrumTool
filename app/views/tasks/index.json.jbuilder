json.array!(@tasks) do |task|
  json.extract! task, :id, :name, :status, :user_story_id, :sprint_id, :member_id, :man_hours
  json.url task_url(task, format: :json)
end
