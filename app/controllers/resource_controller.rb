class ResourceController < ApplicationController
  include GoogleAnalytics

  def install_script
    respond_to do |format|
      format.sh { render file: 'resource/install.sh'}
      #trackPageview('Download Install Script')
    end
  end
end
