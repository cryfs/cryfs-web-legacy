class MainController < ApplicationController
  include CryfsVersionConstants

  def index
    @interested_user = InterestedUser.new()
  end

  helper_method :cryfs_version

  def legal_notice
  end

  def documentation
  end
end
