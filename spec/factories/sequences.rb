FactoryGirl.define do
  sequence :n do |n|
    "#{n}_#{SecureRandom.hex.first(5)}"
  end

  sequence :i do |i|
    i * 100 + rand(100)
  end
end
