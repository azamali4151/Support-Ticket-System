@section('content')
    @php $actionUrl=url('/updateTicketBasicInfo'); @endphp
    <script>$('form').parsley();</script>
    <?php ini_set('memory_limit', -1) ?>
    <div class="flash-message"></div>
    <div class="x_content">
        <form id="ClassRoutineForm" data-parsley-validate="" role="form" method="post" action="{{$actionUrl}}"
              class="form-label-left" enctype="multipart/form-data" autocomplete="off">
            @csrf
            <div class="field item form-group">
                <label class="col-form-label col-md-3 col-sm-3 label-align">Ticket Title*</label>
                <div class="col-md-6 col-sm-6">
                    <input type="text" value="{{$ticketInfo->ticket_title}}" class="form-control" name="ticket_title" required />
                </div>

            </div>
            <div class="field item form-group">
                <label class="col-form-label col-md-3 col-sm-3 label-align">Ticket Description*</label>
                <div class="col-md-6 col-sm-6">
                    <textarea name="ticket_desc" class="form-control">{{$ticketInfo->ticket_desc}}</textarea>
                </div>
            </div>

            <div class="clearfix"></div>
            <input type="hidden" value="{{$ticketInfo->id}}" name="ticket_id">

            <div class="form-group">
                <div class="col-md-6 offset-md-3">
                    <button type='reset' class="btn btn-success">Reset</button>
                    <button type="submit" class="btn btn-primary" id="btnSubmit">Submit</button>
                </div>
            </div>

        </form>
    </div>

    
