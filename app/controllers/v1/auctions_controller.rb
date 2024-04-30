# frozen_string_literal: true

module V1
  class AuctionsController < ApplicationController
    def index
      auctions = auction_relation.all(index_params).to_a

      render json: auctions, status: :ok
    end

    private

    def auction_relation
      AuctionFunCore::Application[:container].relations[:auctions]
    end

    def index_params
      params.permit!
    end
  end
end
