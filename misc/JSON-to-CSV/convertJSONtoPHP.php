<?php
//header('Content-Type: text/csv');
//header('Content-Disposition: attachment; filename="sample.csv"');

$data = file_get_contents("data.json");
$decoded = json_decode($data);

$body = $decoded->conversation_message->body;
$conv_parts = $decoded->conversation_parts->conversation_parts;
foreach ($conv_parts as $key => $value) {

  if( !empty($conv_parts[$key]->body)){
    
    $body .= "-----------------------------------------<br>";
    $body .= date('F d, Y G',$conv_parts[$key]->created_at);
    $body .= $conv_parts[$key]->body;
  }
}

echo $body;

$output_array = array();

$output_array[] .= $decoded->conversation_message->body;



//var_dump($output_array);
$f = fopen('php://output', 'wb');
fputcsv($f,$output_array);
fclose($f);