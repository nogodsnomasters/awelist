class List < ActiveRecord::Base
  default_scope { order :position }
  has_many :tasks
  validates :title, presence: true
end
