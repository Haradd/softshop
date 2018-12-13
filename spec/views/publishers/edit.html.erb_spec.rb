# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'publishers/edit', type: :view do
  before do
    @publisher = assign(:publisher, Publisher.create!(
                                      name: 'MyString',
                                      description: 'MyText'
                                    ))
  end

  it 'renders the edit publisher form' do
    render

    assert_select 'form[action=?][method=?]', publisher_path(@publisher), 'post' do
      assert_select 'input[name=?]', 'publisher[name]'

      assert_select 'textarea[name=?]', 'publisher[description]'
    end
  end
end
