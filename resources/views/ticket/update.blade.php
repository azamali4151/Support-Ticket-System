@php $actionUrl=url('/updateTaskAssign'); @endphp
<script>$('form').parsley();</script>
<?php ini_set('memory_limit', -1) ?>
<div class="flash-message"></div>
<div class="x_content">
    <div class="col-lg-12 col-md-12 col-sm-12">
            <div class="col-lg-3 col-md-3 col-sm-3">
                <div class="project-sidebar">
                    <input type="hidden" value="{{$result->id}}" id="ticketId">
                    <div class="project-menu">
                        <ul class="nav" id="navlist">
                            <li class="active">
                                    <a id="ticketInfo" data-action="{{url('/editTicketInfo')}}" href="#">
                                    <i class="glyphicon glyphicon-home"></i>
                                    Ticket Info </a>
                            </li>
                            @if(Auth::user()->user_group =='1')
                            <li class="">
                                    <a href="#" id="ticketStatus" data-action="{{url('/editStatusInfo')}}">
                                    <i class="glyphicon glyphicon-question-sign"></i>
                                    Ticket Status </a>
                            </li>
                          
                            <li class="">
                                    <a href="#" id="ticket_assign_info" data-action="{{url('/editAssignInfo')}}">
                                    <i class="glyphicon glyphicon-user"></i>
                                    Ticket Assign</a>
                            </li>
                            @endif
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-lg-9 col-md-9 col-sm-9 pull-right">
                <div class="ticket-content">
                    <table class="table table-responsive ">
                        <tbody><tr class="info">
                            <td colspan="2">
                                <b>Ticket Basic Info</b>
                                @if($result->ticket_status !='230')
                                <a class="btn btn-success pull-right" id="edit_ticket_info" data-action="{{url('/editTicketInfo')}}" href="#">
                                    <i class="glyphicon glyphicon-pencil"></i> Edit
                                </a>
                                @endif
                            </td>
                        </tr>
                        <tr>
                            <td> Ticket Title </td>
                            <td>{{$result->ticket_title}}</td>
                        </tr>
                        <tr>
                            <td> Ticket Description </td>
                            <td>
                                <p>{{$result->ticket_desc}}</p>
                            </td>
                        </tr>
                        <tr>
                            <td>Ticket Create Date and Time</td>
                            <td>{{date('d-M-Y H:i A',strtotime($result->created_at))}}</td>

                        </tr>
                        </tbody></table>
                </div>


            </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function(){
        $('.assignDate').daterangepicker({
            singleDatePicker: true,
            singleClasses: "picker_1",
            showDropdowns: true,
            minDate: $('#block_from_date').val(),
            maxDate: $('#block_to_date').val(),
            locale: {
                format: "DD-MM-YYYY"
            }
        })
    })
    $(document).on('focus', '.datepickerMonthYearAppend', function(e){
        $(e.target).daterangepicker({
            singleDatePicker: true,
            singleClasses: "picker_1",
            showDropdowns: true,
            minDate: $('#block_from_date').val(),
            maxDate: $('#block_to_date').val(),
            locale: {
                format: "DD-MM-YYYY"
            }
        })
    }).on('show.daterangepicker', function () {
        $('.table-condensed tbody tr:nth-child(2) td').click();
    });

    $('.time-picker').datetimepicker({
        format: 'hh:mm A'
    });

</script>

<script>
    $('#departmentId').change(function(){
        var departmentId = $(this).val();
        $('#employeeId').html('<option value="">--select--</option>');
        if(departmentId!=''){
            $.ajax({
                type: 'GET',
                url: '{{url("/getEmployee")}}/'+departmentId,
                success: function (data) {
                    $('#employeeId').html(data);
                }
            });
        }
    });
</script>

    <script>
        $('#ticketInfo').click(function (){

            var ticketId = $("#ticketId").val();
            var action_uri = $(this).attr('data-action');
            $.ajax({
                type: "POST",
                url: action_uri,
                data: { ticketId:ticketId,_token:'{{csrf_token()}}'},
                success: function (data){
                    $('.ticket-content').html(data);
                }
            });
        })
        $('#ticketForward').click(function (){

        var ticketId = $("#ticketId").val();
        var action_uri = $(this).attr('data-action');
        $.ajax({
            type: "POST",
            url: action_uri,
            data: { ticketId:ticketId,_token:'{{csrf_token()}}'},
            success: function (data){
                $('.ticket-content').html(data);
            }
        });
        })
        $('#edit_ticket_info').click(function () {
            var ticketId = $("#ticketId").val();
            var action_uri = $(this).attr('data-action');
            $.ajax({
                type: "POST",
                url: action_uri,
                data: { ticketId:ticketId,_token:'{{csrf_token()}}'},
                success: function (data){
                    $('.ticket-content').html(data);
                }
            });
        });
        $('#ticketStatus').click(function () {
            var ticketId = $("#ticketId").val();
            var action_uri = $(this).attr('data-action');
            $.ajax({
                type: "POST",
                url: action_uri,
                data: { ticketId:ticketId,_token:'{{csrf_token()}}'},
                success: function (data){
                    $('.ticket-content').html(data);
                }
            });
        });

        $('#ticket_assign_info').click(function () {
            var ticketId = $("#ticketId").val();
            var action_uri = $(this).attr('data-action');
            $.ajax({
                type: "POST",
                url: action_uri,
                data: { ticketId:ticketId,_token:'{{csrf_token()}}'},
                success: function (data){
                    $('.ticket-content').html(data);
                }
            });
        });

        $('#ticket_re_assign_info').click(function () {
            var ticketId = $("#ticketId").val();
            var action_uri = $(this).attr('data-action');
            $.ajax({
                type: "POST",
                url: action_uri,
                data: { ticketId:ticketId,_token:'{{csrf_token()}}'},
                success: function (data){
                    $('.ticket-content').html(data);
                }
            });
        });


    </script>
