Rails.application.routes.draw do
  devise_for :users
  root 'main#home'
  get '/' => 'main#home', as: 'home'
  get '/show/:post_id' => 'main#show', as: 'posts_show'
  get '/apply' => 'main#apply'
  get '/hr' => 'main#hr'
  get '/recruit' => 'main#recruit', as: 'recruit'
  get '/recruit_list' => 'main#recruit_list', as: 'recruit_list'
  get '/new_recruit' => 'posts#new_recruit', as: 'new_recruit'
  patch '/edit_recruit/:post_id' => 'posts#edit_recruit', as: 'edit_recruit'
  get '/app_eval/:post_id' => 'main#app_eval'
  get '/int_eval/:post_id' => 'main#int_eval'
  get '/eval_application/:applicant_id' => 'main#app_eval_application'
  patch '/create_app_eval' => 'main#create_app_eval', as: 'create_app_eval'
  patch '/create_int_eval' => 'main#create_int_eval', as: 'create_int_eval'
  get '/eval_interview/:app_num' => 'main#int_eval_application'
  post '/create_recruit' => 'posts#create_recruit', as: 'create_recruit'
  get '/create_apply/:post_id' => 'main#create_apply', as: 'create_apply'
  get '/new_application/:post_id' => 'posts#new_application', as: 'new_application'
  get '/new_apply/:post_id' => 'posts#new_apply', as: 'new_apply'
  post '/create_application' => 'posts#create_application', as: 'create_application'
  get '/applying' => 'part5#applying'
  get '/delete_recruit/:post_id' => 'posts#delete_recruit', as: 'delete_recruit'
  get '/search' => 'main#search', as: 'search'
  get '/edit_apply/:post_id' => 'posts#edit_apply', as: 'edit_apply'
  
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
