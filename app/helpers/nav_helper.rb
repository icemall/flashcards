# frozen_string_literal: true

module NavHelper
  def active_link_to(anchor, path, options = {})
    options[:class] = 'active' if active_action?(options)
    options.delete(:controller_name)
    options.delete(:action_name)
    link_to anchor, path, options
  end

  private

  def active_action?(options)
    controller_name == options[:controller_name] && action_name == options[:action_name]
  end
end
