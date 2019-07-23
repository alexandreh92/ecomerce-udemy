# frozen_string_literal: true

class AdminDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable

  def_delegators :@view, :edit_backoffice_admin_path
  def_delegators :@view, :link_to
  def_delegators :@view, :backoffice_admin_path

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      id: { source: 'Admin.id', cond: :like, searchable: true, orderable: true },
      email: { source: 'Admin.email', cond: :like, searchable: true, orderable: true },
      edit: {},
      delete: {}
      # id: { source: "User.id", cond: :eq },
      # name: { source: "User.name", cond: :like }
    }
  end

  def data
    records.map do |record|
      {
        id: "##{record.id}",
        email: record.email,
        # edit: ('teste' if record.id == current_admin),
        edit: link_to("<i class='fa fa-edit'></i>".html_safe, edit_backoffice_admin_path(record)),
        delete: link_to("<i class='fa fa-trash'></i>".html_safe, backoffice_admin_path(record), method: :delete, data: { confirm: 'Are you sure?' })
        # example:
        # id: record.id,
        # name: record.name
      }
    end
  end

  def get_raw_records
    Admin.all
    # insert query here
    # User.all
  end
end
