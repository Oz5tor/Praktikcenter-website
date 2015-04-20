<div style="max-width:790px;">
<?php 

	$month_day = date('j');
	
	$sql = "SELECT * FROM quotes WHERE date != '0'";
		$result = mysqli_query($db_conn,$sql) or die (mysqli_error($db_conn));
		$row = mysqli_fetch_assoc($result);
		$rows = mysqli_num_rows($result);
	
		$quote = $row['quote'];
		$quote_date = $row['date'];
	
	if ($rows == '0')
	{
		$sql = "SELECT * FROM quotes ORDER BY RAND() LIMIT 1";
			$result = mysqli_query($db_conn,$sql) or die (mysqli_error($db_conn));
			$row = mysqli_fetch_assoc($result);
			
			$quote_id = $row['id'];
			
		echo $row['quote'];
			
		$sql = "UPDATE quotes SET date = '$month_day' WHERE id = '$quote_id'";
			mysqli_query($db_conn,$sql) or die (mysqli_error($db_conn));
	}
	else
	if ($quote_date != $month_day)
	{
		$quote_id = $row['id'];
		
		$sql = "UPDATE quotes SET date = '0' WHERE id = '$quote_id'";
			mysqli_query($db_conn,$sql) or die (mysqli_error());
			
		$sql = "SELECT * FROM quotes ORDER BY RAND() LIMIT 1";
			$result = mysqli_query($db_conn,$sql) or die (mysqli_error($db_conn));
			$row = mysqli_fetch_assoc($result);
			
			$quote_id = $row['id'];
			
		echo $row['quote'];
			
		$sql = "UPDATE quotes SET date = '$month_day' WHERE id = '$quote_id'";
			mysqli_query($db_conn,$sql) or die (mysqli_error($db_conn));
	}
	else
	if ($quote_date == $month_day)
	{
		echo $row['quote']; 
	}
		
?>
</div>