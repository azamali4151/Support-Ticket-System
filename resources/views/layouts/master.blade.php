<!doctype html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title></title>
      <link href="https://cdn.jsdelivr.net/bootstrap.timepicker/0.2.6/css/bootstrap-timepicker.min.css" rel="stylesheet" />
      <link rel="stylesheet" href="{{ URL::asset('assets/vendors/bootstrap/dist/css/bootstrap.min.css') }}" />
      <link rel="stylesheet" href="{{ URL::asset('assets/vendors/font-awesome/css/font-awesome.min.css') }}" />
      {{--Date Picker--}}
      <link rel="stylesheet" href="{{ URL::asset('assets/vendors/date-picker/jquery-ui.css') }}" />
      <!-- Datatables -->
      <link rel="stylesheet" href="{{ URL::asset('assets/vendors/datatables.net/1.10.25/css/jquery.dataTables.css') }}">
      <link rel="stylesheet" href="{{ URL::asset('assets/vendors/datatables.net/dataTables.wrapper.css') }}">
      <link rel="stylesheet" href="{{ URL::asset('assets/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css') }}" />
      <link rel="stylesheet" href="{{ URL::asset('assets/vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css') }}" />
      <link rel="stylesheet" href="{{ URL::asset('assets/vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css') }}" />
      <link rel="stylesheet" href="{{ URL::asset('assets/vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css') }}" />
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.9/css/select2.min.css" integrity="sha512-nMNlpuaDPrqlEls3IX/Q56H36qvBASwb3ipuo3MxeWbsQB1881ox0cRv7UPTgBlriqoynt35KjEwgGUeUXIPnw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
      <link rel="stylesheet" href="{{ URL::asset('assets/build/css/custom.min.css') }}" />
      <link rel="stylesheet" href="{{ URL::asset('assets/css/customize.css') }}" />
      <!-- bootstrap-daterangepicker -->
      <link href="{{ URL::asset('assets/vendors/bootstrap-daterangepicker/daterangepicker.css')}}" rel="stylesheet">
      <!-- bootstrap-datetimepicker -->
      <link href="{{ URL::asset('assets/vendors/bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.css')}}" rel="stylesheet">
      <script type="text/javascript" src="{{ URL::asset('assets/vendors/jquery/dist/jquery.min.js') }}"></script>
      <script type="text/javascript" src="{{ URL::asset('assets/vendors/parsleyjs/dist/parsley.js') }}"></script>
   </head>
   <body class="nav-md">
      <div class="container body">
         <div class="main_container">
            <div class="col-md-3 left_col">
               <div class="left_col scroll-view">
                  <!-- sidebar menu -->
                  @include('layouts.leftSideBar')
                  <!-- /sidebar menu -->
               </div>
            </div>
            <!-- top navigation -->
            @include('layouts.topNav')
            <!-- /top navigation -->
            <!-- page content -->
            <div class="right_col" role="main">
               <div style="margin-top:26px !important;"></div>
               @include('layouts.flashMessage')
               <!-- <div class="flash-message"></div> -->
               <style>
                  .spinner-style{
                  display:none; 
                  position:fixed; 
                  top:50%; 
                  left:60%; 
                  transform:translate(-50%, -50%);
                  z-index:9999;
                  }
                  #spinner .spinner-border {
                  width: 3rem;
                  height: 3rem;
                  border-width: 0.4rem;
                  }
               </style>
               <div id="spinner" class="spinner-style">
                  <div class="spinner-border" role="status">
                     <span class="sr-only">Loading...</span>
                  </div>
               </div>
               @yield('content')
            </div>
            <!-- /page content -->
            <!-- footer content -->
            @include('layouts.footer')
            <!-- /footer content -->
         </div>
      </div>
      <!-- /compose -->
      <!-- Open Global modal-->
      <div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
         <div id="modalSize" class="modal-dialog">
            <div class="modal-content">
               <div class="modal-header" style="background-color: #0b58a2;color: white;"style="background-color: #0b58a2;color: white;">
                  <h4 class="modal-title" id="myModalLabel"></h4>
                  <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                  </button>
               </div>
               <div class="modal-body">
                  <h4>Text in a modal</h4>
                  <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                  <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non metus auctor fringilla.</p>
               </div>
               <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
               </div>
            </div>
         </div>
      </div>
      <script>
         $(document).ready(function(){
           $('.dynamicModal').click(function(){
           var modal_size = $(this).attr('data-modal-size');
           if ( modal_size!=='' && typeof modal_size !== typeof undefined && modal_size !== false ) {
             $("#modalSize").addClass(modal_size);
           }
           else{
             $("#modalSize").addClass('modal-lg');
         
              }
         
            var pageTitle = $(this).attr('pageTitle');
            var pageLink = $(this).attr('pageLink');
            $('.modal .modal-title').html(pageTitle)
            $('.modal .modal-body').html("Content loading please wait......")
            $('.modal').modal("show");
            $('.modal .modal-body').load(pageLink)
           })
         })
      </script>
      <script>
         $(document).on('click','.child_menu',function(){
             $('#spinner').show(); 
         
             $(window).on('load', function() {
                 $('#spinner').hide(); // Hide the spinner after page load
             });
         })
      </script>
      <script type="text/javascript" src="{{ URL::asset('assets/vendors/bootstrap/dist/js/bootstrap.bundle.min.js') }}"></script>
      <script type="text/javascript" src="{{ URL::asset('assets/vendors/DateJS/build/date.js') }}"></script>
      <script type="text/javascript" src="{{ URL::asset('assets/vendors/moment/min/moment.min.js') }}"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.9/js/select2.min.js" integrity="sha512-9p/L4acAjbjIaaGXmZf0Q2bV42HetlCLbv8EP0z3rLbQED2TAFUlDvAezy7kumYqg5T8jHtDdlm1fgIsr5QzKg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
      <!-- Datatables -->
      <script src="{{ URL::asset('assets/vendors/datatables.net/js/jquery.dataTables.js') }}"></script>
      <script src="{{ URL::asset('assets/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js') }}"></script>
      <script src="{{ URL::asset('assets/vendors/datatables.net-buttons/js/dataTables.buttons.min.js') }}"></script>
      <script src="{{ URL::asset('assets/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js') }}"></script>
      <script src="{{ URL::asset('assets/vendors/datatables.net-buttons/js/buttons.flash.min.js') }}"></script>
      <script src="{{ URL::asset('assets/vendors/datatables.net-buttons/js/buttons.html5.min.js') }}"></script>
      <script src="{{ URL::asset('assets/vendors/datatables.net-buttons/js/buttons.print.min.js') }}"></script>
      <script src="{{ URL::asset('assets/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js') }}"></script>
      <script src="{{ URL::asset('assets/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js') }}"></script>
      <script src="{{ URL::asset('assets/vendors/datatables.net-responsive/js/dataTables.responsive.min.js') }}"></script>
      <script src="{{ URL::asset('assets/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js') }}"></script>
      <script src="{{ URL::asset('assets/vendors/datatables.net-scroller/js/dataTables.scroller.min.js') }}"></script>
      <script src="{{ URL::asset('assets/vendors/datatables.net-buttons/js/buttons.colVis.js') }}"></script>
      <script src="https://cdn.datatables.net/fixedcolumns/4.3.0/js/dataTables.fixedColumns.min.js"></script>
      {{--Date Picker Start--}}
      <script src="{{ URL::asset('assets/vendors/bootstrap-daterangepicker/daterangepicker.js') }}"></script>
      <!-- bootstrap-datetimepicker -->
      <script src="{{ URL::asset('assets/vendors/bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js') }}"></script>
      <!-- Theme Required + Custom -->
      <script type="text/javascript" src="{{ URL::asset('assets/build/js/custom.js') }}"></script>
   </body>