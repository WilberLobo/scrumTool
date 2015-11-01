class Project < ActiveRecord::Base
has_many :user_stories , dependent: :destroy
has_many :members , dependent: :destroy
has_many :sprints , dependent: :destroy


validates :name, presence: true,
	  length: { maximum: 50}
validates :description, presence: true

end
