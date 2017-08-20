require 'rails_helper'

describe RegardsSend do
  let(:subject) { RegardsSend }

  let!(:recipient) { create(:user) }
  let!(:sender) { create(:user) }

  describe 'passing valid parameters' do

    it 'is successful' do
      expect(subject.call(recipient.id, sender.id)).to eq true
    end
  end
end
