Rails.application.routes.draw do
  
  devise_for :users
  root 'hello#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'posts/index'
  get 'posts/new'
  post 'posts'=>'posts#create'
  get 'posts/:id' =>'posts#show',as:'post'
  delete 'posts/:id' => 'posts#destroy' 
  patch 'posts/:id' => 'posts#update'
  get 'posts/:id/edit' => 'posts#edit', as:'edit_post'

end
