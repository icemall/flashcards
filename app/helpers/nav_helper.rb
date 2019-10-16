module NavHelper
  def activatable_class(controller)
    'active' if controller == controller_name
  end

  def active_link_to(anchor, path, options={})
    options.merge!(class: 'active') if controller_name == options[:controller_name]
    link_to anchor, path, options
  end
end