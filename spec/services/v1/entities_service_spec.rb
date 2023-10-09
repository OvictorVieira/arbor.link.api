require 'rails_helper'

RSpec.describe V1::Partners::EntitiesService do
  describe '.get_all' do
    it 'returns all entities' do
      entity1 = create(:entity)
      entity2 = create(:entity)

      result = described_class.get_all

      expect(result).to contain_exactly(entity1, entity2)
    end
  end

  describe '.find' do
    it 'finds an entity by its ID' do
      entity = create(:entity)

      result = described_class.find(entity.id)

      expect(result).to eq(entity)
    end
  end

  describe '.create!' do
    context 'with valid data' do
      let(:valid_data) { attributes_for(:entity) }

      it 'creates a new entity' do
        expect {
          described_class.create!(valid_data)
        }.to change(Entity, :count).by(1)
      end
    end

    context 'with invalid data' do
      let(:invalid_data) { { name: nil } }

      it 'raises a CreateFailureError' do
        expect {
          described_class.create!(invalid_data)
        }.to raise_error(CreateFailureError)
      end
    end
  end

  describe '.update!' do
    let(:entity) { create(:entity) }

    context 'with valid data' do
      let(:new_name) { 'Updated Name' }

      it 'updates the entity' do
        described_class.update!(entity, name: new_name)
        entity.reload

        expect(entity.name).to eq(new_name)
      end
    end

    context 'with invalid data' do
      let(:invalid_data) { { name: nil } }

      it 'raises an UpdateFailureError' do
        expect {
          described_class.update!(entity, invalid_data)
        }.to raise_error(UpdateFailureError)
      end
    end
  end
end
