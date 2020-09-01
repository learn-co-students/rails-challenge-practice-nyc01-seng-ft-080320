Rails.application.routes.draw do
    resources :buildings, except: [:new, :create, :destroy]
    resources :companies
    #resources :employee
    resources :offices, except:[:destroy]
    resources :employees
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
