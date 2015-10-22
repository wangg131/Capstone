Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  get     "/signup" => 'users#new', as: 'signup'

  get     "users/verify" => 'users#show_verify', as: 'show_verify'
  post    "users/verify" => 'users#verify', as: 'verify'
  post    "users/resend" => 'users#resend', as: 'resend'

  get     "/login" => 'sessions#new'
  post    "/login" => 'sessions#create'

  get     "auth/facebook/callback" => 'sessions#facebook_create'
  get     "auth/facebook" => 'sessions#facebook_create', as: 'facebook'
  get     "users/:id/type" => 'users#edit'

  delete  "/logout" => 'sessions#destroy'

  resources :users, only: [:index, :new, :create, :show]


  # get     "users/:user_id/profile/new" => 'profiles#new', as: 'new_user_profile'
  # get     "users/:user_id/post/new" => 'posts#new', as: 'new_user_post'
  # post    "users/:user_id/profile/new" => 'profiles#create'
  # post    "users/:user_id/post/new" => 'posts#create'


  patch   "users/edit_preferences/:id" => 'users#update'


  resources :conversations do
    resources :messages
   end

   get     "post/image_upload" => 'posts#image_upload', as: 'image_upload'

   resources :users do
     resources :profiles
     resources :posts
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
