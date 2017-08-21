require 'rails_helper'

describe RegardsSendController do
  let(:current_user) { create(:user) }
  let(:user) { create(:user) }

  before { sign_in current_user }

  describe '#create' do

    context 'with valid parameter' do
      let(:attributes) { { id: user.id } }
      let(:call_request) { post :create, params: { recipient_id: user.id } }

      before do
        allow(RegardsSend).to receive(:call)
      end

      it do
        call_request
        expect(RegardsSend).to have_received(:call)
        expect(response).to redirect_to(users_path)
      end
    end

    context 'without parameter' do
      let(:call_request) { post :create }

      before do
        allow(RegardsSend).to receive(:call)
      end

      it do
        call_request
        expect(RegardsSend).to have_received(:call)
        expect(response).to redirect_to(users_path)
      end
    end
  end
end
