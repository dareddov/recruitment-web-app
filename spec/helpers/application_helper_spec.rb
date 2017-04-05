require 'rails_helper'

describe ApplicationHelper do
  describe '#bootstrap_class_for' do
    subject { helper.bootstrap_class_for(flash_type) }

    context 'flash is success' do
      let(:flash_type) { :success }

      it { expect(subject).to eq 'alert-success'}
    end

    context 'flash is error' do
      let(:flash_type) { :error }

      it { expect(subject).to eq 'alert-danger'}
    end

    context 'flash is alert' do
      let(:flash_type) { :alert }

      it { expect(subject).to eq 'alert-warning'}
    end

    context 'flash is notice' do
      let(:flash_type) { :notice }

      it { expect(subject).to eq 'alert-info'}
    end
  end

  describe '#flash_messages' do
    subject { helper.flash_messages }

    context 'no flashes' do
      it { expect(subject).to be_nil }
    end

    context 'one flash' do
      ## TODO: I don't know how mock flash
    end
  end

  describe '#translate_attribute' do
    let(:model) { User }
    subject { helper.translate_attribute(model, attribute) }

    context 'translate key is existing' do
      let(:attribute) { :email }

      it { expect(subject).to eq 'E-mail' }
    end

    context 'translate key key is not existing' do
      let(:attribute) { :some_attribute }

      it { expect(subject).to eq "<span class=\"translation_missing\" title=\"translation missing: en.activerecord.models.user.attributes.some_attribute\">Some Attribute</span>" }
    end
  end
end