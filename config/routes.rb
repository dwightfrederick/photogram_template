Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "trips#index"
  # Routes for the Follow request resource:

  # CREATE
  get("/follow_requests/new", { :controller => "follow_requests", :action => "new_form" })
  post("/create_follow_request", { :controller => "follow_requests", :action => "create_row" })

  # READ
  get("/follow_requests", { :controller => "follow_requests", :action => "index" })
  get("/follow_requests/:id_to_display", { :controller => "follow_requests", :action => "show" })

  # UPDATE
  get("/follow_requests/:prefill_with_id/edit", { :controller => "follow_requests", :action => "edit_form" })
  post("/update_follow_request/:id_to_modify", { :controller => "follow_requests", :action => "update_row" })

  # DELETE
  get("/delete_follow_request/:id_to_remove", { :controller => "follow_requests", :action => "destroy_row" })
  get("/delete_follow_request_from_recipient/:id_to_remove", { :controller => "follow_requests", :action => "destroy_row_from_recipient" })
  get("/delete_follow_request_from_sender/:id_to_remove", { :controller => "follow_requests", :action => "destroy_row_from_sender" })

  #------------------------------

  # Routes for the Trip resource:

  # CREATE
  get("/trips/new", { :controller => "trips", :action => "new_form" })
  post("/create_trip", { :controller => "trips", :action => "create_row" })

  # READ
  get("/trips", { :controller => "trips", :action => "index" })
  get("/trips/:id_to_display", { :controller => "trips", :action => "show" })

  # UPDATE
  get("/trips/:prefill_with_id/edit", { :controller => "trips", :action => "edit_form" })
  post("/update_trip/:id_to_modify", { :controller => "trips", :action => "update_row" })

  # DELETE
  get("/delete_trip/:id_to_remove", { :controller => "trips", :action => "destroy_row" })
  get("/delete_trip_from_user/:id_to_remove", { :controller => "trips", :action => "destroy_row_from_user" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
