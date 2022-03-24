Rails.application.routes.draw do
  resources :tests do
    resources :questions, shallow: true
  end

  root to: 'questions#index'
end

