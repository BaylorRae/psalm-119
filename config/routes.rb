Rails.application.routes.draw do
  root to: "verses#index"

  mount AhoyCaptain::Engine => "/ahoy_captain"

  get "up" => "rails/health#show", :as => :rails_health_check
  get ":number", to: "verses#show", as: :verse
end
