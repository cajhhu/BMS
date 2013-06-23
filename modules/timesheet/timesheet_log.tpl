<div class="module-header">
   <div class="module-name">Timesheet: {timesheet_invoice_num}</div>
</div>
<div class="content">

   <div class="table-cell" style="margin: 5px; float:right;">
      <center>
         <input type="button" value="Clock In"><br>
         <input type="button" value="Start Lunch"><br>
         <input type="button" value="End Lunch"><br>
         <input type="button" value="Clock Out"><br>
         <input type="button" value="Datasheet"><br>
         <input type="button" value="Job">
      </center>
   </div>
   <div class="log_wrapper">
      <div class="time_table">
          <div class="timesheet_row_top">
             <div class="timesheet_name">Hours</div>
             <div class="timesheet_name"></div>
             <div class="timesheet_name">Hours Spent</div>
             <div class="timesheet_name"></div>
             <div class="timesheet_name">Hours Left</div>
          </div>
          <div class="timesheet_row_bottom">
             <div class="timesheet_data">&nbsp;&nbsp;{timesheet_hours_paid} Hour(s)</div>
             <div class="timesheet_name">-</div>
             <div class="timesheet_data">{timesheet_used_hours} Hour(s)</div>
             <div class="timesheet_name">=</div>
             <div class="timesheet_data{timesheet_hours_left_color}">{timesheet_hours_left} Hour(s)</div>
          </div>
      </div>
      <div id="outer">
         <div id="inner">
         <div class="log_table">
         {loop:timesheet_log}
            <div class="timesheet_row_top">
               <div class="log_data">{log_date}</div>
               <div class="log_data">{log_poc_name}</div>
               <div class="log_data">{log_poc_phone}</div>
               <div class="log_data">{log_comments}</div>
            </div>
            <div class="timesheet_row_bottom">
               <div class="log_data">{log_time_in}</div>
               <div class="log_data">{log_time_out}</div>
               <div class="log_data">{log_lunch_hrs}</div>
               <div class="log_data">{log_total_hrs}</div>
            </div>
         {/loop:timesheet_log}
         </div>
         </div>
      </div>
      <div class="time_table_bottom">
      </div>
   </div>


</div>
<div class="module-footer">
      <div class="display: inline; width: 200px;">Last Updated: {timesheet_last_update}</div>
      <div class="clear: both;"></div>
      <div class="display: inline; width: 200px;">Expiry: {timesheet_expire_type}</div>
</div>
