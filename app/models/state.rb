class State < ActiveRecord::Base
  attr_accessible :name
  has_many :state_crimes
  has_many :crimes , through: :state_crimes
  validates_presence_of :name
end
