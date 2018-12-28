require 'rails_helper'

RSpec.describe "mails/new", type: :view do
  before(:each) do
    assign(:mail, Mail.new(
      :text => "MyText",
      :newsletter => ""
    ))
  end

  it "renders new mail form" do
    render

    assert_select "form[action=?][method=?]", mails_path, "post" do

      assert_select "textarea[name=?]", "mail[text]"

      assert_select "input[name=?]", "mail[newsletter]"
    end
  end
end
