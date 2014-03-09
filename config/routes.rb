Maxpoint::Application.routes.draw do
  get '/search' => "search#index"
  mount Cms::Engine => '/'
end
