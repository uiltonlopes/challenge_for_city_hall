// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
//= require rails_ujs_sweetalert_confirm.js
//= require rails-ujs
//= require bootstrap-sprockets
//= require vendors/fastclick/lib/fastclick.js
//= require vendors/nprogress/nprogress.js
//= require vendors/datatables.net/js/jquery.dataTables.min.js
//= require vendors/datatables.net-bs/js/dataTables.bootstrap.min.js
//= require vendors/datatables.net-buttons/js/dataTables.buttons.min.js
//= require vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js
//= require vendors/datatables.net-buttons/js/buttons.flash.min.js
//= require vendors/datatables.net-buttons/js/buttons.html5.min.js
//= require vendors/datatables.net-buttons/js/buttons.print.min.js
//= require vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js
//= require vendors/datatables.net-keytable/js/dataTables.keyTable.min.js
//= require vendors/datatables.net-responsive/js/dataTables.responsive.min.js
//= require vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js
//= require vendors/datatables.net-scroller/js/dataTables.scroller.min.js
//= require vendors/jszip/dist/jszip.min.js
//= require vendors/pdfmake/build/pdfmake.min.js
//= require vendors/pdfmake/build/vfs_fonts.js
//= require vendors/pnotify/dist/pnotify.js
//= require vendors/pnotify/dist/pnotify.buttons.js
//= require vendors/pnotify/dist/pnotify.nonblock.js
//= require vendors/moment/min/moment.min.js
//= require vendors/moment/locale/pt-br.js
//= require vendors/bootstrap-daterangepicker/daterangepicker.js
//= require dist/jquery.inputmask.bundle.js
//= require sweetalert2
//= require rails-sweetalert2-confirm
//= require custom.js

var sweetAlertConfirmDefaults = {
    title: 'Are you sure?',
    type: 'warning',
    showCancelButton: true,
    confirmButtonText: "I'm sure",
    confirmButtonClass: 'btn btn-danger',
    cancelButtonClass: 'btn btn-default',
};
moment.locale('pt-BR');