<form action="" method="post" enctype="multipart/form-data">
    <input type="file" name="file">
    <button>Export</button>
</form>


<?php
require 'AutoLoad.php';
const CONDITIONALS = [
    'role' => '0',
    'name' => 'Caroline Brekke',
];

if (! empty($_FILES)) {
    $records = getRecords($_FILES['file']['tmp_name']);
    $pos = positionOfCondition($records);
    $str_column = array_shift($records);

    $result = [];
    foreach ($records as $row => $record) {
        $fields = explode(',', $record);
        $check = 1;
        foreach ($pos as $key => $each_pos) {
            if ($fields[$each_pos] === getValueOfCondition($key)) {
                $check = 0;
            }
        }
        if ($check === 1) {
            $result[] = $record;
        }
    }
    array_unshift($result, $str_column);

    writeData($result);
    dd('success');

}



