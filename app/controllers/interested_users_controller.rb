class InterestedUsersController < ApplicationController

  def create
    @interested_user = InterestedUser.new(interested_user_params)
    respond_to do |format|
      if @interested_user.save
        #format.html { render json: @interested_user }
        format.json { render json: @interested_user }
        #format.js   { render json: @interested_user }
      else
        #format.html { render json: @interested_user.errors }
        format.json { render json: @interested_user.errors, status: :unprocessable_entity }
        # added:
        #format.js   { render json: @interested_user.errors, status: :unprocessable_entity }
      end
    end
  end

private
  def interested_user_params
    params.require(:interested_user).permit(:email)
  end
end
