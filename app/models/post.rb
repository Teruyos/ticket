class Post < ActiveRecord::Base
    
    #default_scope :order => 'created_at ASC'
    # paginates_per 5

  attr_accessible :content, :title, :artist, :place, :date, :price, :amount,:category_id
  has_many :comments
  
  attr_accessible :avatar
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }

  validates :title, :presence => true
  validates :content, :presence => true,
                      :length => { :minimum => 5 }
                      
#validates :avatar, :presence => true

  scope :artist_or_content_or_title_matches, lambda {|q|
  where 'artist like :q or content like :q or title like :q', :q => "%#{q}%"
  }

  has_many :categories
  has_many :buys
  accepts_nested_attributes_for :categories
  attr_accessible :categories_attributes
  accepts_nested_attributes_for :buys
  attr_accessible :buys_attributes

end
