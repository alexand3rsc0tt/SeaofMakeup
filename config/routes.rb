Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  devise_for :admins
  root "posts#index"
  get "/contact", to: "static#contact", as: :contact
  get "/faq", to: "faq#index", as: :faq
  get "/faq_edit", to: "faq#edit", as: :faq_edit
  resources :posts

  authenticate :admin do
    resources :posts, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :posts, only: [:index, :show]
end
