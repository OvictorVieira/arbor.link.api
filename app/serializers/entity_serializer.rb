class EntitySerializer < ActiveModel::Serializer
  attributes :id, :entity_type, :inep, :name, :parent_id, :subtree_ids

  def subtree_ids
    object.subtree_ids
  end

  def self.transform_key_casing!(value, _options)
    value.underscore
  end
end
