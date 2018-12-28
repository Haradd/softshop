require 'rails_helper'

RSpec.describe "newsletters/new", type: :view do
  before(:each) do
    assign(:newsletter, Newsletter.new(
      :title => "MyString",
      :product_name => "MyString"
    ))
  end

  it "renders new newsletter form" do
    render

    assert_select "form[action=?][method=?]", newsletters_path, "post" do

      assert_select "input[name=?]", "newsletter[title]"

      assert_select "input[name=?]", "newsletter[product_name]"
    end
  end
end
