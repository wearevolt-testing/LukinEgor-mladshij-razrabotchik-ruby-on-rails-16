class User < ApplicationRecord
  validates :nickname, :email, presence: true
  validates :nickname, :email, uniqueness: true
  validates_format_of :email, with:
    /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validate :avatar_size

  has_secure_password

  mount_uploader :avatar, AvatarUploader

  AVATAR_SIZE_LIMIT = 3

  def avatar_size
    return unless avatar.file
    message = "You cannot upload a file greater than #{AVATAR_SIZE_LIMIT}MB"
    size = avatar.file.size.to_f / (1000 * 1000)
    errors.add(:file, message) if size > AVATAR_SIZE_LIMIT
  end
end
