# frozen_string_literal: true

class CategoryDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable

  def_delegators :@view, :edit_backoffice_category_path
  def_delegators :@view, :link_to
  def_delegators :@view, :backoffice_category_path

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      id: { source: 'Category.id' },
      description: { source: 'Category.description', cond: :like, searchable: true, orderable: true },
      edit: {},
      delete: {}
    }
  end

  def data
    records.map do |record|
      {
        id: "##{record.id}",
        description: record.description,
        edit: link_to("<i class='fa fa-edit'></i>".html_safe, edit_backoffice_category_path(record)),
        delete: link_to("<i class='fa fa-trash'></i>".html_safe, backoffice_category_path(record), method: :delete, data: { confirm: 'Are you sure?' })
        # example:
        # id: record.id,
        # name: record.name
      }
    end
  end

  def get_raw_records
    Category.all
  end
end
