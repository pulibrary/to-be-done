require "rails_helper"

RSpec.describe "users/index" do
  it "displays all users" do
    assign(:users, [
      User.create(:first_name => "Alina", :last_name => "Starkov"),
      User.create(:first_name => "Malyen", :last_name => "Oretsev"),
      User.create(:first_name => "Alexander", :last_name => "Morzova")
    ])

    render

    expect(rendered).to match /Alina Starkov/
    expect(rendered).to match /Malyen Oretsev/
    expect(rendered).to match /Alexander Morzova/
  end

  it "has link to add new user" do
    assign(:users, [User.create(:first_name => "Alina", :last_name => "Starkov")])

    render

    expect(rendered).to have_link "Add New User"
  end
end
