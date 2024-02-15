Rails.application.routes.draw do
  get "/users" => "users#index"
  post "/users" => "users#create"
  get "/users/:id" => "users#show"
  patch "/users/:id" => "users#update"
  delete "/users/:id" => "users#destroy"

  post "/sessions" => "sessions#create"

  get "/todos" => "todos#index"
  post "/todos" => "todos#create"
  get "/todos/:id" => "todos#show"
  patch "/todos/:id" => "todos#update"
  delete "/todos/:id" => "todos#destroy"

  get "/categories" => "categories#index"
  post "/categories" => "categories#create"
  get "/categories/:id" => "categories#show"
end
