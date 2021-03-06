class MemberDatatable < AjaxDatatablesRails::Base

  def_delegators :@view, :link_to, :member_path, :edit_member_path, :meeting_mornings_path, :meeting_afternoons_path

  def view_columns
    @view_columns ||= {
      id:             { source: "Member.id" },
      email:          { source: "Member.email", cond: :like, searchable: true, orderable: true },
      name:           { source: "Team.name", cond: :like, searchable: true, orderable: true },
      morning:        { source: "morning", searchable: false, orderable: false},
      afternoon:      { source: "afternoon", searchable: false, orderable: false},
      edit:           { source: "edit", searchable: false, orderable: false},
      delete:         { source: "delete", searchable: false, orderable: false}
    }
  end

  def data
    records.map do |record|
      {
        id:            record.id,
        email:         record.email,
        name:          record.team.name,
        DT_RowId:      record.id, # This will automagically set the id attribute on the correspondin
        morning:       link_to(("<i class='fas fa-eye'></i>").html_safe, meeting_mornings_path(record),class:"btn btn-primary btn-xs", data: {toggle: "tooltip", placement: "top" }, title: "Respostar da manhã"),
        afternoon:     link_to(("<i class='fas fa-eye'></i>").html_safe, meeting_afternoons_path(record),class:"btn btn-primary btn-xs", data: {toggle: "tooltip", placement: "top" }, title: "Respostas da tarde"),
        edit:          link_to(("<i class='far fa-edit'></i>").html_safe, edit_member_path(record),class:"btn btn-info btn-xs", remote: true, data: {toggle: "tooltip", placement: "top" }, title: "Editar"),
        delete:        link_to(("<i class='far fa-trash-alt'></i>").html_safe, member_path(record),class:"btn btn-danger btn-xs",remote: true, method: :delete, data: { confirm_swal: "Você tem certeza?", toggle: "tooltip", placement: "top"}, title: "Excluir"),
      }
    end
  end

  def get_raw_records
    Member.where(user_id: options[:user]).joins(:team)
  end

end
