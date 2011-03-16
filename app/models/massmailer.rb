class Massmailer < ActionMailer::Base
  
def send(sbj, recp, sent_at = Time.now)
    subject     sbj #'Agile Maroc - Confirmation inscription'
    recipients recp #user.email
    from       "contact@agilemaroc.org (Agile Maroc)"
    sent_on    sent_at

    body = "event notification "  
  end
end
