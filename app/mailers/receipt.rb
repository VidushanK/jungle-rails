class Receipt < ApplicationMailer
  default from: 'no-reply@jungle.com'


  def welcome_email(order)

    @order = order
      @url  = 'http://example.com/login'
      mail(to: @order.email, subject: @order.id)
    end
end
