class MainController < ApplicationController
  def index
    @interested_user = InterestedUser.new()
  end

  def legal_notice
  end
end
