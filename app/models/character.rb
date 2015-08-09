# == Schema Information
#
# Table name: characters
#
#  id             :integer          not null, primary key
#  name           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  main_image     :string
#  negative_image :string
#  positive_image :string
#

class Character < ActiveRecord::Base
  has_many :main_quotes

  def get_quote(user)
    main_quotes.first.quote.gsub("name", user.name )
  end

end
