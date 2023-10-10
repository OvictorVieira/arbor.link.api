require 'rails_helper'

RSpec.describe UserSerializer, type: :serializer do
  let(:user) { create(:user) }
  let(:serialized) { UserSerializer.serialize_user(user) }

  subject { JSON.parse(serialized.to_json)['data'] }

  it 'includes the expected attributes' do
    expect(subject.keys).to match_array(%w[id name email])
  end

  it 'matches the name of the user' do
    expect(subject['name']).to eq(user.name)
  end

  it 'matches the email of the user' do
    expect(subject['email']).to eq(user.email)
  end
end

