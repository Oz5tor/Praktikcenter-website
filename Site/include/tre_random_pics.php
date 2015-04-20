
<!-- gallery admin start -->
<?php 

// gallery admin start
if(isset($_POST['opret_abum']) )
{
	$fil 			= $_FILES ['al_images'];
	$album_title	= $_POST['al_navn'];
	$album_be		= "not active in code";
	$album_title	= mysqli_real_escape_string($db_conn,$album_title);
	
	$count = 0;
	
	while ($count < count($fil['error']))
	{
		if ($fil ['error'][$count] == 0)
		{
			$image_erro = 0;
		}
		else
		{
			$image_erro = 1;
		}
		$count ++;
	}
	
	if ($album_be != '' && $album_title != '' && $image_erro == 0)
	{
	  $album_name_sql = "INSERT INTO albums
				  (album_navn, album_be)
				  VALUES
				  ('$album_title', '$album_be')";
	  mysqli_query($db_conn, $album_name_sql) or die (mysqli_error($db_conn));
						
	  $album_db_id = mysqli_insert_id();
		
   echo $folder = str_replace(" ", "_", $album_title); 		

	$path	= "gallery/";
	$dir	= $folder;
	$path	= $path . $dir;
	mkdir("$path", 0700);
	
	mkdir("$path/thumb", 0700);
	
	$billedmappe = "gallery/$folder/";
	$thumb_billedmappe = "gallery/$folder/thumb/";
	
# Tjek om billedupload formularen er blevet sendt
	$count = 0;
	
	while ($count < count($fil['error']))
	{	
		if ($fil ['error'][$count] == 0)
		{			
// Gør vores timestamp klar
$timestamp = str_replace('.',  '',  microtime(true));

// Her bestemmer vi det nye filnavn
$nyt_filnavn = $timestamp . "_" . $fil['name'][$count];

// ==========================================================

// Load billedet ind i WideImage
// (Svarer til at man åbner billedet i en grafik editor, som Photoshop)
$wi_billede_fuld = WideImage::load($fil['tmp_name'][$count]);

// Gem billedet (i fuld størrelse) i "uploadede_billeder" mappen
// ($billedmappe variablen kommer fra config.php filen)
// $wi_billede_fuld -> saveToFile ($billedmappe . $nyt_filnavn);

// ==========================================================

// Skab et thumbnail som har en max bredde på 200px
// Den beregner selv højden så forholdet forbliver det samme.
$wi_billede_thumb1 = $wi_billede_fuld -> resizeDown (500);

$wi_billede_thumb1 -> saveToFile ($billedmappe . $nyt_filnavn);

// ==========================================================

// Skab et thumbnail som har en max bredde på 100px.
// Den beregner selv højden så forholdet forbliver det samme.
$wi_billede_thumb2 = $wi_billede_fuld -> resizeDown (248,139, fill);

$wi_billede_thumb2 -> saveToFile ($thumb_billedmappe . $nyt_filnavn);

// ==========================================================
		
		$orginal_name 	= $fil['name'][$count];
		$image_small	= $path.'/thumb/'.$nyt_filnavn;
		$image_big		= $path.'/'.$nyt_filnavn;
		$time			= date(time());
		
		
		$insert_image_sql = "INSERT INTO images
							(image_navn, image_small, image_big, image_date, fk_album_id)
						VALUES
							('$orginal_name','$image_small','$image_big','$time', '$album_db_id')";
		mysql_query($insert_image_sql) or die (mysql_error());
		}
		$count ++;
	}
	header("location: index.php"); //?side=$side
}
else
	{
		$msg = "udfyld alle felterne";
	}
	
}
/*
?>

<form action="" method="post" enctype="multipart/form-data">
<table>
	<tr>
    	<td><label for="al_navn">Album Navn:</label></td>
        <td><input id="al_navn" name="al_navn" value="<?php if(isset($album_title)){ echo $album_title; }?>" type="text"></td>
    </tr>
    <tr>
    	<td><label for="al_images">Album Images:</label></td>
        <td><input id="al_images" name="al_images[]" type="file" value="" multiple="multiple"></td>
    </tr>
    <tr>
    	<td>&nbsp;</td>
    	<td><input type="submit" name="opret_abum" value=" tryk p&aring; mig :D" /></td>
    </tr>
    <tr>
    	<td>&nbsp;</td>
        <td><?php #echo $msg ?></td>
    </tr>
    
</table>
</form>

<!-- gallery admin slut -->

*/ ?>

<!-- ================================================================================== -->
  

        <?php
        	$counter_2 = 0;
			$random_image_sql = "SELECT * FROM images ORDER BY RAND() LIMIT 3";
			$random_image_result = mysqli_query($db_conn,$random_image_sql) or die (mysqli_error($db_conn));			
			while ($random_image_row = mysqli_fetch_assoc($random_image_result))
			
			{ 
			
				if($counter_2 == 0)
				{
					$box_id = 'smalltextboxleft';
				}
				else if($counter_2 == 1)
				{
					$box_id = 'smalltextboxmid';
				}
				else if($counter_2 == 2)
				{
					$box_id = 'smalltextboxright';
				}
				
				?>
            
            <div style=" background:url(<?php echo $random_image_row['image_small']; ?>)" id="<?php echo $box_id; ?>"></div>
            
            <?php
			$counter_2 ++;
			}
		?> 