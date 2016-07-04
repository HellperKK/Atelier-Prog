<?php 
	include "Lib.php";
	if (! isset($_POST['texte'])){
		$chaine = "";
		$code = [$_POST['code'], 0, arr_make(1000, 0), 0];
	}
	else {
		$code = unserialize($_POST['code']);
		$input = ord($_POST['texte'][0]);
		$code[2][$code[3]] = $input;
		if (isset($_POST['output'])){
			$chaine = $_POST['output'];
		}
		else{
			$chaine = "";
		}
	}
	$requette = false;
	while($code[1] < strlen($code[0])){
		$temp3 = $code[0][$code[1]];
		if ($temp3 == ">"){
			$code[3] += 1;
		}
		else if ($temp3 == "<"){
			$code[3] -= 1;
		}
		else if ($temp3 == "+"){
			$code[2][$code[3]] += 1;
		}
		else if ($temp3 == "-"){
			$code[2][$code[3]] -= 1;
		}
		else if ($temp3 == "."){
			$chaine = $chaine . chr($code[2][$code[3]]);
		}
		else if ($temp3 == ","){
			break;
		}
		else if ($temp3 == "["){
			if($code[2][$code[3]] == 0){
				$code[1] = mathing_bracket_from($code[0], $code[1]);
			}
		}
		else if ($temp3 == "]"){
			if($code[2][$code[3]] != 0){
				$code[1] = mathing_bracket_since($code[0], $code[1]);
			}
		}
		else{
			//echo "Commentaire";
		}
		$code[1] += 1;
	}
	$encode = serialize($code);
		echo "
<html>
	<head>
		<title>Test PHP</title>
	</head>
	<body>
		<form action=\"Action.php\" method=\"post\">
			<output >$chaine</output>
			<br>
			 <textarea name=\"texte\" rows=\"10\" cols=\"30\" required></textarea>
			<p><input type=\"submit\" value=\"Ajouter\"></p>
			<a href=\"Main.php\">Nettoyer</a>
			<textarea name=\"output\" id = \"output\" rows=\"1\" cols=\"1\" style=\"visibility:hidden\">$chaine</textarea>
			<textarea name=\"code\" id = \"code\" rows=\"1\" cols=\"1\" style=\"visibility:hidden\">$encode</textarea>
		</form>
	</body>
</html>";
?>
