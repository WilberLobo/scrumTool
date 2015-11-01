class UserStory < ActiveRecord::Base
belongs_to :project
has_many:tasks
validates :name, presence: true,
	  length: { maximum: 50}
validates :description, presence: true
end
