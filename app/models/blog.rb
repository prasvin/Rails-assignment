class Blog < ActiveRecord::Base

  validates :author, :presence => true
  validates :email, :presence => true
  validates :general_content,  :inclusion => {:in => [true, false]}
  validates :category, :presence => true
  validates :title, :presence => true
  validates :description,  :presence => true

  before_save :title_capitalize
  scope :general_stuff, where(:general_content => true)

  def title_capitalize
    self.title.upcase!
  end

end
