module ApplicationHelper
  def cp(path)
    "current" if request.path == path
  end
end
