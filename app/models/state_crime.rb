class StateCrime < ActiveRecord::Base

  belongs_to :crime
  belongs_to :state
  validates_presence_of :crime_id, :state_id, :count , :year
end
