# frozen_string_literal: true

class UpdateFailureError < StandardError
  def initialize(msg="Failed to update the record")
    super
  end
end
