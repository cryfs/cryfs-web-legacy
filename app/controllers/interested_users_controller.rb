class InterestedUsersController < ApplicationController
  include MailchimpAPI

  def create
    @interested_user = InterestedUser.new(interested_user_params)
    respond_to do |format|
      if @interested_user.save
        send_notification_mail_to_me("New interested user")
        begin
          add_subscriber(@interested_user.email)
          #TODO Make site work without javascript -> form will then redirect here and call this html action, we have to redirect it back to the main page
          #format.html { render json: @interested_user }
          #TODO Only render subfields of @interested_user (via jsbuilder?)
          format.json { render json: @interested_user }
        rescue Mailchimp::ListAlreadySubscribedError
          send_notification_mail_to_me("New interested user: Already subscribed. Not adding.")
          # Not showing the error, so attackers can't figure out whether someone is subscribed already.
          format.json { render json: @interested_user }
        rescue Mailchimp::ListInvalidUnsubMemberError
          send_notification_mail_to_me("New interested user: Unsubscribed before. Not adding.")
          #format.html { render json: @interested_user.errors }
          format.json { render json: {reason: "unsubscribed"}, status: :unprocessable_entity }
        end
      else
        #format.html { render json: @interested_user.errors }
        format.json { render json: {reason: "invalid-email"}, status: :unprocessable_entity }
      end
    end
  end

private
  def interested_user_params
    # TODO Spam protection: reject if << params[:nickname].present? >>
    params.require(:interested_user).permit(:email)
  end

  def send_notification_mail_to_me(title)
    ActionMailer::Base.mail(:from => "noreply@cryfs.org", :to => "messmer@cryfs.org", :subject => title, :body => "A new interested user enlisted on cryfs.org:\n#{@interested_user.email}\n").deliver_later
  end
end
