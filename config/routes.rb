Lauralee::Application.routes.draw do
  
  # Home Page
  root to: "welcome#index"

  # Main Nav / Works
  get 'work/majorfinder' => 'work#majorfinder'
  get 'work/discovery' => 'work#discovery'
  get 'work/bloccit' => 'work#bloccit', path: "work/training-community"
  get 'work/wikiland' => 'work#wikiland'

  # Main Nav / About
  get "/about" => 'welcome#about'

  # Main Nav / Feedback
  resources :feedbacks

  # Devise
  devise_for :users
  resources :users, only: [:update]
  
  # Training -> remove soon
  scope '/training' do
    get '/freeimages' => 'welcome#freeimages'
    get "/about_me" => 'welcome#about_me', path: "a-little-about-me"
  end
  get "/training" => 'welcome#comingsoon'

  # Blog
  resources :posts, path: "blog"
  get '/tags/:tag' => 'tags#show', as: :tag
  get '/tags' => 'tags#index'
  
  
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
