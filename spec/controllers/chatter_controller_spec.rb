RSpec.describe ChatterController do
  describe "GET show" do
    it "has a success response" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST ask" do
    it "renders the show template" do
      post :ask, params: { question_text: "What is 42 the answer to?" }
      expect(response).to render_template("show")
    end
  end
end
