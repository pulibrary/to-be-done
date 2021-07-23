require "rails_helper"

RSpec.describe "users/_form.html.erb" do
  it "renders user form" do
    render partial: "users/form", locals: { user: User.new }

    expect(rendered).to have_field "First name"
    expect(rendered).to have_field "Last name"
    expect(rendered).to have_selector "input[type='submit']"
  end
end
