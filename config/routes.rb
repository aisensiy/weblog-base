NewWeblogBase::Application.routes.draw do
  resources :authentications


  resources :page_views, only: [:index]

  devise_for :users, controllers: {omniauth_callbacks: 'omniauth_callbacks'}

  root to: "page_views#index"
  match "/api/uploaddata" => "page_views#create"
end
