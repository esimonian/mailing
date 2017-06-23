require 'rails_helper'


RSpec.describe CampaignsController, type: :controller do
  login_user

  it "should have a current_user" do
    # note the fact that you should remove the "validate_session" parameter if this was a scaffold-generated controller
    expect(subject.current_user).to_not eq(nil)
  end

  # This should return the minimal set of attributes required to create a valid
  # Campaign. As you add validations to Campaign, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CampaignsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      campaign = Campaign.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      campaign = Campaign.create! valid_attributes
      get :show, params: {id: campaign.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      campaign = Campaign.create! valid_attributes
      get :edit, params: {id: campaign.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Campaign" do
        expect {
          post :create, params: {campaign: valid_attributes}, session: valid_session
        }.to change(Campaign, :count).by(1)
      end

      it "redirects to the created campaign" do
        post :create, params: {campaign: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Campaign.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {campaign: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested campaign" do
        campaign = Campaign.create! valid_attributes
        put :update, params: {id: campaign.to_param, campaign: new_attributes}, session: valid_session
        campaign.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the campaign" do
        campaign = Campaign.create! valid_attributes
        put :update, params: {id: campaign.to_param, campaign: valid_attributes}, session: valid_session
        expect(response).to redirect_to(campaign)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        campaign = Campaign.create! valid_attributes
        put :update, params: {id: campaign.to_param, campaign: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested campaign" do
      campaign = Campaign.create! valid_attributes
      expect {
        delete :destroy, params: {id: campaign.to_param}, session: valid_session
      }.to change(Campaign, :count).by(-1)
    end

    it "redirects to the campaigns list" do
      campaign = Campaign.create! valid_attributes
      delete :destroy, params: {id: campaign.to_param}, session: valid_session
      expect(response).to redirect_to(campaigns_url)
    end
  end

end
