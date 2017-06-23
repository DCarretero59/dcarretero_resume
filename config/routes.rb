Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  root to: 'pages#home'
  get 'about' => 'pages#about'
  get 'contact' => 'pages#contact'

  resources :blogs, except: [:show] do
    member do 
      post :toggle_status
    end
  end
  
  get 'blog/:id' => 'blogs#show', as: "blog_show"
  
  resources :portfolios, except: [:show]
  get 'portfolio/:id' => 'portfolios#show', as: "portfolio_show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
