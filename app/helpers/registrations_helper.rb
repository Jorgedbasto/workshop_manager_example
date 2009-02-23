module RegistrationsHelper

  def human_confirmation_helper(confirmation)
    if confirmation
      "<span>Yes</span>"
    else
      "<span class=\"no_confirm\">No</span>"
    end
  end
  
  #receives params[:action]
  #if action == new we show the link
  def create_new_user_helper(action)
     link_to_function "or Create new?" do |page| 
   	  page['new_user'].show
   	  #page['select_user'].hide
   	  page['new_user'].highlight
   	  page['registration_user_id'].value = nil
     end if action!="edit"
   end
end
