# frozen_string_literal: true

class DestroyFailureError < StandardError
  def initialize(msg="Failed to delete the record")
    super
  end
end
