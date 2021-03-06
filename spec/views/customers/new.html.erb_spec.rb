# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'customers/new', type: :view do
  before do
    assign(:customer, Customer.new(
                        first_name: 'MyString',
                        last_name: 'MyString',
                        email: 'MyString',
                        phone_number: 'MyString',
                        string: 'MyString'
                      ))
  end

  it 'renders new customer form' do
    render

    assert_select 'form[action=?][method=?]', customers_path, 'post' do
      assert_select 'input[name=?]', 'customer[first_name]'

      assert_select 'input[name=?]', 'customer[last_name]'

      assert_select 'input[name=?]', 'customer[email]'

      assert_select 'input[name=?]', 'customer[phone_number]'

      assert_select 'input[name=?]', 'customer[string]'
    end
  end
end
