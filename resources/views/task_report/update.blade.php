@section('content')
    @php $actionUrl=url('/updateTaskInfo'); @endphp
    <script>$('form').parsley();</script>
    <style>
        .reasonDiv{
            display:none; }
        .taskResoluation{
            display:none; 
        }
    </style>
    <?php ini_set('memory_limit', -1) ?>
    <div class="flash-message"></div>
    <div class="x_content">
        <form id="ProjectForm" data-parsley-validate="" role="form" method="post" action="{{$actionUrl}}"
              class="form-label-left" enctype="multipart/form-data" autocomplete="off">
            @csrf
            <div class="field item form-group">
                <label class="col-form-label col-md-3 col-sm-3 label-align">Task Title*</label>
                <div class="col-md-6 col-sm-6">
                    <input type="text" value="{{$result->task_title}}" class=" form-control" @if($result->task_complete >0 ) readonly  @endif name="task_title" required />
                </div>

            </div>
            <div class="field item form-group">
                <label class="col-form-label col-md-3 col-sm-3 label-align">Task Description*</label>
                <div class="col-md-6 col-sm-6">
                    {{--                <input type="text" value="{{$result->task_desc}}" class=" form-control" name="task_desc" required />--}}
                    <textarea class="form-control textarea_desc" @if($result->task_complete >0 ) readonly  @endif name="task_desc">{{$result->task_desc}}</textarea>
                </div>
            </div>

            <div class="field item form-group">
                <label class="col-form-label col-md-3 col-sm-3  label-align">Assign Date</label>
                <div class="col-md-3 col-sm-3">
                    <input type="hidden" class="ticketId" value="{{$result->ticket_id}}"/>
                    <input type="text" value="{{date('d-m-Y',strtotime($result->assign_date))}}" name="assign_date_dis" class="form-control assignDate datepickerMonthYearAppend" id="" style="background-color:#fff; width: 170px !important;" disabled />
                    <input type="hidden" value="{{date('d-m-Y',strtotime($result->assign_date))}}" name="assign_date">
                </div>
                Forecast Date
                <div class="col-md-3 col-sm-3">
                    <input type="text" value="{{date('d-m-Y',strtotime($result->forecast_date))}}" name="forecast_date" class="form-control assignDate datepickerMonthYearAppend" id="changeForecastDate" style="background-color:#fff;width: 170px !important;"  />
                    <input type="hidden" class="oldForecastDate" value="{{date('Y-m-d',strtotime($result->forecast_date))}}">
                </div>
            </div>
            <div class="field item form-group">
                <label class="col-form-label col-md-3 col-sm-3 label-align">Task % *</label>
                <div class="col-md-6 col-sm-6">
                <input type="number" min="{{$result->task_complete}}" max="100" value="{{$result->task_complete}}" name="task_complete" class="form-control taskPercentage" id="taskPercentage" />
                </div>

            </div>
           
            
            <div class="field item form-group">
                <label class="col-form-label col-md-3 col-sm-3 label-align reasonDiv">Reason *</label>
                <div class="col-md-6 col-sm-6 reasonDiv">
                    <input type="text" value="" class=" form-control change_reason" name="fdate_change_reason" />
                </div>
            </div>
            @if(!empty($result->ticket_id))
            <div class="field item form-group">
                <label class="col-form-label col-md-3 col-sm-3 label-align taskResoluation">Task Resoluation*</label>
                <div class="col-md-6 col-sm-6 taskResoluation">
                    
                    <textarea class="form-control task_resoluation textarea_desc" name="task_resolution"></textarea>
                </div>
            </div>
            @endif
            
            <div class="field item form-group">
                <label class="col-form-label col-md-3 col-sm-3  label-align">Active Status <span
                        class="required  input-field-required-sign">*</span></label>
                <div class="col-md-6 col-sm-6">
                    <select class="form-control" name="active_status">
                        <option value="1" {{ ($result->active_status==1)? 'selected':'' }}>Active</option>
                        <option value="0" {{ ($result->active_status<1)? 'selected':'' }}>Inactive</option>
                    </select>
                </div>
            </div>

            <div class="clearfix"></div>

            <div class="form-group">
                <div class="col-md-6 offset-md-3">
                    <input type="hidden" name="task_id" value="{{$result->task_id}}">
                    <button type='reset' class="btn btn-success">Reset</button>
                    <button type="submit" class="btn btn-primary" id="btnSubmit">Submit</button>
                </div>
            </div>

        </form>
    </div>

    

    <script type="text/javascript">
        
        $('#taskPercentage').keyup(function() {
            let taskPer = $(this).val();
            let ticketId = $('.ticketId').val();
            if(ticketId !=""){
                if(taskPer =='100'){
                $('.taskResoluation').css('display','block');
                $('.task_resoluation').prop('required',true);
            }else{
                $('.taskResoluation').css('display','none');
                $('.task_resoluation').prop('required',false);
                return false;
            }
            }else{
                return false;
            }
            
        });
        $(document).on('focus', '.datepickerMonthYearAppend', function(e){
            $(e.target).daterangepicker({
                singleDatePicker: true,
                singleClasses: "picker_1",
                showDropdowns: true,
                minDate: new Date(),
                locale: {
                    format: "DD-MM-YYYY"
                }
            })
        }).on('show.daterangepicker', function () {
            $('.table-condensed tbody tr:nth-child(2) td').click();
        });

        $(document).off('change','#changeForecastDate').on('change','#changeForecastDate',function(){
            var fDate = $(this).val();
            var oldDate = $('.oldForecastDate').val();
            //var changeFormatDate = moment(changeForeCastDate).format('YYYY-MM-DD');



            var year = fDate.substr(-4);
            var day = fDate.substring(0,2);
            var month = fDate.slice(3, -5);

            //var newDate = month+'-'+ day +'-'+year;
            var changeDate = year+'-'+ month +'-'+day;

            if(changeDate > oldDate){
                $('.reasonDiv').css('display','block')
                $('.change_reason').prop('required',true)
            }else{
                $('.reasonDiv').css('display','none')
                $('.change_reason').prop('required',false)
            }

        });
        $(document).ready(function() {
            // Attach an event listener to the input field with the ID 'myInput'
            $(".textarea_desc").keydown(function(event) {
                if (event.keyCode === 13) {
                //event.preventDefault();
                        // Add a newline character to the textarea's value
                        var currentValue = $(this).val();
                        $(this).val(currentValue + '\n');
                }
            });
        });


    </script>
