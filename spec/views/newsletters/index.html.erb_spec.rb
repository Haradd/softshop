require 'rails_helper'

RSpec.describe "newsletters/index", type: :view do
  before(:each) do
    assign(:newsletters, [
      Newsletter.create!(
        :title => "Title",
        :product_name => "Product Name"
      ),
      Newsletter.create!(
        :title => "Title",
        :product_name => "Product Name"
      )
    ])
  end

  it "renders a list of newsletters" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Product Name".to_s, :count => 2
  end
end
