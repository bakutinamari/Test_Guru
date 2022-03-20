Rails.application.routes.draw do
  resources :tests do
    resources :questions
  end

  root to: 'tests#index'
end
