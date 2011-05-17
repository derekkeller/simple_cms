class Subject < ActiveRecord::Base

  has_many :pages, :dependent => :destroy

  validates :name, :presence => {:message => "stopped this from working - and I made this error!"}
  # validates :position, :length => {:within => 2..3, :message => "is freaking crazy in here!"}
  
  # scope :visible, where(:visible => true)
  # scope :invisible, where(:visible => false)
  # scope :search, lambda{|query| where("name LIKE ?", "%#{query}%")}
  # scope :complete_search, lambda{ |subject_name, visible| where("name LIKE ? AND visible = ?", "%#{subject_name}%", visible)}

end







  