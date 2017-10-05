class User < ApplicationRecord
  validates :nickname, :email, :password, presence: true
  validates :nickname, :email, uniqueness: true
  validates_format_of :email, with:
    /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end
