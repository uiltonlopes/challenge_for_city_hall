class MeetingAfternoonDatatable < AjaxDatatablesRails::Base

  def_delegators :@view

  def view_columns
    @view_columns ||= {
      id:             { source: "MeetingAfternoon.id" },
      message_one:    { source: "MeetingAfternoon.message_one", cond: :like, searchable: true, orderable: true },
      message_two:    { source: "MeetingAfternoon.message_two", cond: :like, searchable: true, orderable: true },
      created_at:     { source: "MeetingAfternoon.created_at", cond: :like, searchable: true, orderable: true },
    }
  end

  def data
    records.map do |record|
      {
        id:            record.id,
        message_one:   record.message_one,
        message_two:   record.message_two,
        created_at:    record.created_at,
        DT_RowId:      record.id
      }
    end
  end

  def get_raw_records
    MeetingAfternoon.where(member_id: options[:member])
  end

end
