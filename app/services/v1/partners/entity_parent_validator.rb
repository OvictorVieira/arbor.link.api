# frozen_string_literal: true

class V1::Partners::EntityParentValidator

  def self.validate!(entity)
    if entity.class?
      unless Entity.exists?(entity.parent_id)
        raise CreateFailureError.new("The parent_id (Network or School) provided does not exist.")
      end
    end
  end
end
