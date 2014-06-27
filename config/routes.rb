Rails.application.routes.draw do

  devise_for :users, :path => '/', :path_names => { :sign_in => 'login', :sign_up => 'signup', :sign_out => 'logout'}

  root "chapters#index"

  get    'likes/add'
  post   'likes/create/:id',  to: "likes#create"
  get    'likes/edit'
  get    'likes/update'
  delete 'likes/destroy/:id', to: "likes#destroy"
  get    'likes/read'

  get    'tags',                to: "tags#index"
  get    'tags/index/:page',    to: "tags#page"
  get    'tags/popular'
  get    'tags/popular/:page',  to: "tags#popular"
  get    'tags/trending'
  get    'tags/trending/:page', to: "tags#trending"
  get    'tags/add/:id',        to: "tags#add"
  post   'tags/create'
  get    'tags/edit'
  get    'tags/update'
  delete 'tags/destroy'
  get    'tags/:name',          to: "tags#read"

  get    'chapters/index'
  get    'chapters/index/:page',   to: "chapters#index"
  get    'chapters/popular'
  get    'chapters/popular/:page', to: "chapters#popular"
  get    'chapters/add'
  post   'chapters/create'
  get    'chapters/edit'
  get    'chapters/update'
  delete 'chapters/destroy'
  get    'chapters/read'

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
