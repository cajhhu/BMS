<?php

date_default_timezone_set('UTC');

class Timesheet {
   protected   $timesheet_id;

   private     $timesheet_invoice_num;
   private     $timesheet_last_update;

   private     $timesheet_hours_paid;
   private     $timesheet_expire_type;
   private     $timesheet_infinite_hours;

   private     $timesheet_log;

   public static      $TIME_ZONE_OFFSET = 0;


   public function __construct() {
       $a = func_get_args();
       $i = func_num_args();
       if (method_exists($this,$f='__construct'.$i)) {
            call_user_func_array(array($this,$f),$a);
       }
   }

   private function __construct1($timesheet_id) {
      $db = ConnectToDB();

      $query = $db->prepare("SELECT * FROM Timesheet WHERE timesheet_id = :timesheet_id;");

      $query->execute(array(
            ":timesheet_id"   =>    $timesheet_id));

      if ($data = $query->fetch()) {

         //Assign vars
         $this->timesheet_id                 =     $timesheet_id;
         $this->timesheet_invoice_num        =     $data['timesheet_invoice_num'];
         $this->timesheet_last_update        =     $data['timesheet_last_update'];
         $this->timesheet_hours_paid         =     $data['timesheet_hours_paid'];
         $this->timesheet_expire_type        =     $data['timesheet_expire_type'];
         $this->timesheet_infite_hours       =     $data['timesheet_infinite_hours'];
         $this->timesheet_log                =     $this->getLog();

         return $this;
      }

      return null;
   }

   private function __construct2($args, $fromdb) {
   }

   private function getLog() {
      $db = ConnectToDB();

      $LogArray = Array();

      $query = $db->prepare("SELECT * FROM Timesheet_log
                     WHERE log_timesheet_id = :log_timesheet_id
                     ORDER BY log_id DESC");

      if ($query->execute(array(":log_timesheet_id" => $this->timesheet_id))) {
         $data = $query->fetchAll();

         foreach ($data as $row) {
            $log = new TSLog($row);
            array_push($LogArray, $log);
            $log = null;
         }
      }

      return $LogArray;


   }

   public function getHoursLeft() {
   }

   public function get_ID() {
      return $this->timesheet_id;
   }

   public function get_Invoice_Num() {
      return $this->timesheet_invoice_num;
   }

   public function get_Last_Update() {
      return $this->timesheet_last_update;
   }

   public function get_Hours_Paid() {
      return $this->timesheet_hours_paid;
   }

   public function get_Expire_Type() {
      switch ($this->timesheet_expire_type) {
         case "1":
            return "Yearly";
         break;
         case "2":
            return "Monthly";
         break;
         case "3":
            return "Infinite";
         break;
      }
   }

   public function get_Infinite_Hours() {
      return ($this->timesheet_infinite_hours == 1) ? true : false;
   }

   public function get_Log() {
      return $this->timesheet_log;
   }

   public function get_Log_as_Array() {
      $array = Array();
      $i = 0;
      foreach ($this->timesheet_log as $log) {
         $array[$i] = $log->as_Array();
         $i++;
      }
      return $array;
   }

   public function calculate_Hours_Used() {

      $hours = 0;

      foreach ($this->timesheet_log as $log) {
         $hours += $log->calculate_Hours();
      }

      return $hours;
   }

   public function calculate_Hours_Left() {
      //convert hours to seconds
      $hours_paid = $this->timesheet_hours_paid * 60 * 60;
      return $hours_paid - $this->calculate_Hours_Used();
   }

   public function as_Array() {
      return Array(
         "timesheet_id"                =>    $this->timesheet_id,
         "timesheet_invoice_num"       =>    $this->timesheet_invoice_num,
         "timesheet_last_update"       =>    $this->timesheet_last_update,
         "timesheet_hours_paid"        =>    $this->timesheet_hours_paid,
         "timesheet_hours_left"        =>    $this->calculate_Hours_Left(),
         "timesheet_expire_type"       =>    $this->timesheet_expire_type,
         "timesheet_log_count"         =>    count($this->timesheet_log));
   }
}

class TSLog {
   protected   $log_id;

   private     $log_timesheet_id;
   private     $log_date;

   private     $log_poc_name;
   private     $log_poc_phone;

   private     $log_time_in;
   private     $log_time_out;
   private     $log_lunch_hrs;

   private $log_comments;

   public function __construct($data) {
      $this->log_id              =     $data['log_id'];
      $this->log_timesheet_id    =     $data['log_timesheet_id'];
      $this->log_date            =     $data['log_date'];
      $this->log_poc_name        =     $data['log_poc_name'];
      $this->log_poc_phone       =     $data['log_poc_phone'];
      $this->log_time_in         =     $data['log_time_in'];
      $this->log_time_out        =     $data['log_time_out'];
      $this->log_lunch_hrs       =     $data['log_lunch_hrs'];
      $this->log_comments        =     $data['log_comments'];
   }

   //Function: start_lunch()
   //This function stores the time out for lunch in timeout.  It will be used to calculate the lunch hours on return
   public function start_lunch() {
      $this->log_time_out     =     time();

      update();
   }

   //Function: start_lunch()
   //This function stores the time out for lunch in timeout.  It will be used to calculate the lunch hours on return
   public function end_lunch() {
      $this->log_lunch_hrs    =     time() - $this->log_time_out;
      $this->log_time_out     =     null;

      update();
   }

   //Function: updatePOC()
   //This function checks for SQL injections and escapes strings
   public function updatePOC($name, $phone) {
      $this->log_poc_name     =     $name;
      $this->log_poc_phone    =     $phone;

      update();
   }

   public function setTimesheetId($id) {
      $this->log_timesheet_id =     $id;

      update();
   }

   public function update() {
      $db = ConnectToDB();

      $query = $db->prepare("UPDATE Timesheet_Log SET
                     log_timesheet_id        =     :log_timesheet_id,
                     log_date                =     :log_date,
                     log_poc_name            =     :log_poc_name,
                     log_poc_phone           =     :log_poc_phone,
                     log_time_in             =     :log_time_in,
                     log_time_out            =     :log_time_out,
                     log_lunch_hrs           =     :log_lunch_hrs,
                     log_comments            =     :log_comments
                    WHERE log_id             =     :log_id");

      if ($query->execute(array(
                     ":log_timesheet_id"     =>    $this->log_timesheet_id,
                     ":log_date"             =>    $this->log_date,
                     ":log_poc_name"         =>    $this->log_poc_name,
                     ":log_poc_phone"        =>    $this->log_poc_phone,
                     ":log_time_in"          =>    $this->log_time_in,
                     ":log_time_out"         =>    $this->log_time_out,
                     ":log_lunch_hrs"        =>    $this->log_lunch_hrs,
                     ":log_comments"         =>    $this->log_comments,
                     ":log_id"               =>    $this->log_id))) {
         return true;
      } else {
         return false;
      }
   }

   public function get_ID() {
      return $this->log_id;
   }

   public function get_TimesheetID() {
      return $this->log_timesheet_id;
   }

   public function get_Date() {
      return $this->log_date;
   }

   public function get_POC_Name() {
      return $this->log_poc_name;
   }

   public function get_POC_Phone() {
      return $this->log_poc_phone;
   }

   public function get_Time_In() {
      return $this->log_time_in;
   }

   public function get_Time_Out() {
      return $this->log_time_out;
   }

   public function get_Lunch_Hrs() {
      return $this->log_lunch_hrs;
   }

   public function get_Comments() {
      return $this->log_comments;
   }

   public function calculate_Hours() {
      return $this->log_time_out - $this->log_time_in - $this->log_lunch_hrs;
   }

   public function as_Array() {
      return Array(
         "log_id"                =>    $this->get_ID(),
         "log_timesheet_id"      =>    $this->get_TimesheetID(),
         "log_date"              =>    $this->get_Date(),
         "log_poc_name"          =>    $this->get_POC_Name(),
         "log_poc_phone"         =>    $this->get_POC_Phone(),
         "log_time_in"           =>    date("F j, Y  g:i a", $this->get_Time_In()),
         "log_time_out"          =>    date("F j, Y  g:i a", $this->get_Time_Out()),
         "log_lunch_hrs"         =>    (string)floor($this->get_Lunch_Hrs() / 60 / 60) . " Hour(s)",
         "log_total_hrs"         =>    (string)floor($this->calculate_Hours() / 60 / 60) . " Hour(s)",
         "log_comments"          =>    $this->get_Comments());
   }
}
