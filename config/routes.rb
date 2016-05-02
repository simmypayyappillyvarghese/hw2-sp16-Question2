Rails.application.routes.draw do
                                                                #Q2
 get '/dogs',to:"dogs#index"                                    #This will set the URL/dogs to index page
  get 'dogs/new',to:"dogs#new"                                   #This will create new_dog_path pointing to the new page
  get 'dogs/:id',to:"dogs#show",as: :dog                         #This will set the URL/dogs/id to show page and name it as dog
  post 'dogs',to:"dogs#create"                                   #This will receive a post request and set /dogs to /dogs/create



  get "users", to: "users#index"
  get "users/new", to: "users#new"
  get "users/:id", to: "users#show", as: :user
  post "users", to: "users#create"
                           
end
