Lauralee::Application.routes.draw do

  # Home Page
  root to: "welcome#index"

  # Main Nav / Works
  get 'work/majorfinder' => 'work#majorfinder'
  get 'work/discovery' => 'work#discovery'
  get 'work/bloccit' => 'work#bloccit', path: "work/training-community"
  get 'work/wikiland' => 'work#wikiland'

  # Main Nav / About
  get "/about" => 'welcome#about'
  get "/test" => 'welcome#test'
  get "/varsitytutors" => 'welcome#varsitytutors'
  get "/confirmed" => 'welcome#confirm_subscription'

  # Playground
  get "/playground/*page" => "playground#show"
  get "/playground" => "playground#show", page: "index"

  # Main Nav / Feedback
  resources :feedbacks

  # Main Nav / Lessons
  get '/git', to: redirect('/courses')
  get '/git/lessons', to: redirect('/courses')
  resources :courses do
    resources :lessons, path: "lesson"
  end
  get '/git' => 'courses#git'


  # Devise
  devise_for :users
  resources :users, only: [:update]

  # Resources -> remove soon
  scope '/resources' do
    get '/freeimages' => 'welcome#freeimages'
    get "/about_me" => 'welcome#about_me', path: "a-little-about-me"
  end
  get "/resources" => 'welcome#resources'

  # Blog
  get 'blog/tags' => 'tags#index', as: :tags
  get 'blog/tags/:tag' => 'tags#show', as: :tag
  resources :posts, path: "blog"



end
