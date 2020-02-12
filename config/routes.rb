Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :restaurants, only: [:index, :create, :show, :new] do
    resources :reviews, only: [:new, :create]
  end
  #resources :reviews, only: [:]
end

#  do
# resources :reviews, only: [:create]
# end
