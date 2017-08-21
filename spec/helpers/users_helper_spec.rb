require 'rails_helper'

describe UsersHelper do
  let!(:user) { create(:user, email: 'email@example.com', gender: :male, age: 25) }

  describe '#user_csv_headers' do
    subject { helper.user_csv_headers }

    it { expect(subject).to eq %w[E-mail Gender Age Interests] }
  end

  describe '#user_csv_row' do
    context 'user without interests' do
      subject { helper.user_csv_row(user) }

      it { expect(subject).to eq ['email@example.com', 'male', 25, ''] }
    end

    context 'user with one interests' do
      let!(:interest) { create(:interest, user: user, name: 'IT') }
      subject { helper.user_csv_row(user) }

      it { expect(subject).to eq ['email@example.com', 'male', 25, 'IT'] }
    end

    context 'user with two interests' do
      let!(:first_interest) { create(:interest, user: user, name: 'IT') }
      let!(:second_interest) { create(:interest, user: user, name: 'Mountains') }
      subject { helper.user_csv_row(user) }

      it { expect(subject).to eq ['email@example.com', 'male', 25, 'IT Mountains'] }
    end
  end
end
