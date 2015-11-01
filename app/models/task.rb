class Task < ActiveRecord::Base
belongs_to:members
belongs_to:sprints
belongs_to:user_story
end
