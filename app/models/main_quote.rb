# == Schema Information
#
# Table name: main_quotes
#
#  id           :integer          not null, primary key
#  quote        :text
#  character_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class MainQuote < ActiveRecord::Base
  belongs_to :character
end
