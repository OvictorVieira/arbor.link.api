# frozen_string_literal: true

class V1::EntitiesService

  def self.get_all
    Entity.all
  end

  def self.find(id)
    Entity.find(id)
  end

  def self.create!(entity_data)
    entity = Entity.new(entity_data)

    V1::EntityParentValidator.validate!(entity)

    if entity.save
      return entity
    else
      raise CreateFailureError.new("Error to create new entity: #{entity.errors.full_messages.join(', ')}")
    end
  end

  def self.update!(entity, params)
    updated_entity = entity.update(params)

    if updated_entity
      return updated_entity
    else
      raise UpdateFailureError.new("Error to update entity: #{entity.errors}")
    end
  end

  def self.destroy!(entity)
    entity.destroy!

  rescue Exception
    raise DestroyFailureError.new("Error to destroy entity: #{entity.errors}")
  end
end
