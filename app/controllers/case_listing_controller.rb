class CaseListingController < ApplicationController
  def index
    if request.post?
      start_param = params[:start_date].split('/')
      start_day = start_param[1]
      start_month = start_param[0]
      start_year = start_param[2]

      end_param = params[:end_date].split('/')
      end_day = end_param[1]
      end_month = end_param[0]
      end_year = end_param[2]

      start_date = "#{start_day}/#{start_month}/#{start_year}"
      end_date = "#{end_day}/#{end_month}/#{end_year}"

      payload = {
          start_date: start_date.to_date,
          end_date: end_date.to_date
      }

      url = '/reports/case_listing'

      response = post_params(url, payload, 'get')

      data = []

      (JSON.parse(response) || []).each do |sn, resp|
        birth_month = resp['birthdate'].to_date.strftime("%m-%Y")

        data << [
            resp['surveillance'],
            resp['gender'],
            birth_month,
            resp['hiv_test_date'],
            resp['hiv_test_facility'],
            resp['initiation_date'],
            '',
            '',
            resp['latest_vl_result'],
            resp['latest_vl_date'],
            resp['latest_vl_facility']
        ]
      end

      render json: data
    else
      render layout: 'octopus'
    end
  end
end
