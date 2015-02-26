class Ability
  include CanCan::Ability

  def initialize(user)

    if user
      can :access, :rails_admin  # only allow admin users to access Rails Admin
      can :dashboard             # allow access to dashboard
      ## ADMIN
      #if user.role? :admin
        can :manage, :all
        
        ## PARKING OWNER
        #elsif user.role? :parking_owner
        #  can [:read, :create, :update], VehicleType
        #  can [:read], LeaseTime
        #  ParkingUser.where("user_id = ?", user.id).each do |pu|
        #      can [:manage], LeaseType, :parking_id => pu.parking_id
        #      can [:read,:update], Parking, :id => pu.parking_id    
        #      
        #
        #    ParkingUser.where("parking_id = ?", pu.parking_id).each do |u|
              #Lease.where("exit_date IS NULL AND parking_user_id = ?", u.id).each do |l|
              #  can [:update], Lease, :id => l.id
              #end
        #      can [:update], Lease, :parking_user_id => u.id
        #      can [:read, :create], Lease, :parking_user_id => u.id  
        #      can [:manage], ParkingUser, :id => u.id
        #      can [:manage], User, :id => u.user_id
        #    end
        #  end  

        # EMPLOYEE  
        #elsif user.role? :employee
        #    can [:read], Parking 
        #    can [:read, :update], User, :id => user.id
        #    can [:read,:create,:update], VehicleType
        #    can [:read], ParkingUser, :user_id => user.id
        #  ParkingUser.where("user_id = ?", user.id).each do |pu|
        #      can [:read, :create], LeaseType, :parking_id => pu.parking_id
        #    ParkingUser.where("parking_id = ?", pu.parking_id).each do |u|
        #      Lease.where("exit_date IS NULL AND parking_user_id = ?", u.id).each do |l|
        #        can [:update], Lease, :id => l.id
        #     end
        #      can [:read, :create], Lease, :parking_user_id => u.id  
        #      can [:read], ParkingUser, :id => u.id
        #      can [:read], User, :id => u.user_id
         #   end
         # end 
       # end  
      end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
