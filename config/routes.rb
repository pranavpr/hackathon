Hackathon::Application.routes.draw do
  get "spot_user_relationship/create"
  get "spot_user_relationship/destroy"
  resources :spots
  root "spots#index"
  match '/report',    to: 'spots#report',    via: 'get'
  match '/propose',    to: 'spots#new',    via: 'get'
  match '/join',    to: 'spots#join',    via: 'get'
  match '/completed',    to: 'spots#completed',    via: 'get'
  match '/spots/:id/join',    to: 'spots#joinspot',    via: 'get'
  match '/spots/:id/report',    to: 'spots#reportspot',    via: 'get'
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup
  match '/users/spots', to: 'users#spots', via: 'get', as:'spots_user'
  match '/spots/:id/users', to: 'spots#users', via: 'get', as: 'users_spot'

  # resources :users do
  #   member do
  #     get :spots
  #   end
  # end
  #
  # resources :spots do
  #   member do
  #     get :users
  #   end
  # end

  resources :spot_user_relationships, only: [:create, :destroy]
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
