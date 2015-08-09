# == Schema Information
#
# Table name: beer_quotes
#
#  id           :integer          not null, primary key
#  quote        :text
#  character_id :integer
#  positive     :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class BeerQuote < ActiveRecord::Base
  belongs_to :character
end
