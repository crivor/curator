Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/recent'
  match 'recent', to: "posts#recent", via: :get

end
