class ApiController < ApplicationController
  include GoogleAnalytics
  include CryfsVersionConstants

  def version_info
    respond_to do |format|
      response = {version_info: {current: cryfs_version()}, warnings: {}}
      format.json { render json: response, status: :ok }
      trackPageview('Client Version Check')
    end
  end
end
