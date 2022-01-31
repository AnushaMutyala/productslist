require 'rails_helper'


RSpec.describe DashboardController , type: :controller do

    describe "GET #index" do
        login_any_user
        it "returns a success response" do
             get :index
            #expect(response).to be_successful # be_successful expects a HTTP Status code of 200
             #expect(response).to have_http_status(200)
             expect(response.status).to eq(200) # Expects a HTTP Status code of 302
             
              #expect(response).to render_template("pages/home")
               #expect(response.body).to have_text('welcome')
        end
    end
end