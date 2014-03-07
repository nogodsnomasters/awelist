class Task < ActiveRecord::Base
  belongs_to :list
  validates_presence_of :name 
  default_scope { order starred: :desc, complete: :asc, date_due: :asc  }
end
