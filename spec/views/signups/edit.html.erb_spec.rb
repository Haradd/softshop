require 'rails_helper'

RSpec.describe "signups/edit", type: :view do
  before(:each) do
    @signup = assign(:signup, Signup.create!(
      :active => false,
      :customer_id => "",
      :newsletter_id => ""
    ))
  end

  it "renders the edit signup form" do
    render

    assert_select "form[action=?][method=?]", signup_path(@signup), "post" do

      assert_select "input[name=?]", "signup[active]"

      assert_select "input[name=?]", "signup[customer_id]"

      assert_select "input[name=?]", "signup[newsletter_id]"
    end
  end
end
