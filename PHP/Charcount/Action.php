<?php 
	/*
	function compte_chars($liste){
		$ite = 0;
		$char = $liste[$ite];
		while($liste[$ite] == $char){
			$ite++;
		}
		return [$char, $ite];
	}
	$chaine = htmlspecialchars($_POST['texte']); 
	$tab = str_split($chaine);
	sort($tab);
	*/
	$chaine = htmlspecialchars($_POST['texte']); 
	$tab = array_count_values(str_split($chaine));
	foreach($tab as $key => $value){
		echo "Le caractere $key est present $value fois <br>";
	}
?>
<form action="Main.php" method="post">
	<p><input type="submit" value="OK"></p>
</form>