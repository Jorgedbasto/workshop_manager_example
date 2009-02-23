class Registration < ActiveRecord::Base

  belongs_to :user
  belongs_to :workshop
  
  validates_uniqueness_of :user_id, :scope=>:workshop_id
  validates_presence_of :user
  validates_presence_of :workshop_id
 
end
