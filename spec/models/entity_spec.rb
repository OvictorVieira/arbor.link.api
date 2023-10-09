require 'rails_helper'

RSpec.describe Entity, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      entity = build(:entity)
      expect(entity).to be_valid
    end

    it 'is not valid without a name' do
      entity = build(:entity, name: nil)
      expect(entity).not_to be_valid
    end

    it 'is not valid without an entity_type' do
      entity = build(:entity, entity_type: nil)
      expect(entity).not_to be_valid
    end

    context 'when entity_type is Class' do
      it 'is not valid without a parent' do
        entity = build(:entity, entity_type: 'class', parent: nil)
        expect(entity).not_to be_valid
      end
    end

    context 'when entity_type is Network or School' do
      it 'is valid without a parent' do
        entity = build(:entity, entity_type: 'network', parent: nil)
        expect(entity).to be_valid

        entity = build(:entity, entity_type: 'school', parent: nil)
        expect(entity).to be_valid
      end
    end
  end

  describe 'associations' do
    it { should belong_to(:parent).class_name('Entity').optional }
    it { should have_many(:entities).class_name('Entity').with_foreign_key('parent_id') }
  end
end
