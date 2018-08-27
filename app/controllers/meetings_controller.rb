class MeetingsController < ApplicationController

    def index
        @meetings = Meeting.where(member_id: params[:id])
        respond_to do |format|
        format.html
        format.json { render json: MeetingDatatable.new(view_context, member: params[:id]) }
        end
    end
end
