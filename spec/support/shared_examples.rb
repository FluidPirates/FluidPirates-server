RSpec.shared_examples "a working request" do
  it "works" do
    subject
    assert_response_200
  end
end
