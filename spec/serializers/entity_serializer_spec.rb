require 'rails_helper'

RSpec.describe EntitySerializer, type: :serializer do
  let(:entity) { create(:entity) }
  let(:serialized) { EntitySerializer.new(entity) }

  subject { JSON.parse(serialized.to_json) }

  it 'includes the expected attributes' do
    expect(subject.keys).to match_array(%w[id entity_type inep name parent_id subtree_ids])
  end

  it 'matches the entity_type of the entity' do
    expect(subject['entity_type']).to eq(entity.entity_type)
  end

  it 'matches the inep of the entity' do
    expect(subject['inep']).to eq(entity.inep)
  end

  it 'matches the name of the entity' do
    expect(subject['name']).to eq(entity.name)
  end

  it 'matches the parent_id of the entity' do
    expect(subject['parent_id']).to eq(entity.parent_id)
  end

  it 'matches the subtree_ids of the entity' do
    expect(subject['subtree_ids']).to eq(entity.subtree_ids)
  end
end
