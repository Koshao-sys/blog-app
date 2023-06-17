RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'returns http success and renders the index template' do
      get '/posts/index'
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /show' do
    it 'returns http success and renders the show template' do
      get '/posts/show'
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
    end
  end
end
