Rails.application.routes.draw do
  root "static#about"
  get "/contact", to: "static#contact", as: :contact
  get "/faq", to: "static#faq", as: :faq
  get "/posts", to: "static#posts", as: :post
end
