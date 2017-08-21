class RegardsSender
  def self.call(params, sender)
    RegardsMailer.send_regards_email(recipient(params), sender).deliver
  end

  def self.recipient(params)
    User.find(params[:id])
  end
end