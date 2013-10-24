<!DOCTYPE html>
<html>
<head>
<title>Image Cropper</title>
<script src="js/jquery.min.js"></script>
<script src="js/jquery.Jcrop.min.js"></script>
<link rel="stylesheet" href="css/jquery.Jcrop.min.css" type="text/css" />
<script type="text/javascript">
 
	jQuery(function($) {
		$('#target').Jcrop({
			onSelect : setCoordinates
		});
	});
 
	function setCoordinates(c) {
		document.myForm.x.value = c.x;
		document.myForm.y.value = c.y;
		document.myForm.w.value = c.w;
		document.myForm.h.value = c.h;
	};
 
	function checkCoordinates() {
		if (document.myForm.x.value == "" || document.myForm.y.value == "") {
			alert("Please select a crop region");
			return false;
		} else {
			return true;
		}
	};
	
</script>
</head>
 
<body>
	<img src= "image/exam4.JPG" id="target" />
	<form name="myForm" action="cropper.jsp" method="post" onsubmit="return checkCoordinates();">
		<input type="hidden" name="x" value=""/>
		<input type="hidden" name="y" value=""/>
		<input type="hidden" name="w" value=""/>
		<input type="hidden" name="h" value=""/>
		<input type="submit" value="Crop Image"/>
	</form>
</body>
</html>