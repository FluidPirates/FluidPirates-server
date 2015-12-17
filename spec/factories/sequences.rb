FactoryGirl.define do
  sequence :n do |n|
    "#{n}_#{SecureRandom.hex.first(5)}"
  end
end
