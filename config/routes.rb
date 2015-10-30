Rails.application.routes.draw do
  resources :matches
  resources :photos
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  get     "/signup"                 => 'users#new', as: 'signup'

  get     "users/verify"            => 'users#show_verify', as: 'show_verify'
  post    "users/verify"            => 'users#verify', as: 'verify'
  post    "users/resend"            => 'users#resend', as: 'resend'
  resources :users, only: [:index, :create, :show]

  get     "/login"                  => 'sessions#new'
  post    "/login"                  => 'sessions#create'

  get     "auth/facebook/callback"  => 'sessions#facebook_create'
  get     "auth/facebook"           => 'sessions#facebook_create', as: 'facebook'
  get     "users/:id/type"          => 'users#edit'

  delete  "/logout"                 => 'sessions#destroy'

  get     "profile/new"             => 'profiles#new', as: 'new_profile'
  get     "post/new"                => 'posts#new', as: 'new_post'
  post    "profile/new"             => 'profiles#create'
  post    "post/new"                => 'posts#create'
  get     "profile/:id/edit"        => 'profiles#edit', as: 'edit_profile'
  patch   "profile/:id"             => 'profiles#update', as: 'update_profile'
  get     "post/:id/edit"           => 'posts#edit', as: 'edit_post'
  patch   "post/:id"                => 'posts#update', as: 'update_post'

  get     "/profiles"               => 'profiles#index'
  get     "/posts"                  => 'posts#index'
  get     "/my_profile"             => 'profiles#show', as: 'my_profile'
  get     "/my_post"                => 'posts#show', as: 'my_post'

  post    "/host_profile_match"        => 'matches#host_profile_match', as: 'match_post_create'
  post    "/seeker_post_match"         => 'matches#seeker_post_match', as: 'seeker_post_match'

  get     "/maps" => 'maps#index'

  get     "/user/map" => 'users#index'

  get     "user/type" => 'users#determine_type', as: 'user_type'
  patch   "user/type" => 'users#update_type'

  resources :conversations do
    resources :messages
   end

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
