json.array!(@user_stories) do |user_story|
  json.extract! user_story, :id, :name, :description, :ProjectId
  json.url user_story_url(user_story, format: :json)
end
