//= require bootstrap_sb_admin_base_v2
//= require datatables
//= require notifyjs
//= require backoffice/bootbox



jQuery(document).on('turbolinks:load',function () {
  $('.data-toggle').collapse();
});


jQuery(document).ready(function() {
  $('#categories-datatable').dataTable({
    "processing": true,
    "serverSide": true,
    "ajax": {
      "url": $('#categories-datatable').data('source')
    },
    "autoFill": true,
    "pagingType": "full_numbers",
    "columns": [
      {"data": "id"},
      {"data": "description"},
      {"data": "edit"},
      {"data": "delete"}
    ],
    "columnDefs": [
      {
          "targets": [0,2,3],
          "className": "text-center",
          "width": "1%",
          "orderable": false
     },
    ]
    // pagingType is optional, if you want full pagination controls.
    // Check dataTables documentation to learn more about
    // available options.
  });
  $('#admins-datatable').dataTable({
    "processing": true,
    "serverSide": true,
    "ajax": {
      "url": $('#admins-datatable').data('source')
    },
    "autoFill": true,
    "pagingType": "full_numbers",
    "columns": [
      {"data": "id"},
      {"data": "email"},
      {"data": "edit"},
      {"data": "delete"}
    ],
    "columnDefs": [
      {
          "targets": [0,2,3],
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