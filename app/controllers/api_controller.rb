class ApiController < ApplicationController
  include GoogleAnalytics

  def version_info
    respond_to do |format|
      response = {version_info: {current: "0.8.4"}, warnings: {}}
      format.json { render json: response, status: :ok }
      trackPageview('Client Version Check')
    end
  end
end
