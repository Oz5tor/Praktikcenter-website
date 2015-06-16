<form action="" method="post">
  <table>   
      <tr>
        <td>
            <textarea name="text" id="traad_ret" class="traad" rows="8">
            	<?php
					$ret_traad_txt_sql = "SELECT * FROM forum_reply WHERE re_id = '$r_ret'";
					$ret_traad_Result = mysql_query ($ret_traad_txt_sql) or die (mysql_error());
					$traad_txt_row = mysql_fetch_assoc($ret_traad_Result);
					echo $traad_txt_row['re_text'];
				?>
            </textarea>
        </td>
      </tr>
      <tr>
        <td align="center"><input type="submit" name="r_ret_update" value="Ret" /></td>
      </tr>

      <tr>
        <td><?php if(isset($msg)){echo $msg;} ?></td>
      </tr>
  </table>
</form>