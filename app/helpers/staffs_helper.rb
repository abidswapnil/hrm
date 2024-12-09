module StaffsHelper
  def designation_name(id)
    Designation.find_by(id: id)&.name
  end
end
