class Sprint < ActiveRecord::Base
has_many :tasks , dependent: :destroy
belongs_to :project
end
