<?php
//The following function is reused under the GFDL and taken from the English Wikipedia Unblock Ticket Request System
function loggedIn() {
   if (!isset($_SESSION)) { 
      session_name('SysLogin');
      session_start();
   }

   if (isset($_SESSION['logged_in_id']) && isset($_SESSION['logged_in_password'])) {
      // presumably good, but confirming that the cookie is valid...
      $user = $_SESSION['logged_in_id'];
      $password = $_SESSION['logged_in_password'];
      $db = connectToDB(true);

      $query = $db->prepare('
         SELECT person_id FROM Person
         WHERE person_id = :person_id
         AND person_password = :passwordHash');

      $result = $query->execute(array(
         ':person_id' => $user,
         ':passwordHash' => $password));

      if ($result === false) {
         $error = var_export($query->errorInfo(), true);
         debug('ERROR: ' . $error . '<br/>');
      }

      $data = $query->fetch(PDO::FETCH_ASSOC);
      $query->closeCursor();

      if ($data !== false) {
         return true;
      }
   }
   return false;
}

//The following function is reused under the GFDL and taken from the English Wikipedia Unblock Ticket Request System
function verifyLogin($destination = 'index'){
   if(!loggedIn()){
      header("Location: " . getRootURL() . '/index.php?page=login&destination=' . $destination);
      exit;
   } else {
      return true;
   }
}

function debug($message) {
   if ($SHOW_DEBUG == true) {
      echo $message;
   }
}

function getRootURL() {
   return "http://bms-dev.no-ip.org/bms-dev";
}

function system_error($error) {

   global $bms;

   $bms->template->body = new Template("includes/error.tpl");
   $bms->template->body->setValues(array(
      "error"     =>    $error));

}

function get_Sub_Relations($module = "Person", $id = 0, $target = NULL) {

   global $bms;

   $id = ($id) ? $id : $bms->me->get_ID();

   $db = ConnectToDB();

   $sql =   "     SELECT * FROM Relations
                  WHERE `left` > (SELECT `left` FROM Relations
                     WHERE `parent_module_name` = :module
                     AND `parent_module_id` = :id)
                  AND `right` < (SELECT `right` FROM Relations
                     WHERE `parent_module_name` = :module
                     AND `parent_module_id` = :id)
            ";

   if ($target != NULL) {

      $sql  .= "  AND `parent_module_name` = :target";
   }


   $sql  .=    "  ORDER BY `left` ASC";

   $query = $db->prepare($sql);

   $query->bindValue(":module", $module);
   $query->bindValue(":id", $id);

   if ($target != NULL) {
      $query->bindValue(":target", $target, PDO::PARAM_STR);
   }

   $query->execute();

   $array = Array();

   while ($row = $query->fetch()) {
      array_push($array, Array("parent_module_name" => $row['parent_module_name'], "parent_module_id" => $row['parent_module_id']));
   }


   return $array;
}
