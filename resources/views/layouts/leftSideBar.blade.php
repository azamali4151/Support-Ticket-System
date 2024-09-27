<div class="col-md-3 left_col">
   <div class="left_col scroll-view">
      <div class="navbar nav_title" style="border: 0;">
         <a href="{{url::to('dashboard')}}" class="site_title"><i class="fa fa-paw"></i> <span>Ticketing System</span></a>
      </div>
      <div class="clearfix"></div>
      <br />
      <!-- sidebar menu -->
      <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
         <div class="menu_section">
            <ul class="nav side-menu">
               @if(Auth::user()->user_group == '1')
               <li>
                  <a><i class="fa fa-lock"></i> Securit <span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu">
                     <li><a href="{{URL::to('/userIndex')}}">Create User</a></li>
                  </ul>
               </li>
               @endif
               @if(Auth::user()->user_group == '1' || Auth::user()->user_group == '2')
               <li>
                  <a><i class="fa fa-ticket"></i> Ticket <span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu">
                     <li><a href="{{URL::to('/ticket')}}">Ticket Info</a></li>
                  </ul>
               </li>
               @endif
               @if(Auth::user()->user_group == '3')
               <li>
                  <a><i class="fa fa-task"></i> Task <span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu">
                     <li><a href="{{URL::to('/taskReportIndex')}}">My Task</a></li>
                  </ul>
               </li>
               @endif
            </ul>
         </div>
      </div>
      <!-- /sidebar menu -->
   </div>
</div>