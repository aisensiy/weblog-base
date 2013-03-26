module PageViewsHelper
  def domain(url)
    m = %r{[a-zA-Z0-9]+://([^/]+).*}.match(url)
    m && m[1]
  end

  def human_time(ms)
    x = ms / 1000
    seconds = x % 60
    x /= 60
    minutes = x % 60
    x /= 60
    hours = x % 24
    x /= 24
    days = x

    results = ""
    results =  "#{days} days, " if days > 0
    results += "#{hours} hours " if hours > 0
    results += "#{minutes} minutes " if minutes > 0
    results += "#{seconds} seconds" if seconds > 0

    results
  end
end
