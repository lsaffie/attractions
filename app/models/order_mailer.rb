class OrderMailer < ActionMailer::Base

  def confirm_admin(order,cart)
    @subject    = 'OrderMailer#confirm'
    #@body       = {}
    @body["name"] = order.guest_name
    @body["arrival_date"] =order.arrival_date
    @body["confirmation_number"] =order.confirmation_number
    @body["telephone"] =order.telephone  
    @body["items"] = order.attraction_line_items
    @body["total"] = cart.total_price
    @recipients = 'mive@renaissancetoronto.com'
    @from = 'testing@dfdsolutions.com'
    #@sent_on    = sent_at
    @headers    = {}
  end
  
  def confirm_guest(order,cart)
    @subject    = 'OrderMailer#confirm'
    #@body       = {}
    @body["name"] = order.guest_name
    @body["arrival_date"] =order.arrival_date
    @body["confirmation_number"] =order.confirmation_number
    @body["telephone"] =order.telephone
    @body["items"] = order.attraction_line_items
    @body["total"] = cart.total_price
    #@recipients = 'jose_luisu@hotmail.com'
    @recipients = order.email
    @from = 'testing@dfdsolutions.com'
    #@sent_on    = sent_at
    @headers    = {}
  end

  def sent(sent_at = Time.now)
    @subject    = 'OrderMailer#sent'
    @body       = {}
    @recipients = ''
    @from       = ''
    @sent_on    = sent_at
    @headers    = {}
  end
  
  
  # def contact(recipient, subject, message, sent_at = Time.now)
  #    @subject = subject
  #    @recipients = recipient
  #    @from = 'no-reply@yourdomain.com'
  #    @sent_on = sent_at
  #     @body["title"] = 'This is title'
  #     @body["email"] = 'sender@yourdomain.com'
  #     @body["message"] = message
  #    @headers = {}
  # end
  
end
