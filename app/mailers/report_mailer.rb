class ReportMailer < ApplicationMailer
  def statistics(email, report)
    @report = report
    subject = 'Report done'
    mail(to: email, subject: subject)
  end
end
