class InterestedUser < ActiveRecord::Base
  validates_email_format_of :email, :message => 'invalid email address'
end
