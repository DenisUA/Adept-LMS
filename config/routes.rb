Rails.application.routes.draw do
  resources :translation, only: [:new, :create] do
    post :receive
  end

  root 'translation#new'
end
