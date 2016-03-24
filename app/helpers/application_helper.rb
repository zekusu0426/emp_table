module ApplicationHelper
    def active?(controller_name)
     return "active" if controller_name == params[:controller]
  end
end
