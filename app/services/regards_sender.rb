class RegardsSender
  def self.call(recipient_id, sender)
    RegardsMailer.send_regards_email(recipient(recipient_id), sender).deliver
  end

  def self.recipient(recipient_id)
    User.find(recipient_id)
  end
end