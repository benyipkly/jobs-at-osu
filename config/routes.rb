Rails.application.routes.draw do
  get 'archive', :to => 'archive#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'feedreader/index'
end
