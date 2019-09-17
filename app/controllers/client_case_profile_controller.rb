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
            resp['latest_vl_facility'],
            '',
            resp['date_enrolled'],
            '',
            '',
            '',
            resp['viral_load_follow_up_date'],
            resp['Vl_supressed_result'],
            resp['death_date'],
            resp['death_cause'],
            resp['who_stage']
        ]
      }

=begin
"surveillance": "oomQGd",
"gender": "F",
"birthdate": "1972-12-22",
"date_enrolled": "2005-07-14",
"hiv_test_date": "2005-06-30",
"hiv_test_facility": "Kamuzu Central Hospital",
"initiation_date": "2005-07-14",
"who_stage": 9806,
"age_at_initiation": 32,
"first_viral_load_date": null,
"latest_vl_result": "N/A",
"latest_vl_date": "N/A",
"latest_vl_facility": "N/A",
"viral_load_follow_up_date": null,
"Vl_supressed_result": null,
"current_regimen": "5A",
"facility_tracking": [],
"death_date": null,
"death_cause": null,
"first_cd4_count_date": [
    {
        "test_result_id": null,
        "trd": null
    }
]
=end

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
