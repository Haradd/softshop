require 'rails_helper'

RSpec.describe "mails/show", type: :view do
  before(:each) do
    @mail = assign(:mail, Mail.create!(
      :text => "MyText",
      :newsletter => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
