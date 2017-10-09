class UserStatistic
  attr_accessor :user

  def initialize(user, start_date, finish_date)
    @user = user
    date_range = start_date..finish_date
    @posts = Post
      .where(author: user, published_at: date_range)
      .includes(:comments)
  end

  def posts_count
    @posts.size
  end

  def comments_count
    @posts.reduce(0) { |acc, post| acc + post.comments.size }
  end
end
