class RegardsSend
  include Service

  def initialize(recipient_id, sender_id)
    @recipient = User.where(id: recipient_id).first
    @sender = User.where(id: sender_id).first
  end

  def call
    return false if @recipient.blank? || @sender.blank?

    begin
      RegardsMailer.send_regards_email(@recipient, @sender).deliver
    rescue
      false
    end
  end
end
