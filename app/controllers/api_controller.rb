class ApiController < ApplicationController
  def version_info
    respond_to do |format|
      response = {version_info: {current: "0.8.2"}, warnings: {"0.8": "This version is highly unstable. Please update!"}}
      format.json { render json: response, status: :ok }
    end
  end
end
