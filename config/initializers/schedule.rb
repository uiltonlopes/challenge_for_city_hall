# config/initializers/scheduler.rb
require 'rubygems'
require 'rufus-scheduler'
require 'json'
# Let's use the rufus-scheduler singleton

s = Rufus::Scheduler.singleton

s.cron '0 8 * * *' do
    members = Member.all
    members.each do |member|
        MeetingMailer.meeting_mornings_email(member).deliver_now
    end
end

s.cron '0 16 * * *' do
    members = Member.all
    members.each do |member|
        MeetingMailer.meeting_afternoons_email(member).deliver_now
    end
end
