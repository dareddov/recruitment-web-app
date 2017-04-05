require 'rails_helper'

describe User do
  context 'associations' do
    it { is_expected.to have_many(:interests) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:gender) }
    it { is_expected.to validate_presence_of(:age) }
  end

  describe '#is_admin?' do
    let(:subject) { user.is_admin? }

    context 'user is a admin' do
      let(:user) { build(:user, :with_admin_role) }

      it { expect(subject).to eq true }
    end

    context 'user is not a admin' do
      let(:user) { build(:user, :with_user_role) }

      it { expect(subject).to eq false }
    end
  end

  describe '#is_user?' do
    let(:subject) { user.is_user? }

    context 'user have user role' do
      let(:user) { build(:user, :with_user_role) }

      it { expect(subject).to eq true }
    end

    context 'user have not user role' do
      let(:user) { build(:user) }

      it { expect(subject).to eq false }
    end
  end
end
