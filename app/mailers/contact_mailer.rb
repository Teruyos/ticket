# coding: utf-8

class ContactMailer < ActionMailer::Base
    default from: "teruyo147@gmail.com"
    def sent(contact)
        @contact = contact
        mail(:to => "yfateru@hotmail.com", :from => @contact.email, :subject => 'フォームからのお問い合わせ')
    end
end