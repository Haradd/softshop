# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'wishlists/show', type: :view do
  before do
    @wishlist = assign(:wishlist, Wishlist.create!(
                                    name: 'Name',
                                    customer: nil
                                  ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
  end
end
