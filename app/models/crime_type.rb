class CrimeType < ActiveRecord::Base
  attr_accessible :name
  has_many :crimes
  validates_presence_of :name
end
