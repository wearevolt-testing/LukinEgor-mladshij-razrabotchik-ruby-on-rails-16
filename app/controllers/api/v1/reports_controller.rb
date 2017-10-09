class Api::V1::ReportsController < ApplicationController
  def by_author
    email = params[:email]
    start_date = params[:start_date]
    finish_date = params[:finish_date]
    GenerateAndSendReportJob.perform_now(email, start_date, finish_date)
    render json: { message: 'Report generation started' }
  end
end
