Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :workspaces do
    resources :equipment_types do
    end
  end
  resources :equipment_types, only: [:show] do
    resources :equipment_units do
    end
  end

  root to: 'admin/dashboard#index'
end
