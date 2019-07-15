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

      form_data = {
          start_date: start_date.to_date,
          end_date: end_date.to_date
      }

      response = RestClient::Request.execute(
          method: :post,
          url: 'http://localhost:3001/api/v1/reports/case_listing',
          headers: {
              ContentType: 'json',
              Authorization: 'Bearer ' + 'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NjMyNjA5MzF9.rVNdf1N5pgL3OhJdfFfwygFztj4VHZE2qfk-cCQpdoU'
          },
          content_type: "application/json",
          payload: form_data
      )

      # age_at_initiation: 54
      # : "1950-06-15"
      # : "2004-10-01"
      # : "F"
      # : "2004-07-01"
      # : "Malenga"
      # : "2004-10-01"
      # : "GOaYce"
      # who_stage: 9712

      data = []

      (JSON.parse(response) || []).each do |sn, resp|
        birth_month = resp['birthdate'].to_date.strftime("%m-%Y")

        data << [resp['surveillance'], resp['gender'], birth_month, resp['hiv_test_date'], resp['hiv_test_facility'],
                 resp['initiation_date'], '', '', '', resp['date_enrolled'], '', '']
      end

      render json: data
    else
      render layout: 'octopus'
    end
  end
end
