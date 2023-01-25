Rails.application.routes.draw do
  
  root 'posts#recent'
  get 'posts/index'
  get 'posts/recent'
  match 'recent', to: "posts#recent", via: :get

end
