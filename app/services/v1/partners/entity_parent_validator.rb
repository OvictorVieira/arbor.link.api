# frozen_string_literal: true

class V1::Partners::EntityParentValidator

  def self.validate!(entity)
    if entity.class?
      if entity.parent.nil?
        raise CreateFailureError.new("A Class entity must have a parent (Network or School)")
      elsif !Entity.exists?(entity.parent_id)
        raise CreateFailureError.new("The specified parent does not exist")
      end
    end
  end
end
