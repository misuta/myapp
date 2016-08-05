Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, :path_names => {:sign_in => 'login',
   :sign_out => 'logout'}
   
  resources :users
  
  resources :products do
    resources :comments
  end

  get 'static_pages/about' => 'static_pages#about'

  get 'static_pages/contact'

  get 'static_pages/index'
  
  get 'static_pages/landing_page'

  get 'static_pages/admin_search'

  post 'static_pages/thank_you'

  root 'static_pages#index'

  mount ActionCable.server => '/cable'

  resources :orders, only: [:index, :show, :create, :destroy, :new]
end
