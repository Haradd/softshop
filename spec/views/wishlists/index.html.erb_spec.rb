# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'wishlists/index', type: :view do
  before do
    assign(:wishlists, [
             Wishlist.create!(
               name: 'Name',
               customer: nil
             ),
             Wishlist.create!(
               name: 'Name',
               customer: nil
             )
           ])
  end

  it 'renders a list of wishlists' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
  end
end
