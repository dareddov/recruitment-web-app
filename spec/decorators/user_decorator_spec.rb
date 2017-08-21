require 'rails_helper'

describe UserDecorator do
  let!(:user) { create(:user) }
  let!(:interests) { create(:interest, name: 'Interest', user_id: user.id) }
  subject { user.decorate }

  describe '#pretty_interests' do
    context 'user have one interest' do
      it { expect(subject.pretty_interests).to eq 'Interest' }
    end

    context 'user have eight interests' do
      let!(:many_interests) { create_list(:interest, 7, name: 'Interest', user_id: user.id) }

      it { expect(subject.pretty_interests).to eq 'Interest, Interest, Interest, Interest, Interest, Interest, Interest, Interest' }
    end

    context 'user have more from eight interests' do
      let!(:many_interests) { create_list(:interest, 9, name: 'Interest', user_id: user.id) }

      it { expect(subject.pretty_interests).to eq 'Interest, Interest, Interest, Interest, Interest, Interest, Interest, Interest and more...' }
    end

    context 'user have ten interests and using all? option' do
      let!(:many_interests) { create_list(:interest, 9, name: 'Interest', user_id: user.id) }
      let(:options) { { all?: true } }
      let(:perform) { subject.pretty_interests(options) }

      it { expect(perform).to eq 'Interest, Interest, Interest, Interest, Interest, Interest, Interest, Interest, Interest, Interest' }
    end

    context 'user have five interests and using for csv option' do
      let!(:many_interests) { create_list(:interest, 4, name: 'Interest', user_id: user.id) }
      let(:options) { { for_csv: true } }
      let(:perform) { subject.pretty_interests(options) }

      it { expect(perform).to eq 'Interest, Interest, Interest, Interest, Interest' }
    end

    context 'user have ten interests and using all? and for csv option' do
      let!(:many_interests) { create_list(:interest, 9, name: 'Interest', user_id: user.id) }
      let(:options) { { for_csv: true, all?: true } }
      let(:perform) { subject.pretty_interests(options) }

      it { expect(perform).to eq 'Interest Interest Interest Interest Interest Interest Interest Interest Interest Interest' }
    end

    context 'user have ten interests and using scope amount option eq 10' do
      let!(:many_interests) { create_list(:interest, 9, name: 'Interest', user_id: user.id) }
      let(:options) { { scope: 10 } }
      let(:perform) { subject.pretty_interests(options) }

      it { expect(perform).to eq 'Interest, Interest, Interest, Interest, Interest, Interest, Interest, Interest, Interest, Interest' }
    end
  end

  describe '#destroy_icon' do
    let(:current_user) { create(:user, :with_admin_role) }

    context 'current user is admin, link for normal user' do
      before { sign_in current_user }

      it { expect(subject.destroy_icon).to eq "<a data-confirm=\"Are you sure?\" rel=\"nofollow\" data-method=\"delete\" href=\"/users/1\"><i class=\"fa fa-trash\"></i></a>" }
    end

    context 'current user is a normal user' do
      before { sign_in user }

      it { expect(subject.destroy_icon).to be_nil }
    end

    context 'link for him self' do
      before { sign_in current_user }
      subject { current_user.decorate }

      it { expect(subject.destroy_icon).to be_nil }
    end
  end
end
