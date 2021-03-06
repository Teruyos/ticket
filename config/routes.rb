Blog::Application.routes.draw do
  resources :categories

  devise_for :users

    resources :posts do
        resources :comments
        resources :buys
        
        collection do
            get 'search'
        end
        
        member do
            get 'edit2'
            post 'confirm'
        end
    end
    
    
  match 'day' => 'posts#day'
  match 'day_list/:date' => 'posts#day_list'

  match 'month' => 'posts#month'
  match 'month_list/:date' => 'posts#month_list'

  match 'year' => 'posts#year'
  match 'year_list/:date' => 'posts#year_list'

  match 'category_list' => 'posts#category_list'
  match 'cat_list/:cat' => 'posts#cat_list'
  match 'cat_list' => 'posts#cat_list'
  
  match 'artist_list' => 'posts#artist_list'
  match 'place_list' => 'posts#place_list'
  
  match 'contact' => 'contact#new', :as => 'contact', :via => :get
  match 'contact' => 'contact#create', :as => 'contact', :via => :post
  match 'contact:notice' => 'contact#index'
  
  match 'about' => 'posts#about'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'posts#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
