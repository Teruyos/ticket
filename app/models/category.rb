class Category < ActiveRecord::Base
    attr_accessible :name, :id
    has_many :post
end
