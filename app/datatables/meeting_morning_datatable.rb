class MeetingMorningDatatable < AjaxDatatablesRails::Base

  def_delegators :@view

  def view_columns
    @view_columns ||= {
      id:             { source: "MeetingMorning.id" },
      message_one:    { source: "MeetingMorning.message_one", cond: :like, searchable: true, orderable: true },
      message_two:    { source: "MeetingMorning.message_two", cond: :like, searchable: true, orderable: true },
      created_at:     { source: "MeetingMorning.created_at", cond: :like, searchable: true, orderable: true },
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
    MeetingMorning.where(member_id: options[:member])
  end

end
