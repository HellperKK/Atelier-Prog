<?php 
	function arr_make($len, $element){
		$i = 0;
		$tab = [];
		while($i < $len){
			$tab[$i] = $element;
			$i += 1;
		}
		return $tab;
	}
	function mathing_bracket_from($str, $index){
		$compteur = 1;
		$index += 1;
		while($compteur > 0){
			if($str[$index] == "["){
				$compteur += 1;
			}
			else if($str[$index] == "]"){
				$compteur -= 1;
			}
			$index += 1;
		}
		return $index - 1;
	}
	function mathing_bracket_since($str, $index){
		$compteur = 1;
		$index -= 1;
		while($compteur > 0){
			if($str[$index] == "]"){
				$compteur += 1;
			}
			else if($str[$index] == "["){
				$compteur -= 1;
			}
			$index -= 1;
		}
		return $index + 1;
		return $index;
	}
?>