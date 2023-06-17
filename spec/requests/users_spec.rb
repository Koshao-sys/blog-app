RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns http success and renders the index template' do
      get '/users/index'
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
      expect(response.body).to include('List of all users')
    end
  end

  describe 'GET /show' do
    it 'returns http success and renders the show template' do
      user = User.create(name: 'John Doe') # Assuming you have a User model
      get "/users/#{user.id}"
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
      expect(response.body).to include('List of all users by id')
    end
  end
end
