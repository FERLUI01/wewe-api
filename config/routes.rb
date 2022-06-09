Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    get 'weather', to: 'weather#index'
  end
end
