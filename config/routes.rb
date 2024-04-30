Rails.application.routes.draw do
  if Rails.env.development?
    require 'sidekiq/web'

    Sidekiq::Web.use ActionDispatch::Cookies
    Sidekiq::Web.use ActionDispatch::Session::CookieStore, key: '_auctionfuncore_session'
    mount Sidekiq::Web => '/sidekiq'
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", :as => :rails_health_check

  namespace :v1, defaults: { format: :json } do
    resources :auctions, only: %i[index]
  end
end
