Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get("/", {to:"posts#index", as: "root"}) 
  
  resources :posts  do
    resources :comments, only: [:create, :destroy]
  end
   
end
