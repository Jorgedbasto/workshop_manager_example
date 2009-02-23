# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper


  def data_pt_helper(date)
    return "<span class='date'>#{ date.strftime("%d/%m/%Y") }</span>"
  end

end

