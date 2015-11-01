json.array!(@sprints) do |sprint|
  json.extract! sprint, :id, :name, :duration, :start_date, :end_date, :project_id
  json.url sprint_url(sprint, format: :json)
end
