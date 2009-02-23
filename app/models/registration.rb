class Registration < ActiveRecord::Base

  belongs_to :user
  belongs_to :workshop

  validates_presence_of :user_id
  validates_presence_of :workshop_id
  validates_uniqueness_of :user_id, :scope=>:workshop_id,  :if => :user_id?
  validates_associated :user
  
end
