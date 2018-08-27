class TeamDatatable < AjaxDatatablesRails::Base

  def_delegators :@view, :link_to, :team_path, :edit_team_path

  def view_columns
    @view_columns ||= {
      id:             { source: "Team.id" },
      name:           { source: "Team.name", cond: :like, searchable: true, orderable: true },
      show:           { source: "show", searchable: false, orderable: false},
      edit:           { source: "edit", searchable: false, orderable: false},
      delete:         { source: "delete", searchable: false, orderable: false}
    }
  end

  def data
    records.map do |record|
      {
        id:            record.id,
        name:          record.name,
        DT_RowId:      record.id, # This will automagically set the id attribute on the correspondin
        show:          link_to(("<i class='fas fa-eye'></i>").html_safe, team_path(record),class:"btn btn-primary btn-xs", data: {toggle: "tooltip", placement: "top" }, title: "Visualizar"),
        edit:          link_to(("<i class='far fa-edit'></i>").html_safe, edit_team_path(record),class:"btn btn-info btn-xs", remote: true, data: {toggle: "tooltip", placement: "top" }, title: "Editar"),
        delete:        link_to(("<i class='far fa-trash-alt'></i>").html_safe, team_path(record),class:"btn btn-danger btn-xs",remote: true, method: :delete, data: { confirm_swal: "Você tem certeza?", toggle: "tooltip", placement: "top"}, title: "Excluir"),
      }
    end
  end

  def get_raw_records
    Team.where(user_id: options[:user])
  end

end
