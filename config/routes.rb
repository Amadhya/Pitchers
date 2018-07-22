Rails.application.routes.draw do
  

  post 'likes/toggle/:post_id', to: 'likes#toggle', as: :toggle_like
  get'likes/toggleC/:comment_id',to:'likes#toggleC',as: :toggleC_like
  post 'comments/create', as: :comments
  delete 'comments/:id', to: 'comments#destroy', as: :destroy_comment

	# Post routes
  root 'posts#home'
  get 'posts/home',to:'posts#home'
  post 'posts/create', as: :posts
  delete 'posts/:id', to: 'posts#destroy', as: :destroy_post
  namespace :api do
    namespace :v1 do 
      get 'home',to:'posts#home'
      post 'sign_in',to:'users#sign_in'
      post 'posts/create', to: 'posts#create'
    end
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
