require 'rails_helper'

describe UsersController do
  let(:current_user) { create(:user, :with_admin_role) }
  let(:user) { create(:user) }

  before { sign_in current_user }

  describe '#index' do
    let(:call_request) { post :index }

    it_behaves_like 'an action rendering view'
  end

  describe '#destroy' do
    let(:call_request) { delete :destroy, params: { id: user.id  } }

    it_behaves_like 'an action destroying object'
  end

  describe '#send_regards' do
    let(:attributes) { { id: user.id } }
    let(:call_request) { get :send_regards, params: { id: user.id }, template: false }

    before do
      allow(RegardsSender).to receive(:call).with(user.id.to_s, current_user)
      call_request
    end

    it { expect(RegardsSender).to have_received(:call).with(user.id.to_s, current_user).once }
  end

  describe '#export' do
    let(:call_request) { get :export, format: :csv }

    it do
      call_request
      expect(response.content_type.to_s).to eq 'text/csv'
    end
  end
end
