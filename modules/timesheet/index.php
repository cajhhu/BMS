<?php

verifyLogin('login');

global $bms;

require("modules/timesheet/class.php");

//get action
$action = (isset($_GET['action'])) ? $_GET['action'] : "index";



switch ($action) {
   //Submit data (usually jQuery)
   case "ajax":
   case "submit":
   break;

   //Create/view a timesheet
   case "create":

   break;

   case "view":

      $person_id = (isset($_GET['id'])) ? $_GET['id'] : null;

      $Person = new Person($person_id);

      $tsids = get_Sub_Relations("Person", $person_id, "Timesheet");

      $timesheets = Array();

      //Create an array of all timesheets under identified person
      foreach ($tsids as $ts) {
         array_push($timesheets, new Timesheet($ts['parent_module_id']));
      }

      //Build template
      $bms->template->body = new Template("modules/timesheet/timesheet.tpl");

      $timesheets_as_array = Array();

      foreach ($timesheets as $timesheet) {
         array_push($timesheets_as_array, $timesheet->as_Array());
      }

      $bms->template->body->setValues(array(
         "timesheet_business"                =>          $Person->get_Company(),
         "loop:timesheets"                   =>          $timesheets_as_array));

   break;

   case "log":

      $timesheet_id = (isset($_GET['id'])) ? $_GET['id'] : null;

      //Test read permissions
      if ($bms->me->can("System_hasAdmin")
         || $bms->me->can("Timesheet_" . $timesheet_id . "_Read")
         || $bms->me->can("Timesheet_" . $timesheet_id . "_Write")) {

         $bms->template->body = new Template("modules/timesheet/timesheet_log.tpl");

         $timesheet = new Timesheet($timesheet_id);

         $hours_left_color = ($timesheet->calculate_Hours_Left() > 0) ? "" : "_negative";

         $bms->template->body->setValues(array(
               "timesheet_invoice_num"       =>          $timesheet->get_Invoice_Num(),
               "timesheet_last_update"       =>          $timesheet->get_Last_Update(),
               "timesheet_hours_paid"        =>          $timesheet->get_Hours_Paid(),
               "timesheet_expire_type"       =>          $timesheet->get_Expire_Type(),
               "timesheet_infinite_hours"    =>          $timesheet->get_Infinite_Hours(),
               "timesheet_used_hours"        =>          (string)floor($timesheet->calculate_Hours_Used() / 60 / 60),
               "timesheet_hours_left"        =>          (string)floor(abs($timesheet->calculate_Hours_Left()) / 60 / 60),
               "timesheet_hours_left_color"  =>          $hours_left_color,
               "loop:timesheet_log"          =>          $timesheet->get_Log_as_Array()));

      } else {
         system_error("You are not authorized to view this timesheet");
      }

   break;

   //Search/home
   case "index":
   case "search":
   default:

      //Grab template lib

      //Construct template
      $bms->template->body = new Template("modules/timesheet/search.tpl");

}

