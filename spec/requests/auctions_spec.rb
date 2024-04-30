require "swagger_helper"

describe "Auctions API" do
  path "/auctions" do
    get "Fetching auctions" do
      tags "Auctions"
      consumes "application/json"
      produces "application/json"
      parameter name: :page, in: :query, type: :integer, required: false, default: 1
      parameter name: :per_page, in: :query, type: :integer, required: false, default: 10
      parameter name: :bidders_count, in: :query, type: :integer, required: false, default: 3
      request_body_example value: {}, name: "basic", summary: "Request example description"

      response "200", "auction found" do
        schema type: :array,
          items: {
            type: :object,
            properties: {
              id: {type: :integer, example: 1},
              title: {type: :string, example: "Lightweight Iron Lamp"},
              description: {type: :string, example: "Quo quidem veniam. Sunt tempora ratione. Aut culpa qui."},
              started_at: {type: :string, format: :"date-time", example: "2024-04-30T18:04:51.156934"},
              finished_at: {type: :string, format: :"date-time", example: "2024-04-30T18:04:51.156934"},
              initial_bid_cents: {type: :integer, example: 100},
              kind: {type: :string, example: "standard"},
              status: {type: :string, example: "running"},
              stopwatch: {type: :integer, example: 30},
              total_bids: {type: :integer, example: 1},
              bids: {
                type: :object,
                properties: {
                  current: {type: :integer, example: 1000},
                  minimal: {type: :integer, example: 1000},
                  bidders: {
                    type: :array,
                    items: {
                      type: :object,
                      properties: {
                        id: {type: :integer, example: 1},
                        user_id: {type: :integer, example: 2},
                        name: {type: :string, example: "Beatriz Louzada"},
                        value: {type: :integer, example: 1000},
                        date: {type: :string, format: :"date-time", example: "2024-04-30T18:04:51.156934"}
                      }
                    }
                  }
                }
              }
            }
          }

        let!(:auction) { Factory[:auction, :default_running_standard, :with_one_bid] }
        run_test!
      end
    end
  end
end
