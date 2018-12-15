require 'rails_helper'

RSpec.describe "signups/show", type: :view do
  before(:each) do
    @signup = assign(:signup, Signup.create!(
      :active => false,
      :customer_id => "",
      :newsletter_id => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
