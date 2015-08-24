# spec/factories/movies.rb
FactoryGirl.define do
  factory :movie do |f|
    f.name "Jaws"
    f.year 1980
    f.rating 7.2
    f.user_id 1
  end
end
