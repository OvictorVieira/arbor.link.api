# frozen_string_literal: true

class V1::Partners::EntityParentValidator

  def self.validate!(entity)
    if entity.class?
      unless Entity.exists?(entity.parent_id)
        raise CreateFailureError.new("A Class entity must have a parent (Network or School)")
      end
    end
  end
end
