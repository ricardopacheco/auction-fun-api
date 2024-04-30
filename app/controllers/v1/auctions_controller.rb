# frozen_string_literal: true

module V1
  # Main class (Add doc)
  class AuctionsController < ApplicationController
    def index
      auctions = auction_relation.all(params[:page] || 1, params[:per_page] || 25).to_a

      render json: {auctions: auctions}, status: :ok
    end

    private

    def auction_relation
      AuctionFunCore::Application[:container].relations[:auctions]
    end
  end
end
