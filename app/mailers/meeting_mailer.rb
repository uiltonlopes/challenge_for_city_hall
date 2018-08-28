class MeetingMailer < ApplicationMailer

  default from: 'notifications@example.com'
 
  def meeting_mornings_email(member)
    @member = member
    @url  = "http://localhost:3000/meeting_mornings/#{@member.id}/new"
    mail(to: @member.email, subject: 'Bom dia')
  end
 
  def meeting_afternoons_email(member)
    @member = member
    @url  = "http://localhost:3000/meeting_afternoons/#{@member.id}/new"
    mail(to: @member.email, subject: 'Boa tarde')
  end

end
