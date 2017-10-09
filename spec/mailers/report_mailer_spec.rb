require "rails_helper"

RSpec.describe ReportMailer, type: :mailer do
  let(:email) { 'test@mail.com' }
  let(:report) { Report.generate(DateTime.now, DateTime.now) }
  let(:mail) { ReportMailer.statistics(email, report) }

  it 'renders the headers' do
    expect(mail.subject).to eq('Report done')
    expect(mail.to).to eq([email])
    expect(mail.from).to eq(['from@example.com'])
  end

  it 'renders the body' do
    expect(mail.body.encoded).to_not be_nil
  end
end
