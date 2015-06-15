Rails.application.routes.draw do
  
  root "static_pages#home"

  get    "login"   => "sessions#new"
  post   "login"   => "sessions#create"
  delete "logout"  => "sessions#destroy"

  get "signup"  => "users#new"
  get "users"  => "users#index"
  post "users"  => "users#create"
  get "/users/new" => "users#new", as: "new_user"
  get "/users/:id/edit" => "users#edit", as: "edit_user"
  get "/users/:id" => "users#show", as: "user"
  patch "/users/:id" => "users#update"
  put "/users/:id" => "users#update"
  delete "/users/:id" => "users#destroy"

  get "/categories" => "categories#index", as: "categories"
  post "/categories" => "categories#create"
  get "/categories/new" => "categories#new", as: "new_category"
  get "/categories/:id/edit" => "categories#edit", as: "edit_category"
  get "/categories/:id" => "categories#show", as: "category"
  patch "/categories/:id" => "categories#update"
  put "/categories/:id" => "categories#update"
  delete "/categories/:id" => "categories#destroy"

  get "/words" => "words#index", as: "words"
  post "/words" => "words#create"
  get "/words/new" => "words#new", as: "new_word"
  get "/words/:id/edit" => "words#edit", as: "edit_word"
  get "/words/:id" => "words#show", as: "word"
  patch "/words/:id" => "words#update"
  put "/words/:id" => "words#update"
  delete "/words/:id" => "words#destroy"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root "welcome#index"

  # Example of regular route:
  #   get "products/:id" => "catalog#view"

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get "products/:id/purchase" => "catalog#purchase", as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get "short"
  #       post "toggle"
  #     end
  #
  #     collection do
  #       get "sold"
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
  #       get "recent", on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post "toggle"
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
