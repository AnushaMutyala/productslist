module ControllerMacros
  def login_any_user (user=:user)
    case user
      when :admin   then login_admin
      when :employee  then login_employee
      when :teamlead  then login_teamlead
     
      
    end
  end

  private
    def login_admin
      before(:each) do
        @request.env["devise.mapping"] = Devise.mappings[:admin]
        user = FactoryBot.create(:admin)
        sign_in user
        user.id
      end
    end

  # def login_user
  #   # Before each test, create and login the user
  #   before(:each) do
  #     @request.env["devise.mapping"] = Devise.mappings[:user]
  #     user = FactoryBot.create(:user)
  #     # user.confirm! # Or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
  #     sign_in user
  #   end
  # end

  # Not used in this tutorial, but left to show an example of different user types
  # def login_admin
  #   before(:each) do
  #     @request.env["devise.mapping"] = Devise.mappings[:admin]
  #     sign_in FactoryBot.create(:admin) # Using factory bot as an example
  #   end
  # end
end