class ClientCaseProfileController < ApplicationController
  def index
    if request.post?
      start_date = format_passed_date(params[:start_date])
      end_date = format_passed_date(params[:end_date])
      person_id = params[:person_id]

      payload = {
          start_date: start_date.to_date,
          end_date: end_date.to_date,
          person_id: person_id
      }

      url = '/reports/client_case_listing'

      response = post_params(url, payload, 'get')

      data = []

      (JSON.parse(response) || []).each { |sn, resp|
        birth_month = resp['birthdate'].to_date.strftime("%m-%Y")

        data << [
            resp['surveillance'],
            resp['gender'],
            birth_month,
            resp['hiv_test_date'],
            resp['hiv_test_facility'],
            resp['initiation_date'],
            resp['current_regimen'],
            '',
            resp['latest_vl_result'],
            resp['latest_vl_date'],
            resp['latest_vl_facility']
        ]
      }

      render json: data
    else
      render layout: 'octopus'
    end
  end

  def show
    case_profile_id = params[:id]

    # url = '/reports/client_case_listing'
    #
    # response = post_params(url, payload, 'get')
    #
    # data = []
    #
    # (JSON.parse(response) || []).each { |sn, resp|
    #   birth_month = resp['birthdate'].to_date.strftime("%m-%Y")
    #
    #   data << [
    #       resp['surveillance'],
    #       resp['gender'],
    #       birth_month,
    #       resp['hiv_test_date'],
    #       resp['hiv_test_facility'],
    #       resp['initiation_date'],
    #       resp['current_regimen'],
    #       '',
    #       resp['latest_vl_result'],
    #       resp['latest_vl_date'],
    #       resp['latest_vl_facility']
    #   ]
    # }
    #
    # render json: data
    #
    render layout: 'octopus'
  end

end
