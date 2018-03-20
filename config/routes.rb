  Rails.application.routes.draw do
  devise_for :patients
  # devise_for :users
 
 get 'doctors/appoinment' => 'doctors#appoinment'
  
  get 'home/home_default'
  get 'home/home2'
  get 'home/home3'
  get 'home/home4'
  get 'home/with_cookie_bar'

  get 'home/list_page'
  get 'home/list_grid_page'
  get 'home/list_map_page'
  get 'home/detail_page'
  get 'home/detail_page2'
  get 'home/detail_page3'
  get 'home/blog'
  get 'home/badges'
  get 'home/login'
  get 'home/login2'
  get 'home/register_doctor'
  get 'home/register'
  get 'home/contacts'

  get 'home/detail_working_booking'
  get 'home/booking_page'
  get 'home/confirm_page'
  get 'home/faq_page'
  get 'home/coming_soon'
  get 'home/responsive_pricing_tables'
  get 'home/responsive_pricing_tables2'
  get 'home/working_doctor_register'
  get 'home/icon_pack1' 
  get 'home/icon_pack2'
  get 'home/icon_pack3'
  get 'home/404_page'


  namespace :admin do
  resources :doctors
end
  resources :doctors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


post '/create_appoinment' => "doctors#create_appoinment"
root 'home#home_default'
end
