class Character < ActiveRecord::Base
  has_many :main_quotes

  def get_quote(user)
    main_quotes.first.quote.gsub("name", user.name )
  end

end
