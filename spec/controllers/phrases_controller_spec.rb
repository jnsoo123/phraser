require 'rails_helper'

RSpec.describe PhrasesController, type: :controller do
  let(:user) { create(:user) } 

  describe "GET #index" do
    context "when logged in" do
      before(:each) do
        sign_in user
      end

      it "displays all saved phrases" do
        5.times { create(:phrase) }
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
        expect_redirect_to_sign_in
      end
    end
  end

  describe "POST #create" do
    context 'when logged in' do
      before(:each) do
        sign_in user
      end

      it "should create a phrase" do
        post :create, params: { phrase: { text: "Test phrase" } }
        expect(assigns(:phrase)).to_not be_a_new_record
      end

      it "should still redirect to root on failure" do
        post :create, params: { phrase: { text: "" } }
        expect(assigns(:phrase)).to be_a_new_record
        expect(response).to redirect_to root_path
      end

      it "should redirect to root" do
        post :create, params: { phrase: { text: "Test phrase" } }
        expect(response).to redirect_to root_path
      end
    end

    context 'when logged out' do
      it "should redirect to login page" do
        post :create, params: { phrase: { text: "Test phrase" } }
        expect_redirect_to_sign_in
      end
    end
  end

  describe "POST #mark_favorite" do
    let(:phrase) { create(:phrase) }
    context "when logged in" do
      before(:each) { sign_in user }

      it "should favorite a phrase" do
        post :mark_favorite, params: { id: phrase.id }
        expect(phrase.favorites.count).to eq 1
      end

      it "should unfavorite a repeated phrase and user" do
        post :mark_favorite, params: {id: phrase.id}
        post :mark_favorite, params: {id: phrase.id}
        expect(phrase.favorites.count).to eq 0
      end

      it "should redirect to root page" do
        post :mark_favorite, params: { id: phrase.id }
        expect(response).to redirect_to root_path
      end
    end

    context "when logged out" do
      it "should redirect to login page" do
        post :mark_favorite, params: { id: phrase.id }
        expect_redirect_to_sign_in
      end
    end
  end

  describe "DELETE #destroy" do
    context "when logged in" do
      before(:each) { sign_in user }

      it "should destroy the phrase if created by user" do
        phrase = create :phrase, user: user    
        expect { delete :destroy, params: { id: phrase.id } }.to change { Phrase.count }.by(-1)
      end

      it "should not destroy the phrase if not created by user" do
        phrase = create :phrase    
        expect { delete :destroy, params: { id: phrase.id } }.to change { Phrase.count }.by(0)
      end
      
      it "should redirect to root on success or fail" do
        phrase = create :phrase, user: user    
        delete :destroy, params: { id: phrase.id }
        expect(response).to redirect_to root_path
        phrase = create :phrase    
        delete :destroy, params: { id: phrase.id }
        expect(response).to redirect_to root_path
      end
    end

    context "when logged out" do
      it "should redirect to login page" do
        phrase = create :phrase    
        delete :destroy, params: { id: phrase.id  }
        expect_redirect_to_sign_in
      end
    end
  end
end
