<?php
//Check if all variables are set in loop
$requiredFields = array('id', 'type', ...);
if (array_diff_key(array_flip($requiredFields), $_POST)) {
    die('Not all fields were posted');
}
if (count(array_filter($_POST)) != count($_POST)) {
    die('Some fields were empty');
}

//REF
//https://stackoverflow.com/questions/16281576/shortcut-for-if-statements-too-many-posts-to-check-if-isset
