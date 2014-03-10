class Post < ActiveRecord::Base
    
    default_scope :order => 'created_at ASC'
    paginates_per 5

  attr_accessible :content, :title

  has_many :comments
  
  attr_accessible :avatar
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }

  validates :title, :presence => true
  validates :content, :presence => true,
                      :length => { :minimum => 5 }
                      
  validates :avatar, :presence => true

  scope :content_or_title_matches, lambda {|q|
  where 'content like :q or title like :q', :q => "%#{q}%"
  }

  attr_accessible :content, :title, :category_id
  has_many :categories

end
