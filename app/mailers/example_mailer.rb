class ExampleMailer < ApplicationMailer
    default from: "pushkarsdravid@gmail.com"

    def sample_email(user)
        puts 'start'
        @user = user
        mail(to: @user.email, subject: 'Sample Email')
        puts 'end'
    end

    def librarian_email(user)
        puts 'start'
        @user = user
        mail(to: @user.email, subject: 'Account approved')
        puts 'end'
    end

end
