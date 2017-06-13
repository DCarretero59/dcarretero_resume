Rails.application.routes.draw do
  root to: 'pages#home'
  get 'about' => 'pages#about'
  get 'contact' => 'pages#contact'

  resources :blogs
  resources :portfolios, except: [:show, :edit]
  get 'portfolio/:id' => 'portfolios#show', as: "portfolio_show"
  get 'portfolio/:id/edit' => 'portfolios#edit', as: "portfolio_edit"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
