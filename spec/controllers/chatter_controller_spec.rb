RSpec.describe ChatterController do
  describe "GET show" do
    it "has a success response" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end
end
