# frozen_string_literal: true

class V1::Users::UsersService

  def self.find(id)
    User.find(id)
  end

  def self.create!(user_data)
    user = User.new(user_data)

    if user.save
      return user
    else
      raise CreateFailureError.new("Error to create new entity: #{user.errors.full_messages.join(', ')}")
    end
  end
end
