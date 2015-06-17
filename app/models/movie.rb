class Movie < ActiveRecord::Base
  belongs_to :user
  has_many :actors

  accepts_nested_attributes_for :actors

end
