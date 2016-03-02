Rails.application.routes.draw do

devise_for :users

resources :restaurants do
  resources :reviews
end

# get 'restaurants' => 'restaurants#index'

root 'restaurants#index'

end
