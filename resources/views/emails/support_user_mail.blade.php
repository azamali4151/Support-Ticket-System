<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Ticket Attachment</title>
</head>
<body style="margin:0px; padding:0px; border: 0 none; font-size: 14px; font-family: verdana, sans-serif; background-color: #efefef;">

<table style="    border-collapse: collapse; width: 750px;  border: 1px #ccc solid; background: #fff; font-size: 11px; font-family: verdana, sans-serif;" align="center">
    <!-- This is the very top blue part of the template. Replace colors and image/logo in the lines below. Best image size would be 308x55 or similar. -->
    <tbody>
    <tr style="  color: #fff; background: #1B3073;  ">
        <td   style="padding: 9px;   width: 250px;">
            <!-- This is the sentence right under the image/logo. -->
            <p style="width:100%; color: #ccc;margin-top:0px;margin-bottom:0px; font-size: 16px;">New Ticket </p>

        </td>
        <!-- <td  style="padding: 9px;width: 500px;">
        <p style="font-size: 16px;margin-bottom:0px;color: #ccc;display: inline-block; float: right; text-align:right; margin: 0px;"></p> Ticket NO :: <?php //echo $ticket_id;?>
            </td> -->
        <td style="padding: 9px; color: #fff; background: #1B3073; width: 500px;">
            <p style="font-size: 16px; color: #ccc; display: inline-block; float: right; text-align:right; margin: 0px;">Ticket No :: {{$results->ticket_no}}</p>
        </td>
    </tr>

    <tr style="padding: 10px;">


       <td colspan="2">
        <div>
            <p><b>Dear Concern,</b></p>
            <p>I have create issue which [Ticket ID: ({{$results->ticket_no}}) dated ({{date( 'd-M-Y', strtotime( 'today' ) )}})].</p>
            <p>Pleae solve this issue as soon as possible.</p>
            <p>Take care</p>
            <p>Thanks</p>
        </div>
       </td>
    </tr>

    <tr>
        <td colspan="" style="padding: 9px; color: #fff; background: #1B3073;">
            <p style="display: inline-block; float: left; font-size: 16px; color: #ccc; margin: 0px;"></p>

        </td>
        <td style="padding: 9px; color: #fff; background: #1B3073;">
            <p style="display: inline-block; float: right; text-align:right; margin: 0px;">Please do not reply this email.</small></p>
        </td>
    </tr>
    </tbody>
</table>
</body>
</html>
