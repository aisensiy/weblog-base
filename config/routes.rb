NewWeblogBase::Application.routes.draw do
  resources :page_views, only: [:index]

  devise_for :users

  root to: "page_views#index"
  match "/api/uploaddata" => "page_views#create"
end
