RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users/index'
      get '/'
      expect(response).to have_http_status(:success)
      expect(response.body).to include('List of all users')
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/users/show'
      get '/users/:id'
      expect(response).to have_http_status(:success)
      expect(response.body).to include('List of all users by id')
    end
  end
end
