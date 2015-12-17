FactoryGirl.define do
  sequence :n do |n|
    "#{n} (#{SecureRandom.hex.first(5)})"
  end
end
