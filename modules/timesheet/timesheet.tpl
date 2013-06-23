<div class="module-header">
   <div class="module-name">{timesheet_business}</div>
</div>
<div class="table">
{loop:timesheets}
<div class="timesheet_list_row_top">
   <div class="timesheet_list_data">Invoice <a href="index.php?page=Timesheet&action=log&id={timesheet_id}">{timesheet_invoice_num}</a></div>
   <div class="timesheet_list_data">{timesheet_business_name}</div>
   <div class="timesheet_list_data">Updated {timesheet_last_update}</div>
</div>
<div class="timesheet_list_row_bottom">
   <div class="timesheet_list_data">{timesheet_hours_paid} hours paid</div>
   <div class="timesheet_list_data">{timesheet_log_count} logs</div>
   <div class="timesheet_list_data">{timesheet_hours_left} Hours left</div>
</div>
{/loop:timesheets}
</div>
<div class="module-footer">
</div>
