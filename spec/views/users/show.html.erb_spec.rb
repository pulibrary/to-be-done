require "rails_helper"

RSpec.describe "users/show" do
  before(:each) do
    assign(:user, User.create(:first_name => "Alina", :last_name => "Starkov"))
  end

  it "displays user's full name" do
    render

    expect(rendered).to match /Alina Starkov/
  end

  it "has link back to index" do
    render

    expect(rendered).to have_link "Back to Users"
  end
end
