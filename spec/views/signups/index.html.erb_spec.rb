require 'rails_helper'

RSpec.describe "signups/index", type: :view do
  before(:each) do
    assign(:signups, [
      Signup.create!(
        :active => false,
        :customer_id => "",
        :newsletter_id => ""
      ),
      Signup.create!(
        :active => false,
        :customer_id => "",
        :newsletter_id => ""
      )
    ])
  end

  it "renders a list of signups" do
    render
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
