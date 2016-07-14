Rails.application.routes.draw do
  get 'voting/new'

  get 'voting/edit'

  get 'voting/update'

  get 'voting/create'

  get 'voting/show'

  get 'rounds/new'

  get 'rounds/create'

  get 'rounds/show'

  get 'rounds/edit'

  get 'teams/new'

  get 'teams/show'

  get 'teams/edit'

  get 'teams/create'

  get 'matches/new'

  get 'matches/show'

  get 'matches/edit'

  get 'matches/create'

  get 'tournaments/new'

  get 'tournaments/show'

  get 'tournaments/edit'

  get 'tournaments/create'

  get 'users/new'

  get 'users/show'

  get 'users/edit'

  get 'users/create'

  put 'users/:id' => 'users#update'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  resources :users, :tournaments, :teams, :matches, :rounds, :votings

  resources :tournaments do
    resources :rounds
  end


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
