module NavHelper
  def activatable_class(controller)
    'active' if controller == controller_name
  end
end