NewWeblogBase::Application.routes.draw do
  resources :page_views, only: [:index] do
    get "create", on: :member
  end
  devise_for :users
  match "/api/uploaddata" => "page_views#create"
  root to: "page_views#index"
end
