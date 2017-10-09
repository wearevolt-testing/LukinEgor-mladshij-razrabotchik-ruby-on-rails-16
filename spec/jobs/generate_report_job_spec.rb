require 'rails_helper'

RSpec.describe GenerateAndSendReportJob, type: :job do
  it 'check perfoming job' do
    # TODO fix this test
    skip
    ActiveJob::Base.queue_adapter = :test

    email = 'test@mail.com'
    start_date = DateTime.now - 1.month
    finish_date = DateTime.now
    expect {
      GenerateAndSendReportJob.perform_now(email, start_date, finish_date)
    }.to have_enqueued_job
  end
end
