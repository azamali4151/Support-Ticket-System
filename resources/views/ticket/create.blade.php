@section('content')
@php $actionUrl=url('/storeTicket'); @endphp
<script>$('form').parsley();</script>
<?php ini_set('memory_limit', -1) ?>
<div class="flash-message"></div>
<style>
    .img-div {
    position: relative;
    width: 46%;
    float:left;
    margin-right:5px;
    margin-left:5px;
    margin-bottom:10px;
    margin-top:10px;
}

.image {
    opacity: 1;
    display: block;
    width: 100%;
    max-width: auto;
    transition: .5s ease;
    backface-visibility: hidden;
}

.middle {
    transition: .5s ease;
    opacity: 0;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    -ms-transform: translate(-50%, -50%);
    text-align: center;
}

.img-div:hover .image {
    opacity: 0.3;
}

.img-div:hover .middle {
    opacity: 1;
}
  </style>
<style>
   .select2{
   width: 370px !important;
   }
</style>
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
<style>
   .loader {
    display: none;
    border: 5px solid #f3f3f3;
    border-top: 5px solid #3498db;
    border-radius: 50%;
    width: 30px;
    height: 30px;
    animation: spin 2s linear infinite;
}

@keyframes spin {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
}

</style>
<div class="x_content">
   <form id="ticketSubmitForm" data-parsley-validate="" role="form" method="post" action="{{$actionUrl}}"
      class="form-label-left" enctype="multipart/form-data" autocomplete="off">
      @csrf
     
      <div class="row">
         <div class="col-md-12">
            <div class="form-group">
               <label for="IssueSummary">Issue Summary*</label>
               <input type="text"  class=" form-control" name="ticket_title" required />
            </div>
         </div>
      </div>
      <div class="row">
         <div class="col-md-12">
        
            <div class="form-group">
               <label for="IssueSummary">Issue Description*</label>
               <textarea class=" form-control issue_desc" name="ticket_desc"></textarea>
            </div>
         </div>
      </div>
      
      <div class="row">
      <div class="col-md-6">
            <div class="form-group">
               <label for="Request Type">Request Type*</label>
               <select class="form-control select2" name="request_type_id" required>
                  <option value="">--select--</option>
                  @foreach($requestType as $value)
                  <option value="{{$value->id}}">{{$value->name}}</option>
                  @endforeach
               </select>
            </div>
         </div>
         <div class="col-md-6">
            <div class="form-group">
               <label for="RequestMode">Request Mode*</label>
               <select class="form-control select2" name="request_mode_id" required>
                  <option value="">--select--</option>
                  @foreach($requestMode as $value)
                  <option value="{{$value->id}}">{{$value->name}}</option>
                  @endforeach
               </select>
            </div>
         </div>
      </div> 
      <div class="row">
      <div class="col-md-6">
            <div class="form-group">
               <label for="Priority">Priority*</label>
               <select class="form-control select2" name="priority_id" required>
                  <option value="">--select--</option>
                  @foreach($priority as $value)
                  <option value="{{$value->id}}">{{$value->name}}</option>
                  @endforeach
               </select>
            </div>
         </div>
         <div class="col-md-6">
            
            <div class="form-group">
                <label for="images">Ticket Attachment</label>
                <input type="file" name="ticket_attachment[]" id="images" multiple class="form-control" >
              </div>
              <div class="form-group">
                <div id="image_preview" style="width:100%;">
                  
                </div>
              </div>
         </div>
      </div>
      <div class="row">
      <div class="clearfix"></div>
      <div class="col-md-12">
      <div class="form-group">
         <div class="col-md-6" >
            <button type='reset' style="display:inline-block;float:left;" class="btn btn-success">Reset</button>
            <button type="submit" style="display:inline-block;float:left;" class="btn btn-primary" id="btnSubmit">Submit</button>
         </div>
      </div>
      </div>
      
      <dit style="display:inline-block;float:left;margin-left:-200px;margin-top:-5px;">
         <div id="loader" class="loader" style="display: none"></div>
      </div>
      
   </form>
   
</div>
<script type="text/javascript">

$(document).ready(function() {
    $('#ticketSubmitForm').submit(function() {
        // Show the loader when the form is submitted
        $('#loader').show();
    });

    // Hide the loader when the page is fully loaded
    $(window).on('load', function() {
        $('#loader').hide();
    });
});

   
   $('.select2').select2({
       dropdownParent: $('.modal .modal-content')
   });
   
</script>
<script>
   
   $(document).ready(function() {
   // Attach an event listener to the input field with the ID 'myInput'
   $(".issue_desc").keydown(function(event) {
    if (event.keyCode === 13) {
      //event.preventDefault();
            // Add a newline character to the textarea's value
            var currentValue = $(this).val();
            $(this).val(currentValue + '\n');
    }
   });
   });
   
</script>
<script>
    $(document).ready(function() {
  var fileArr = [];
   $("#images").change(function(){
      // check if fileArr length is greater than 0
       if (fileArr.length > 0) fileArr = [];
     
        $('#image_preview').html("");
        var total_file = document.getElementById("images").files;
        if (!total_file.length) return;
        for (var i = 0; i < total_file.length; i++) {
          if (total_file[i].size > 1048576) {
            return false;
          } else {
            fileArr.push(total_file[i]);
            $('#image_preview').append("<div class='img-div' id='img-div"+i+"'><img src='"+URL.createObjectURL(event.target.files[i])+"' class='img-responsive image img-thumbnail' title='"+total_file[i].name+"'><div class='middle'><button id='action-icon' value='img-div"+i+"' class='btn btn-danger' role='"+total_file[i].name+"'><i class='fa fa-trash'></i></button></div></div>");
          }
        }
   });
  
  $('body').on('click', '#action-icon', function(evt){
      var divName = this.value;
      var fileName = $(this).attr('role');
      $(`#${divName}`).remove();
    
      for (var i = 0; i < fileArr.length; i++) {
        if (fileArr[i].name === fileName) {
          fileArr.splice(i, 1);
        }
      }
    document.getElementById('images').files = FileListItem(fileArr);
      evt.preventDefault();
  });
  
   function FileListItem(file) {
            file = [].slice.call(Array.isArray(file) ? file : arguments)
            for (var c, b = c = file.length, d = !0; b-- && d;) d = file[b] instanceof File
            if (!d) throw new TypeError("expected argument to FileList is File or array of File objects")
            for (b = (new ClipboardEvent("")).clipboardData || new DataTransfer; c--;) b.items.add(file[c])
            return b.files
        }
});

   $(document).on('change','#departmentId',function(){

      let deptId = $(this).val();

       $('#project_id').html('<option value="">--select--</option>');
       if(deptId!=''){
           $.ajax({
               type: 'GET',
               url: '{{url("/getIssueGroup")}}/'+deptId,
               success: function (data) {
                   $('#project_id').html(data);
               }
           });
       }
   });

  </script>