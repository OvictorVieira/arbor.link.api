class EntitySerializer < ActiveModel::Serializer
  class << self

    def serialize_entities(entities)
      entities.map(&method(:format_entity))
    end

    def serialize_entity(entity)
      format_entity(entity)
    end

    private

    def format_entity(entity)
      {
        data: {
          id: entity.id,
          name: entity.name,
          entity_type: entity.entity_type,
          inep: entity.inep,
          parent_id: entity.parent_id,
          subtree_ids: entity.subtree_ids
        }
      }
    end
  end
end
