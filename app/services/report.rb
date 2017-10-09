class Report
  class << self
    def generate(start_date, finish_date)
      statistics = User.all.map do |user|
        UserStatistic.new(user, start_date, finish_date)
      end

      statistics.sort_by do |stat|
        - (stat.posts_count + stat.comments_count / 10)
      end
    end
  end
end
