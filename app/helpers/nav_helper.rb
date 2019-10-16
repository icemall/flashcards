module NavHelper
  def active_link_to(anchor, path, options = {})
    if controller_name == options[:controller_name]
      options[:class] = 'active'
      options.delete(:controller_name)
    end
    link_to anchor, path, options
  end
end