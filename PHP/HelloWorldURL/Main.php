<html>
	<head>
		<title>Test PHP</title>
	</head>
	<body>
		<?php
			echo 'Bonjour ' . htmlspecialchars($_GET["name"]) . '!';
		?>
	</body>
</html>