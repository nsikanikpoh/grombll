Rails.application.routes.draw do
  root 'grombll_home#grombll_home'
  get 'user_grumbles' => 'grombll_home#user_grumbles'
  get 'agency_grumbles' => 'grombll_home#agency_grumbles'
  devise_for :users
  resources :admins
  resources :agencies
  resources :grumblers
  resources :companies
  resources :comments
  resources :grumbles
  resources :catlevel3s
  resources :users
  resources :catlevel2s
  resources :catlevel1s
  resources :categories

  resources :categories do
  member do
      get 'newcatlevel1'
      get 'grumble_now'
      get 'unknown_company'
   
  end
end


resources :catlevel1s do
  member do
      get 'newcatlevel2'   
  end
end
resources :catlevel2s do
  member do
      get 'newcatlevel3'   
  end
end

#post 'unknown_create' => "grumbles#unknown_create"

resources :grumbles do
  member do
      get 'assign_company'
      get 'comment'
      get 'download_file'
      patch 'assign_update'

  end
end
resources :comments do
  member do
     
      get 'download_file'
     
  end
end
 resources :categories do
  resources :catlevel1s 
 end
resources :categories do
  resources :agencies 
 end

resources :catlevel1s do
  resources :catlevel2s 
 end

 resources :catlevel2s do
  resources :catlevel3s 
 end

 resources :catlevel1s do
  resources :companies  
 end

 resources :catlevel2s do
  resources :companies  
 end
 resources :catlevel3s do
  resources :companies 
 end
 
 resources :companies do
  resources :grumbles    
      
 end
 resources :grumblers do
  resources :grumbles 
 end

  resources :grumbles do
  resources :comments 
 end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
