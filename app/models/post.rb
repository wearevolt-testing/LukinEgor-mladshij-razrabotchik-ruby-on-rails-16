class Post < ApplicationRecord
  has_many :comments
  belongs_to :author, class_name: 'User'
  validates :title, :body, presence: true

  def author_nickname
    author.nickname
  end
end
