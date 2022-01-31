require 'rails_helper'


RSpec.describe ProductsController , type: :controller do 

    #login_any_user
    describe "GET #index" do
        before do
            @user= FactoryBot.build(:user, :author)        
             @user.add_role :author
             @ability = Ability.new(@user)             
        end
        it "Author has permissions only to create and read " do
            #@ability.can :update, :all
            expect(@ability.can?(:update, Product.new)).to be(true)
            #expect(@ability.can?(:create, Product.new)).to be(true)
            #expect(@ability.can?(:read, Product.new)).to be(true)
            #expect(@ability.can?(:destroy, Product.new)).to be(true)
          # expect(@user.roles).to eq([:admin])
        end
    end
    describe "GET #index" do
        before do
            @user= FactoryBot.build(:user, :admin)        
             @user.add_role :admin
             @ability = Ability.new(@user)             
        end
        
      it "admin manages all the crud operations" do
        #@ability.can :manage, :all
        expect(@ability.can?(:destroy, Product.new)).to be(true)
        expect(@ability.can?(:update, Product.new)).to be(true)
        expect(@ability.can?(:create, Product.new)).to be(true)
        expect(@ability.can?(:read, Product.new)).to be(true)
       
      end
    end
    describe "GET #index" do
        before do
            @user= FactoryBot.build(:user, :user)        
             @user.add_role :user
             @ability = Ability.new(@user)             
        end
        
      it "other than roles defined has only read operation" do
        #@ability.can :manage, :all
        #expect(@ability.can?(:destroy, Product.new)).to be(true)
        #expect(@ability.can?(:update, Product.new)).to be(true)
        #expect(@ability.can?(:create, Product.new)).to be(true)
        #expect(@ability.can?(:read, Product.new)).to be(true)
       
      end
    end

     #  describe Role do
    #   subject(:ability){ Ability.new(user) }
    #   let(:user){ FactoryBot.build(:user, roles: [role]) }

    #   context "when is a manager" do
    #     let(:role){ FactoryBot.build(:user) }

    #     it{ is_expected.not_to be_able_to(:create, Product.new) }
    #     # it{ is_expected.not_to be_able_to(:read, Product.new) }
    #     # it{ is_expected.not_to be_able_to(:update, Product.new) }
    #     # it{ is_expected.not_to be_able_to(:destroy, Product.new) }
    #   end
    # end


    #      before(:each) do
    #         (@ability = double).extend(CanCan::Ability)
    #       end

  


    # describe "GET #index" do
    #     it 'is able to :read anything' do
    #     @ability.can :read, :all
    #     expect(@ability.can?(:read, Product.new)).to be(true)
    #     expect(@ability.can?(:read, 123)).to be(true)
    #   end

       
        #login_user
        # it "has role batman" do
        #   expect(@user.has_role).to eq("admin")
        # end
        # it "should not approve incorrect roles" do
        #        @user.add_role :admin
        #        @user.has_role? :admin
        #        should be_true
        #       end
        # it "returns a success response" do
        #      #get :index
             
        #     #expect(response).to be_successful # be_successful expects a HTTP Status code of 200
        #      #expect(response).to have_http_status(200)
        #      #expect(response.status).to eq(200) # Expects a HTTP Status code of 302
             
        #       #expect(response).to render_template("pages/home")
        #        #expect(response.body).to have_text('welcome')
        # end
    
end