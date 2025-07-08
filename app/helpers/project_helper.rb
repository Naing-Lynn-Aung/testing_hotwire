module ProjectHelper
  def highlight_query
    params[:search].to_s.split(" ")
  end
end
