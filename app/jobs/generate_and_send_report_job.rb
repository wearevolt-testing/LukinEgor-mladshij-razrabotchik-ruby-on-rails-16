class GenerateAndSendReportJob < ApplicationJob
  queue_as :default

  def perform(email, start_date, finish_date)
    report = Report.generate(start_date, finish_date)
    ReportMailer.statistics(email, report)
  end
end
