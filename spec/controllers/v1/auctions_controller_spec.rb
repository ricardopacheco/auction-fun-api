# frozen_string_literal: true

require "rails_helper"

describe V1::AuctionsController do
  describe "Routes", type: :routing do
    it { expect(get("/v1/auctions")).to route_to("v1/auctions#index", format: :json) }
  end

  describe "GET #index", type: :controller do
    context "when auctions are available" do
      let!(:auction) { Factory[:auction, :default_running_standard] }

      it "expect return http status ok with auctions" do
        get :index

        expect(response).to have_http_status(:ok)
        expect(response.body).to include(auction.title)
      end
    end

    context "when there are no auctions available" do
      it "expect return http status ok with empty results" do
        get :index

        expect(response).to have_http_status(:ok)
        expect(json_response["auctions"]).to be_blank
      end
    end
  end
end
