# frozen_string_literal: true

class CreateFailureError < StandardError
  def initialize(msg="Failed to create the record")
    super
  end
end
