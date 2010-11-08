class EventMailer < ActionMailer::Base
  

  def confirm(user, event, sent_at = Time.now)
    subject     'Agile Maroc - Confirmation inscription'
    recipients user.email
    from       "contact@agilemaroc.org (Agile Maroc)"
    sent_on    sent_at

    body["user"] = user       
    body["event"] = event       
  end

  def remind(sent_at = Time.now)
    subject    'EventMailer#remind'
    recipients ''
    from       ''
    sent_on    sent_at
    
    body       :greeting => 'Hi,'
  end

end
