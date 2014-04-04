class Contact < ActiveRecord::Base
    attr_accessible :name, :furigana, :email, :content
end