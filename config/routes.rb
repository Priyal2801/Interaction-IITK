Rails.application.routes.draw do
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  resources :seniors do
    collection do
      match 'search' => 'seniors#search', via: [:get, :post], as: :search
    end
  end

  post "/seniors/:id/book_meet" => "seniors#book_meet", as: :book_meet
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'senior/search', to: 'welcome#show'
  root to: "seniors#index"
end
