require 'rails_helper'

RSpec.describe V1::Partners::EntityParentValidator do
  describe '.validate!' do
    let(:network) { create(:entity, entity_type: 'network') }
    let(:school) { create(:entity, entity_type: 'school') }

    context 'when entity is of type class' do
      let(:class_entity) { build(:entity, entity_type: 'class') }

      context 'and has no parent' do
        it 'raises a CreateFailureError' do
          expect {
            described_class.validate!(class_entity)
          }.to raise_error(CreateFailureError, "The parent_id (Network or School) provided does not exist.")
        end
      end

      context 'and has a non-existent parent' do
        before do
          class_entity.parent_id = 9999 # some non-existent ID
        end

        it 'raises a CreateFailureError' do
          expect {
            described_class.validate!(class_entity)
          }.to raise_error(CreateFailureError, "The parent_id (Network or School) provided does not exist.")
        end
      end

      context 'and has a valid parent' do
        before do
          class_entity.parent = network
        end

        it 'does not raise an error' do
          expect {
            described_class.validate!(class_entity)
          }.not_to raise_error
        end
      end
    end

    context 'when entity is not of type class' do
      let(:school_entity) { build(:entity, entity_type: 'school') }

      it 'does not raise an error' do
        expect {
          described_class.validate!(school_entity)
        }.not_to raise_error
      end
    end
  end
end
