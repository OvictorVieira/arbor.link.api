class EntitySerializer < ActiveModel::Serializer
  attributes :id, :entity_type, :inep, :name, :parent_id, :subtree_ids

  def subtree_ids
    object.subtree_ids
  end
end
