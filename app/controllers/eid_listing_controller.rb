class EidListingController < ApplicationController
  def index
    if request.post?
      start_date = format_passed_date(params[:start_date])
      end_date = format_passed_date(params[:end_date])

      payload = {
          start_date: start_date.to_date,
          end_date: end_date.to_date
      }

      url = '/reports/cbs_eid_cases'

      response = post_params(url, payload, 'get')

      data = []

      (JSON.parse(response) || []).each do |sn, resp|
        birth_month = resp['birthdate'].to_date.strftime("%b/%Y")

        data << [
            sn,
            resp['surveillance'],
            resp['gender'],
            birth_month,
            resp['hiv_test_date'],
            resp['hiv_test_facility'],
            resp['initiation_date'],
            resp['current_regimen'],
            resp['age_at_initiation'],
            resp['latest_vl_facility'],
            resp['latest_vl_result'],
            resp['latest_vl_date']
          
        ]
      end

      render json: data
    else
      render layout: 'octopus'
    end
  end

  def show
  end
end
