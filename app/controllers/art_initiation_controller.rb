class ArtInitiationController < ApplicationController
  def index
    if request.post?
      start_date = format_passed_date(params[:start_date])
      end_date = format_passed_date(params[:end_date])

      payload = {
          start_date: start_date.to_date,
          end_date: end_date.to_date,
          district_id: params[:district_id_left] || params[:district_id_right],
          site_id: params[:site_id]
      }

      url = '/reports/art_initiated'

      response = post_params(url, payload, 'get')

      data = []

      (JSON.parse(response) || []).each do |resp|
        data << resp
      end

      render json: data
    else
      render layout: 'octopus'
    end
  end
end
