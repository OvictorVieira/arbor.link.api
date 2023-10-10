class UserSerializer < ActiveModel::Serializer
  class << self

    def serialize_user(user)
      format_user(user)
    end

    private

    def format_user(user)
      {
        data: {
          id: user.id,
          name: user.name,
          email: user.email
        }
      }
    end
  end
end
