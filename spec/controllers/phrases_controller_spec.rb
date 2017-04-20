require 'rails_helper'

RSpec.describe PhrasesController, type: :controller do

  describe "GET #index" do
    context "when logged in" do
      before(:each) do
        user = User.create(email: 'admin@admin.com', password: "password", password_confirmation: "password")
        sign_in user
      end

      it "displays all saved phrases" do
        5.times { Phrase.create(text: "test") }
        get :index
        expect(assigns(:phrases).count).to eq 5
      end

      it "displays no phrases if there is no saved phrases" do
        get :index
        expect(assigns(:phrases)).to be_empty
      end
    end

    context "when logged out" do
      it "should redirect to login page" do
        get :index
        expect(response).to redirect_to new_user_session_path
      end
    end

  end

  describe "POST #create" do
    context 'when logged in' do
      before(:each) do
        sign_in User.create(email: 'admin@admin.com', password: "password", password_confirmation: "password")
      end

      it "should create a phrase" do
        post :create, params: { phrase: { text: "Test phrase" } }
        expect(assigns(:phrase)).to_not be_a_new_record
      end
       
      it "should create a phrase with a user" do
        post :create, params: { phrase: { text: "Test phrase" } }
        expect(assigns(:phrase).user).to be_a User
      end

      it "should redirect to root" do
        post :create, params: { phrase: { text: "Test phrase" } }
        expect(response).to redirect_to root_path
      end
    end

    context 'when logged out' do
      it "should redirect to login page" do
        post :create, params: { phrase: { text: "Test phrase" } }
        expect(response).to redirect_to new_user_session_path
      end
    end

  end

end
