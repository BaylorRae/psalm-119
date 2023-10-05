Rails.application.routes.draw do
  root to: "verses#index"

  devise_for :users

  authenticated :user do
    mount AhoyCaptain::Engine => "/ahoy_captain"
  end

  get "up" => "rails/health#show", :as => :rails_health_check
  get ":number", to: "verses#show", as: :verse
end
