//= require bootstrap_sb_admin_base_v2
//= require datatables
//= require notifyjs
//= require bootbox

$.rails.allowAction = function(element) {
  var message = element.attr('data-confirm');
  if (!message) { return true; }

  var opts = {
    title: "Atencao!",
    message: message,
    buttons: {
        confirm: {
            label: 'Sim',
            className: 'btn-primary'
        },
        cancel: {
            label: 'Cancel',
            className: 'btn-default'
        }
    },
    callback: function(result) {
      if (result) {
        element.removeAttr('data-confirm');
        element.trigger('click.rails')
      }
    }
  };
  

  bootbox.confirm(opts);

  return false;
}



// custom notifier js
var notify = (function() {
  "use strict";

  var elem,
      hideHandler,
      that = {};

  that.init = function(options) {
      elem = $(options.selector);
  };

  that.show = function(text) {
      clearTimeout(hideHandler);

      elem.find("span").html(text);
      elem.delay(200).fadeIn().delay(4000).fadeOut();
  };

  return that;
}());


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
      {"data": "name"},
      {"data": "email"},
      {"data": "role"},
      {"data": "edit"},
      {"data": "delete"}
    ],
    "columnDefs": [
      {
          "targets": [0,4,5],
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