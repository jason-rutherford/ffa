Rails.application.routes.draw do
  
  get 'nfl_players/import', to: 'nfl_players#import'
  resources :nfl_players

  get 'nfl_byes/import', to: 'nfl_byes#import'
  resources :nfl_byes

  get 'nfl_teams/import', to: 'nfl_teams#import'
  resources :nfl_teams

  get 'nfl_schedules/import', to: 'nfl_schedules#import'
  resources :nfl_schedules

  get 'nfl_weathers/import', to: 'nfl_weathers#import'
  resources :nfl_weathers

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'nfl_teams#index'
end
