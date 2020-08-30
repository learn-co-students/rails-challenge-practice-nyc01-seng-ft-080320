Rails.application.routes.draw do
    resources :buliding, except: [:new, :create:, :destroy]
    resources :company, only: [:new, :show]
    #resources :employee
    resources :office, except:[:destroy]
    resources :employee, only:[:destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
