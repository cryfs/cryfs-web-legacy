module GoogleAnalytics
  def trackPageview(title)
    tracker = Staccato.tracker('UA-65863982-1')
    tracker.pageview(path: request.env['PATH_INFO'], hostname: request.host, title: title)
  end
end
