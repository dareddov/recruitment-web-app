class RegardsSend
  include Service

  def initialize(recipient_id, sender_id)
    @recipient = User.find(recipient_id)
    @sender = User.find(sender_id)
  end

  def call
    begin
      RegardsMailer.send_regards_email(@recipient, @sender).deliver
    rescue
      success?(false)
    end
    success?
  end

  def success?(result = true)
    @result ||= result
  end
end