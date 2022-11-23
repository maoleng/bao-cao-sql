<form action="" method="post" enctype="multipart/form-data">
    <input type="file" name="file">
    <button>Export</button>
</form>


<?php
require 'AutoLoad.php';
const CONDITIONALS = [
    'student_card_id' => 'A17H8492',
];

if (! empty($_FILES)) {
    $records = getRecords($_FILES['file']['tmp_name']);
    $pos = positionOfCondition($records);
    array_shift($records);

    $result = [];
    foreach ($records as $row => $record) {
        $fields = explode(',', $record);
        $check = 1;
        foreach ($pos as $key => $each_pos) {
            if ($fields[$each_pos] !== getValueOfCondition($key)) {
                $check = 0;
            }
        }
        if ($check === 1) {
            $result[] = $record;
        }
    }
    dd($result);

}



