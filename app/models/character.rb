class Character < ActiveRecord::Base
  has_many :main_quotes

  def self.get_quote
    last.main_quotes.first.quote.gsub("name", User.find(1).name )
  end

end
