require "rails_helper"

RSpec.describe "users/show" do
  let(:new_user) { User.create(:first_name => "Alina", :last_name => "Starkov") }
  before(:each) do
    assign(:user, new_user)
  end

  it "displays user's full name" do
    render

    expect(rendered).to match /Alina Starkov/
  end

  it "has link back to users#index" do
    render

    expect(rendered).to have_link "Home", href: root_path
  end
end
