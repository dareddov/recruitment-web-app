require 'rails_helper'

describe Admin::UsersController do
  let(:current_user) { create(:user, :with_admin_role) }
  let(:user) { create(:user) }

  before { sign_in current_user }

  describe '#index' do
    context 'as admin' do
      let(:call_request) { post :index }

      it_behaves_like 'an action rendering view'
    end

    context 'as normal user' do
      let(:current_user) { create(:user, :with_user_role) }
      before { sign_in current_user }
      let(:call_request) { post :index }

      it do
        call_request
        expect(response.status).to eq(302)
        expect(response).to redirect_to(root_path)
      end
    end

    describe '#create' do
      let(:attributes) { { user: attributes_for(:user, email: 'john-smith@example.com') } }
      let(:call_request) { post :create, params: attributes }
      before { call_request }

      it { expect(User.last.email).to eq 'john-smith@example.com' }
      it { expect(User.last.valid_password?('secret')).to be_truthy }
    end
  end

  describe '#update' do
    let(:attributes) { { user: { email: 'jsmith@example.com' } } }
    let(:call_request) { post :update, params: { id: user.id, user: attributes } }

    it_behaves_like 'an action updating object'
  end
end
