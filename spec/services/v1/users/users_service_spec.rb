require 'rails_helper'

RSpec.describe V1::Users::UsersService do
  describe '.find' do
    let!(:user) { create(:user) }

    it 'returns the user with the given id' do
      expect(described_class.find(user.id)).to eq(user)
    end

    it 'raises an error if the user does not exist' do
      expect { described_class.find(-1) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe '.create!' do
    context 'with valid attributes' do
      let(:valid_attributes) { attributes_for(:user) }

      it 'creates a new user' do
        expect {
          described_class.create!(valid_attributes)
        }.to change(User, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      let(:invalid_attributes) { attributes_for(:user, email: nil) }

      it 'raises a CreateFailureError' do
        expect {
          described_class.create!(invalid_attributes)
        }.to raise_error(CreateFailureError)
      end
    end
  end
end
