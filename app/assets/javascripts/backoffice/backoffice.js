//= require bootstrap_sb_admin_base_v2
//= require datatables


jQuery(document).on('turbolinks:load',function() {
  $('#categories-datatable').dataTable({
    "processing": true,
    "serverSide": true,
    "ajax": {
      "url": $('#categories-datatable').data('source')
    },
    "autoFill": true,
    "pagingType": "full_numbers",
    "columns": [
      {"data": "description"},
      {"data": "edit"},
      {"data": "delete"}
    ],
    "columnDefs": [
      {
          "targets": [1,2],
          "className": "text-center",
          "width": "1%",
          "orderable": false
     },
    ]
    // pagingType is optional, if you want full pagination controls.
    // Check dataTables documentation to learn more about
    // available options.
  });
});