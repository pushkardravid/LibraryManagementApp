class ExampleMailer < ApplicationMailer
    default from: "pushkarsdravid@gmail.com"

    def sample_email(user)
        puts 'start'
        @user = user
        mail(to: 'shikhad07@gmail.com', subject: 'Sample Email')
        puts 'end'
    end

end
