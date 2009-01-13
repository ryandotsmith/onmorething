ActionController::Routing::Routes.draw do |map|
  map.resources :ideas, :except => [:show]
  map.root :controller => 'ideas', :action => 'new'
  map.vote_up '/ideas/vote_up',
    :controller => 'ideas', 
    :action => 'vote_up'
  map.vote_up '/ideas/vote_down',
    :controller => 'ideas', 
    :action => 'vote_down'

  #map.connect ':controller/:action/:id'
  #map.connect ':controller/:action/:id.:format'
end
