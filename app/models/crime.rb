class Crime < ActiveRecord::Base

  belongs_to :crime_type
  has_many :state_crimes
  has_many :states , through: :state_crimes
  validates_presence_of :crime_type_id, :name
end
