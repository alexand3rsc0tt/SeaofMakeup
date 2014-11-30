Rails.application.routes.draw do

  devise_for :admins
  root "static#about"
  get "/contact", to: "static#contact", as: :contact
  get "/faq", to: "static#faq", as: :faq
  resources :posts

  authenticate :admin do
    resources :posts, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :posts, only: [:index, :show]
end
