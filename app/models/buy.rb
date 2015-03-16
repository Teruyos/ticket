class Buy < ActiveRecord::Base
  attr_accessible :amount
  belongs_to :post
  belongs_to :user
end
