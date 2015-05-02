class ContactsController < ApplicationController
  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    respond_to do |format|
      if @contact.deliver
        #TODO Make site work without javascript -> form will then redirect here and call this html action, we have to redirect it back to the main page
        format.html { render json: {success: true} }
        #TODO Only render subfields of @interested_user (via jsbuilder?)
        format.json { render json: {success: true} }
      else
        format.html { render json: @contact.errors }
        format.json { render json: @contact.errors, status: :internal_server_error }
      end
    end
  end
end
