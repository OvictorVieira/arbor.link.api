# frozen_string_literal: true

class V1::Partners::EntitiesService

  def self.get_all
    Entity.all
  end

  def self.find(id)
    Entity.find(id)
  end

  def self.create!(entity_data)
    entity = Entity.new(entity_data)

    V1::Partners::EntityParentValidator.validate!(entity)

    if entity.save
      return entity
    else
      raise CreateFailureError.new("Error to create new entity: #{entity.errors.full_messages.join(', ')}")
    end
  end

  def self.update!(entity, params)
    if entity.update(params)
      return entity.reload
    else
      raise UpdateFailureError.new("Error to update entity: #{entity.errors}")
    end
  end
end
