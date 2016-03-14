require 'rest-client'
require 'digest'

module MailchimpAPI
  def add_subscriber(email)
    begin
      subscription = JSON.parse(get_subscription(email))
      if (subscription["status"] == "unsubscribed")
        # This can happen when a user was added earlier but then unsubscribed
        subscribe_existing(email)
      elsif (subscription["status"] == "pending")
        delete_subscription(email)
        subscribe_new(email)
      elsif (subscription["status"] == "subscribed")
        puts "#{email} is already subscribed. Not doing anything."
      else
        puts "Unknown status: #{subscription["status"]} for #{email}}."
      end
    rescue RestClient::ResourceNotFound
      # User isn't subscribed yet. Subscribe them.
      subscribe_new(email)
    end
  end

  private
    def server
      "us12.api.mailchimp.com"
    end
    def listId
      ENV['MAILCHIMP_LIST_ID']
    end
    def apiKey
      ENV['MAILCHIMP_KEY']
    end

    def get_subscription(email)
      get "/lists/#{listId}/members/#{Digest::MD5.hexdigest(email)}"
    end

    def subscribe_new(email)
      puts "Subscribe new"
      post "/lists/#{listId}/members", email_address: email, status: "pending" # Pending means the user will get a confirmation mail where they have to click a link
    end

    def subscribe_existing(email)
      puts "Subscribe existing"
      put "/lists/#{listId}/members/#{Digest::MD5.hexdigest(email)}", email_address: email, status: "pending" # Pending means the user will get a confirmation mail where they have to click a link
    end

    def delete_subscription(email)
      puts "Delete subscription"
      delete "/lists/#{listId}/members/#{Digest::MD5.hexdigest(email)}"
    end

    def get(path, params = {})
      RestClient.log = 'stdout'
      begin
        RestClient.get mailchimp_url(path), params
      rescue RestClient::BadRequest => e
        puts "MailChimp error: #{e.http_body}"
        raise e
      end
    end

    def post(path, data = {})
      RestClient.log = 'stdout'
      begin
        RestClient.post mailchimp_url(path), data.to_json, content_type: :json, accept: :json
      rescue RestClient::BadRequest => e
        puts "MailChimp error: #{e.http_body}"
        raise e
      end
    end

    def put(path, data = {})
      RestClient.log = 'stdout'
      begin
        RestClient.put mailchimp_url(path), data.to_json, content_type: :json, accept: :json
      rescue RestClient::BadRequest => e
        puts "MailChimp error: #{e.http_body}"
        raise e
      end
    end

    def delete(path)
      RestClient.log = 'stdout'
      begin
        RestClient.delete mailchimp_url(path)
      rescue RestClient::BadRequest => e
        puts "MailChimp error: #{e.http_body}"
        raise e
      end
    end

    def mailchimp_url(path)
      "https://username:#{apiKey}@#{server}/3.0#{path}"
    end
end
