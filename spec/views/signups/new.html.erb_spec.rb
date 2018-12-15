require 'rails_helper'

RSpec.describe "signups/new", type: :view do
  before(:each) do
    assign(:signup, Signup.new(
      :active => false,
      :customer_id => "",
      :newsletter_id => ""
    ))
  end

  it "renders new signup form" do
    render

    assert_select "form[action=?][method=?]", signups_path, "post" do

      assert_select "input[name=?]", "signup[active]"

      assert_select "input[name=?]", "signup[customer_id]"

      assert_select "input[name=?]", "signup[newsletter_id]"
    end
  end
end
