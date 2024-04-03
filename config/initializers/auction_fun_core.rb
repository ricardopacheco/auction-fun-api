AuctionFunCore::Application[:settings].database_url = ENV.fetch("DATABASE_URL")
AuctionFunCore::Application[:settings].redis_url = ENV.fetch("REDIS_URL")

AuctionFunCore::Application.finalize!
