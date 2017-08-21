require 'rails_helper'

describe RegardsSend do
  let!(:recipient) { create(:user) }
  let!(:sender) { create(:user) }

  describe '#call' do
    context 'passing valid parameters' do
      subject { RegardsSend.call(recipient.id, sender.id) }

      it { expect(subject).to be_truthy }
      it { expect{subject}.to change{ActionMailer::Base.deliveries.count}.by(1) }
    end

    context 'without recipient parameter' do
      subject { RegardsSend.call(nil, sender.id) }

      it { expect(subject).to be_falsey }
      it { expect{subject}.to change{ActionMailer::Base.deliveries.count}.by(0) }
    end

    context 'without sender parameter' do
      subject { RegardsSend.call(recipient.id, nil) }

      it { expect(subject).to be_falsey }
      it { expect{subject}.to change{ActionMailer::Base.deliveries.count}.by(0) }
    end

    context 'without both parameters' do
      subject { RegardsSend.call(nil, nil) }

      it { expect(subject).to be_falsey }
      it { expect{subject}.to change{ActionMailer::Base.deliveries.count}.by(0) }
    end
  end
end
