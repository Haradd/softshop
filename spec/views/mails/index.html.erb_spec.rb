require 'rails_helper'

RSpec.describe "mails/index", type: :view do
  before(:each) do
    assign(:mails, [
      Mail.create!(
        :text => "MyText",
        :newsletter => ""
      ),
      Mail.create!(
        :text => "MyText",
        :newsletter => ""
      )
    ])
  end

  it "renders a list of mails" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
