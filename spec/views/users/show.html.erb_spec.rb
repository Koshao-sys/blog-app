require 'rails_helper'

RSpec.describe 'users/show.html.erb', type: :view do
  pending "add some examples to (or delete) #{__FILE__}"
  it 'Render show template' do
    render template: 'users/show'
    expect(rendered).to match(/List of all users by id/)
  end
end
