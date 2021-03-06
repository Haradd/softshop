# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'publishers/new', type: :view do
  before do
    assign(:publisher, Publisher.new(
                         name: 'MyString',
                         description: 'MyText'
                       ))
  end

  it 'renders new publisher form' do
    render

    assert_select 'form[action=?][method=?]', publishers_path, 'post' do
      assert_select 'input[name=?]', 'publisher[name]'

      assert_select 'textarea[name=?]', 'publisher[description]'
    end
  end
end
