module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url
    link_to 'https://github.com/bakutinamari'
  end
end
