class MeetingDatatable < AjaxDatatablesRails::Base

  def_delegators :@view

  def view_columns
    @view_columns ||= {
      id:             { source: "Meeting.id" },
      message:        { source: "Meeting.message", cond: :like, searchable: true, orderable: true },
      created_at:     { source: "Meeting.created_at", cond: :like, searchable: true, orderable: true },
    }
  end

  def data
    records.map do |record|
      {
        id:            record.id,
        message:       record.message,
        created_at:    record.created_at,
        DT_RowId:      record.id
      }
    end
  end

  def get_raw_records
    Meeting.where(member_id: options[:member])
  end

end
