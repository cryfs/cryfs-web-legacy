require 'mailchimp'

module MailchimpAPI
  def add_subscriber(email)
    api.lists.subscribe(listId, email: email)
  end

  private
    def listId
      ENV['MAILCHIMP_LIST_ID']
    end
    def api
      Mailchimp::API.new(ENV['MAILCHIMP_KEY'])
    end
end
