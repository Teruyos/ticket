# coding: utf-8

class Commentsendmail < ActionMailer::Base
    default from: "teruyo147@gmail.com"
    
    # Subject can be set in your I18n file at config/locales/en.yml
    # with the following lookup:
    #
    #   en.test_mailer.sendmail.subject
    #
    
    def sendmail(comment)
        @comment = comment
        
        mail(:to => "teruyo147@gmail.com",
             :cc => "yfateru@hotmail.com",
             :subject => 'コメントが追加されました')
    end
end