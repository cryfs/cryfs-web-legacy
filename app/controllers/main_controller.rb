class MainController < ApplicationController
  def index
    @interested_user = InterestedUser.new()
  end
end
