require "rails_helper"

RSpec.describe TicketsController, type: :controller do
  describe "GET #index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    let(:ticket) { create(:ticket) }

    it "renders the show template" do
      get :show, params: {id: ticket.id}
      expect(response).to render_template(:show)
    end
  end

  describe "POST #create" do
    let(:valid_attributes) do
      JSON.parse(file_fixture("ticket_attributes.json").read)
    end
    let(:invalid_attributes) do
      JSON.parse(file_fixture("ticket_attributes.json").read).tap do
        _1["RequestNumber"] = nil
      end
    end

    context "with valid attributes" do
      it "creates a new ticket" do
        expect {
          post :create, params: valid_attributes
        }.to change(Ticket, :count).by(1)
      end

      it "returns 204 status (no_content)" do
        post :create, params: valid_attributes
        expect(response).to have_http_status(:no_content)
      end
    end

    context "with invalid attributes" do
      it "does not save the new ticket" do
        expect {
          post :create, params: invalid_attributes
        }.to raise_error { ActiveRecord::RecordInvalid }
      end
    end
  end
end
