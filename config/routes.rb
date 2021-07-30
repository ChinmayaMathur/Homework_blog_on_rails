Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get("/", {to:"posts#index", as: "root"}) 
  get("/users/changePassword", {to:"users#changePassword", as: :change_password})
  post("/users/updatePassword", {to:"users#updatePassword", as: :update_password})  
  
  resources :posts  do
    resources :comments, only: [:create, :destroy]
  end

  resources :users, only: [:new, :create, :edit, :update]

  resource :session, only: [:new, :create, :destroy]
   
end
