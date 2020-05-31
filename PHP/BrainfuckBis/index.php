<?php
function transpile($code)
{
    $result = <<<'EOT'
$cases = [];<br>
for ($i = 0; $i<100;$i++)<br>
{<br>
    $cases[] = 0;<br>
}<br>
$point = 0;<br>
EOT;
    for ($i = 0; $i<strlen($code);$i++)
    {
        switch ($code[$i]) {
            case '+':
                $result .= '$cases[$point] = $cases[$point] == 256 ? $cases[$point] : $cases[$point] + 1;<br>';
                break;

            case '-':
                $result .= '$cases[$point] = $cases[$point] == 0 ? $cases[$point] : $cases[$point] - 1;<br>';
                break;

            case '<':
                $result .= '$point = $point == 0 ? $point : $point - 1;<br>';
                break;

            case '>':
                $result .= '$point = $point == 100 ? $point : $point + 1;<br>';
                break;

            case '[':
                $result .= 'while($cases[$point] != 0){<br>';
                break;
            
            case ']':
                $result .= '}<br>';
                break;

            case '.':
                $result .= 'echo chr($cases[$point]);<br>';
                break;
            
            default:
                break;
        }
    }
    return $result;
}
if (isset($_POST["content"]))
{
    echo transpile($_POST["content"]);
}
?>
<form action="." method="post">
    <textarea name="content" id="" cols="30" rows="10" placeholder="enter code here"></textarea>
    <button type="submit">Send</button>
</form>