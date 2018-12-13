# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'customers/index', type: :view do
  before do
    assign(:customers, [
             Customer.create!(
               first_name: 'First Name',
               last_name: 'Last Name',
               email: 'Email',
               phone_number: 'Phone Number',
               string: 'String'
             ),
             Customer.create!(
               first_name: 'First Name',
               last_name: 'Last Name',
               email: 'Email',
               phone_number: 'Phone Number',
               string: 'String'
             )
           ])
  end

  it 'renders a list of customers' do
    render
    assert_select 'tr>td', text: 'First Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Last Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Email'.to_s, count: 2
    assert_select 'tr>td', text: 'Phone Number'.to_s, count: 2
    assert_select 'tr>td', text: 'String'.to_s, count: 2
  end
end
