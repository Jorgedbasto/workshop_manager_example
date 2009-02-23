class User < ActiveRecord::Base
  has_many :registrations
  has_many :workshops, :through=> :registrations
  
  validates_presence_of :name, :email, :bi
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/, :message => 'Invalid Email address', :if => :email?
  validates_uniqueness_of :email, :message=>"That e-mail already exists. Sorry!"
  validates_numericality_of :age, :bi
  
  named_scope :vips, :conditions => {:vip => true}
  named_scope :recent, lambda { { :conditions => ['created_at > ?', 1.week.ago] } }
  named_scope :since_when, lambda { |time_ago| { :conditions => ['created_at > ?', time_ago] }}
  
end
