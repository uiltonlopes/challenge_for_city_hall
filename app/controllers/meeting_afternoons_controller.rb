class MeetingAfternoonsController < ApplicationController
    def index
        @meetings = MeetingAfternoon.where(member_id: params[:id])
        respond_to do |format|
        format.html
        format.json { render json: MeetingAfternoonDatatable.new(view_context, member: params[:id]) }
        end
    end

    def new
        @meeting = MeetingAfternoon.new
    end

    def create
        @member = Member.find(params[:id])
        @meeting = MeetingAfternoon.new(meeting_params)
        @meeting.member_id = @member.id

        begin
        if @meeting.save
            redirect_to meeting_afternoons_path(params[:id])
            flash[:success] = 'Resposta cadastrado com sucesso!'
        end
        rescue => exception
            flash[:error] = 'Erro ao cadastrada resposta!'
        end
    end

    private

    def meeting_params
        params.require(:meeting_afternoon).permit(:message_one, :message_two)
    end
end
