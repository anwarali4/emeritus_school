module ApplicationHelper

	 #
  # Make tab active
  #
  def active page = nil, action_name = false
    return "" if page.blank?
    current_uri = request.env['PATH_INFO']
    if action_name.blank?
      return "active" if current_uri.match(/\/#{page.gsub(/\s/,'')}/).present?
      singularize = page.gsub(/\s/,'').singularize
      return "active" if controller.controller_name.match(/\/#{singularize}\//).present?
      return "active" if controller.controller_name == page
    end
    return "active" if controller.controller_name == page
  end
end
