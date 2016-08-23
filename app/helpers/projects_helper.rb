module ProjectsHelper
  def is_active?(project)
    if project.active == true
      return "Yes"
    else
      return "No"
    end
  end
end
