module ApplicationHelper

  def cp(path)
    path.include?(controller_name) || current_page?(path) ? 'current' : ''
  end

end
