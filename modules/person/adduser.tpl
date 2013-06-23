<div class="module-header">
   <div class="module-name">User Management: Add User</div>
</div>
<div class="content">
   <form name="adduser">
      <div class="form-row">
      <div class="form">
         <div class="form-header">Account Details</div>
         <div class="form-row">
            <div class="form-label"><label for="username">Username</label></div>
            <div class="form-element"><input type="text" name="username" value="{person_username}"></div>
            <div class="form-status"><img src="images/required.png" width="20"></div>
         </div>
         <div class="form-row">
            <div class="form-label"><label for="firstname">First Name</label></div>
            <div class="form-element"><input type="text" name="firstname" value="{person_firstname}"></div>
            <div class="form-status"></div>
         </div>
         <div class="form-row">
            <div class="form-label"><label for="lastname">Last name</label></div>
            <div class="form-element"><input type="text" name="lastname" value="{person_lastname}"></div>
            <div class="form-status"></div>
         </div>
         <div class="form-row">
            <div class="form-label"><label for="password">Password</label></div>
            <div class="form-element"><input type="text" name="password"></div>
            <div class="form-status"><img src="images/required.png" width="20"></div>
         </div>
         <div class="form-row">
            <div class="form-label"><label for="confirm-password">Confirm Password</label></div>
            <div class="form-element"><input type="text" name="confirm-password"></div>
            <div class="form-status"><img src="images/required.png" width="20"></div>
         </div>
         <div class="form-row">
            <div class="form-label"><label>Last Login</label></div>
            <div class="form-element">{person_last_attempt}</div>
            <div class="form-status"></div>
         </div>
         <div class="form-row">
            <div class="form-label"><label>Login Attempts</label></div>
            <div class="form-element">{person_password_attempts}</div>
            <div class="form-status"></div>
         </div>
         <div class="form-row">
            <div class="form-label"><label>Account Created</label></div>
            <div class="form-element">{person_created}</div>
            <div class="form-status"></div>
         </div>
         <div class="form-row">
            <div class="form-label"><label>Account Enabled</label></div>
            <div class="form-element">{person_enabled}</div>
            <div class="form-status"></div>
         </div>
      </div>
      <div class="clr">&nbsp;</div>
      <div class="form">
         <div class="form-header">Contact Details</div>
         <div class="form-row">
            <div class="form-label"><label for="email">Email</label></div>
            <div class="form-element"><input type="text" name="email" value="{person_email}"></div>
            <div class="form-status"><img src="images/required.png" width="20"></div>
         </div>
         <div class="form-row">
            <div class="form-label"><label for="confirm-email">Confirm Email</label></div>
            <div class="form-element"><input type="text" name="confirm-email"></div>
            <div class="form-status"><img src="images/required.png" width="20"></div>
         </div>
         <div class="form-row">
            <div class="form-label"><label for="home-phone">Home Phone</label></div>
            <div class="form-element"><input type="text" name="home-phone" value="{person_home}"></div>
            <div class="form-status"></div>
         </div>
         <div class="form-row">
            <div class="form-label"><label for="mobile-phone">Mobile Phone</label></div>
            <div class="form-element"><input type="text" name="mobile-phone" value="{person_mobile}"></div>
            <div class="form-status"></div>
         </div>
         <div class="form-row">
            <div class="form-label"><label for="street-address">Street Address</label></div>
            <div class="form-element"><input type="text" name="street-address" value="{person_address}"></div>
            <div class="form-status"></div>
         </div>
         <div class="form-row">
            <div class="form-label"><label for="street-address">City</label></div>
            <div class="form-element"><input type="text" name="street-address" value="{person_address}"></div>
            <div class="form-status"></div>
         </div>
         <div class="form-row">
            <div class="form-label"><label for="street-address">State</label></div>
            <div class="form-element"><input type="text" name="street-address" value="{person_address}"></div>
            <div class="form-status"></div>
         </div>
         <div class="form-row">
            <div class="form-label"><label for="street-address">Zipcode</label></div>
            <div class="form-element"><input type="text" name="street-address" value="{person_address}"></div>
            <div class="form-status"></div>
         </div>
      </div>
      </div>

      <div class="form-row">
      <div class="form">
         <div class="form-header">Company Details</div>
         <div class="form-row">
            <div class="form-label"><label for="home-phone">Company</label></div>
            <div class="form-element">
               <select name="company">
                  {loop:companies}
                     <option value="{company}">{company}</option>
                  {/loop:companies}
               </select>
            </div>
            <div class="form-status"></div>
         </div>
         <div class="form-row">
            <div class="form-label"><label for="home-phone">Supervisor</label></div>
            <div class="form-element">
               <select name="supervisor" disabled>
               </select>
            </div>
            <div class="form-status"></div>
         </div>
      </div>
      <div class="clr">&nbsp;</div>
      <div class="form">
         <div class="form-header">Advertisement Details</div>
         <div class="form-row">
            <div class="form-label"><label for="recommendedby">Recommended By</label></div>
            <div class="form-element"><input type="text" name="recommendedby" value="{person_recommended}"></div>
            <div class="form-status"></div>
         </div>
         <div class="form-row">
            <div class="form-label"><label for="advert-type">Advertising Type</label></div>
            <div class="form-element">
               <select name="advert-type">
                  <option value="Website">Website</option>
                  <option value="Word of Mouth">Word of Mouth</option>
                  <option value="Facebook Ad">Facebook Ad</option>
                  <option value="Google Ad">Google Ad</option>
                  <option value="TV Commercial">TV Commercial</option>
                  <option value="Newspaper">Newspaper</option>
                  <option value="Groupon">Groupon</option>
                  <option value="Expo">Expo</option>

               </select>
            </div>
            <div class="form-status"></div>
         </div>
      </div>
      </div>


</div>
<div class="module-header">
   <div class="module-name"><input type="submit" id="submit" value="{submit_type}">&nbsp;&nbsp;&nbsp;<input type="reset" id="reset" value="Reset"></div>
</div></form>
