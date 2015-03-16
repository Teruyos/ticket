class Category < ActiveRecord::Base
    attr_accessible :name, :id
    belongs_to :post
end
