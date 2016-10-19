Rails.application.routes.draw do

  root "homepages#index"

  get 'homepages/index'

  get 'homepages/show'

  get 'stores/index'

  get 'stores/show/:id' => "stores#show", as: "stores_show"

  get 'reviews/new'

  get 'reviews/create'

  get 'orders/index'

  get 'orders/new'

  get 'orders/create'

  get 'orders/show'

  get 'orders/destroy'

  get 'merchants/index' => 'merchants#index', as: 'merchant_index'

  get 'merchants/show'

  get 'merchants/new'

  get 'merchants/create'

  # Products controller routes

  get 'products/index'

  get 'products/show/:id' => "products#show", as: "products_show"

  get 'products/new'

  get 'products/create'

  get 'sessions/create'

  get 'sessions/index'

  delete 'sessions/:id/destroy' => 'sessions#destroy', as: 'session_delete'

  # Categories controllers

  get 'categories/index'

  get 'categories/new'

  get 'categories/create'

  get 'categories/show/:id' => "categories#show", as: "categories_show"

  get 'categories/destroy'

  get "/auth/:provider/callback" =>  "sessions#create"

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
