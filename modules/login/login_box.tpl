      <div id="error"><?php echo $error; ?></div>
      <div class="header-500" id="login-header">Username/Password</div>
      <div class="body-500" id="login">
         <br>
         <form action="index.php?page=login" method="POST">
         <input type="text" name="username" value="Username"><br><br>
         <input type="password" name="password" value="Password"><br><br>
         <input type="submit" value="Login" class="login-button" id="submit">&nbsp;<input type="reset" value="Reset" class="login-button" id="reset">
         </form>
      </div>
   </div>
   <div class="two-col-right"><br>
   <hr class="sidebar-ruler">
   <center><font size="+1">Login</font></center>To login, please type your username and password in the fields on the left and press <i>Login</i>.  If you have forgotten your password, please click the <i>Forgot Password</i> link to have a new password emailed to you.
   <hr class="sidebar-ruler"><br>
   </div>
</div>

<script language="javascript" type="text/javascript">

$(document).ready(function() {
   $(":input").click(function() {
      if ($(this).val() == "Username" || $(this).val() == "Password") {
         $(this).val("");
      }
   });
   $(":input").focusout(function() {
      if ($(this).val() == "") {
        if ($(this).attr("type") == "text") {
           $(this).val("Username");
        } else {
           $(this).val("Password");
        }
      }
   });
});

</script>
