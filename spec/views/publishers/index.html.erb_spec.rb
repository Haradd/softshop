# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'publishers/index', type: :view do
  before do
    assign(:publishers, [
             Publisher.create!(
               name: 'Name',
               description: 'MyText'
             ),
             Publisher.create!(
               name: 'Name',
               description: 'MyText'
             )
           ])
  end

  it 'renders a list of publishers' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
  end
end
