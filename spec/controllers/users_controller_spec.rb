require 'rails_helper'

describe UsersController do
  let(:current_user) { create(:user, :with_admin_role) }
  let(:user) { create(:user) }

  before { sign_in current_user }

  describe '#index' do
    context 'as html' do
      let(:call_request) { post :index }

      it_behaves_like 'an action rendering view'
    end

    context 'as csv' do
      let(:call_request) { get :index, format: :csv }

      it do
        call_request
        expect(response.content_type.to_s).to eq 'text/csv'
      end
    end
  end

  describe '#destroy' do
    let(:call_request) { delete :destroy, params: { id: user.id  } }

    it_behaves_like 'an action destroying object'
  end
end
