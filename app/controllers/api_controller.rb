class ApiController < ApplicationController
  def version_info
    respond_to do |format|
      response = {version_info: {current: "0.8.3"}, warnings: {}}
      format.json { render json: response, status: :ok }
    end
  end
end
