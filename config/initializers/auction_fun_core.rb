AuctionFunCore::Application[:settings].database_url = ENV.fetch("DATABASE_URL")
AuctionFunCore::Application[:settings].redis_url = ENV.fetch("REDIS_URL")

# Import locales from gem
I18n.load_path += Dir[Gem.loaded_specs["auction_fun_core"].full_gem_path + "/i18n/**/*.{rb,yml}"]

AuctionFunCore::Application.finalize!
