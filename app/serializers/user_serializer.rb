class UserSerializer < ActiveModel::Serializer
  attributes :id, :nickname, :email, :avatar
end
