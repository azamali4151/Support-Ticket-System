
@php $actionUrl=url('/updateTicketAssignInfo'); @endphp
<script>$('form').parsley();</script>
<?php ini_set('memory_limit', -1) ?>
<div class="flash-message"></div>
<style>
   .select2-container--open .select2-dropdown--below {
  position: relative;
}

.select2-container--default .select2-search--dropdown .select2-search__field {
  position: absolute;
  top: -35px;
  border: 0px !important;
  width: 85%;
}

.select2-container--default .select2-search--dropdown .select2-search__field:focus-visible {
  outline: -webkit-focus-ring-color auto 0px;
}
</style>
<div class="x_content">
   <form id="ClassRoutineForm" data-parsley-validate="" role="form" method="post" action="{{$actionUrl}}"
      class="form-label-left" enctype="multipart/form-data" autocomplete="off">
      @csrf
     
      <div class="field item form-group">
         <label class="col-form-label col-md-3 col-sm-3  label-align">Employee*</label>
         <div class="col-md-6 col-sm-6">
            <select class="form-control select2"  name="employee_id" id="employeeId" style="width:245px;">
               <option value="">--select--</option>
               @foreach($employees as $emp)
               <option value="{{$emp->id}}" @if($emp->id == $result->employee_id) selected @endif>{{$emp->name}}</option>
              @endforeach
            </select>
         </div>
      </div>
     
      
      <div class="field item form-group">
         <label class="col-form-label col-md-3 col-sm-3  label-align">Forecast Date</label>
         <div class="col-md-3 col-sm-3">
         <input type="text" name="forecast_date" value="@if(!empty($result->forecast_date)){{date('d-m-Y',strtotime($result->forecast_date))}} @else {{date('d-m-Y')}} @endif" class="form-control  datepickerMonthYearAppend" id="" style="width:245px"/>
         </div>
      </div>
     
      <div class="clearfix"></div>
      <div class="form-group">
         <div class="col-md-6 offset-md-3">
            <input type="hidden" name="ticket_id" value="{{$result->id}}">
            <button type='reset' class="btn btn-success">Reset</button>
            <button type="submit" class="btn btn-primary" id="btnSubmit">Submit</button>
         </div>
      </div>
   </form>
</div>
<script src="{{ URL::asset('assets/custom_js/custom_calendar.js') }}"></script>
<script>
  
   $('.select2').select2({
       dropdownParent: $('.modal .modal-content'),
       //allowClear: true,
        matcher: function(params, data) {
            // Normalize input for comparison
            var term = $.trim(params.term).toLowerCase();
            var text = $.trim(data.text).toLowerCase();
            //var id = data.id.toString().toLowerCase();
            var id = data.title.toString().toLowerCase();

            // Match either by name or ID
            if (text.indexOf(term) > -1 || id.indexOf(term) > -1) {
                return data;
            }

            return null;
        }
        
   });
   $(document).on('focus', '.datepickerMonthYearAppend', function(e){
        $(e.target).daterangepicker({
            singleDatePicker: true,
            singleClasses: "picker_1",
            showDropdowns: true,
            minDate: new Date(),
            maxDate: $('#block_to_date').val(),
            locale: {
                format: "DD-MM-YYYY"
            }
        })
    }).on('show.daterangepicker', function () {
        $('.table-condensed tbody tr:nth-child(2) td').click();
    });
</script>