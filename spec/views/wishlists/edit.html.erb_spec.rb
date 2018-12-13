# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'wishlists/edit', type: :view do
  before do
    @wishlist = assign(:wishlist, Wishlist.create!(
                                    name: 'MyString',
                                    customer: nil
                                  ))
  end

  it 'renders the edit wishlist form' do
    render

    assert_select 'form[action=?][method=?]', wishlist_path(@wishlist), 'post' do
      assert_select 'input[name=?]', 'wishlist[name]'

      assert_select 'input[name=?]', 'wishlist[customer_id]'
    end
  end
end
