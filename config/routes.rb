Rails.application.routes.draw do
  get :random, to: 'random#random'
  get :service_worker, to: 'random#service_worker'
  get :slides, to: 'random#slides'
end
