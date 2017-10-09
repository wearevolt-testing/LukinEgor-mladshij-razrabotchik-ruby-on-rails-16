require 'rails_helper'

RSpec.describe 'Report service' do
  it 'create report' do
    post1 = create(:post_with_comments, comments_count: 10)
    post2 = create(:post_with_comments, comments_count: 5)

    start_date = DateTime.now - 1.month
    finish_date = DateTime.now
    report = Report.generate(start_date, finish_date)

    expect(report[0].user.nickname).to be_eql(post1.author.nickname)
    expect(report[0].posts_count).to be_eql(1)
    expect(report[0].comments_count).to be_eql(10)
    expect(report[1].user.nickname).to be_eql(post2.author.nickname)
    expect(report[1].posts_count).to be_eql(1)
    expect(report[1].comments_count).to be_eql(5)
  end
end
