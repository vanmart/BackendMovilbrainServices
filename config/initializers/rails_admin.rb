Date::DATE_FORMATS[:default] = "%d-%m-%Y"

RailsAdmin.config do |config|

  config.main_app_name = Proc.new { |controller| [ "Services", "Administration" ] }

  ### Popular gems integration
  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end

  ## == Cancan ==
  config.authorize_with :cancan
  config.current_user_method &:current_user

  config.actions do
    # root actions
    dashboard                     # mandatory
    # collection actions
    index                         # mandatory
    new
    export
    bulk_delete
    # member actions
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
  #names like are in the model class
  #config.included_models = [ 'User' , 'Vehicle' , 'VehicleType', 'Lease', 'LeaseType', 'Parking','ParkingUser','LeaseTime']
  config.included_models = [ 'User' , 'userService', 'backendAdmin']

  RailsAdmin.config {|c| c.label_methods << :description }
end