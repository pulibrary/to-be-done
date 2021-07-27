require "rails_helper"

RSpec.describe "users/index" do
  it "displays links to all users" do
    assign(:users, [
      User.create(:first_name => "Alina", :last_name => "Starkov"),
      User.create(:first_name => "Malyen", :last_name => "Oretsev"),
      User.create(:first_name => "Alexander", :last_name => "Morzova")
    ])

    render

    expect(rendered).to have_link "Alina Starkov", href: "/users/1"
    expect(rendered).to have_link "Malyen Oretsev", href: "/users/2"
    expect(rendered).to have_link "Alexander Morzova", href: "/users/3" 
  end

  it "has link to add new user" do
    assign(:users, [User.create(:first_name => "Alina", :last_name => "Starkov")])

    render

    expect(rendered).to have_link "Add New User", href: new_user_path
  end
end
