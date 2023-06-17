require 'rails_helper'

RSpec.describe 'users/index.html.erb', type: :view do
  pending "add some examples to (or delete) #{__FILE__}"
  it 'Render index template' do
    render template: 'users/index'
    expect(rendered).to match(/List of all users/)
  end
end
