<form action="" method="post" enctype="multipart/form-data">
    <input type="file" name="file[]" multiple>
    <button>Export</button>
</form>


<?php
require 'AutoLoad.php';

const CONDITIONALS = [
    'id' => null,
    'name' => null,
];

if (! empty($_FILES)) {
    $file_records = getRecordsManyFiles($_FILES['file']['tmp_name']);
    $final_result = [];
    foreach ($file_records as $file_record) {
        $pos = positionOfCondition($file_record);
        foreach ($file_record as $row => $record) {
            $fields = explode(',', $record);
            $result_row = '';
            $count_pos = count($pos);
            foreach ($pos as $key => $each_pos) {
                if ($key + 1 === $count_pos) {
                    $result_row .= $fields[$each_pos];
                } else {
                    $result_row .= $fields[$each_pos].',';
                }
            }
            $final_result[] = $result_row;
        }
    }
    $str_column = getStringColumn();

    $last_result = [];
    foreach ($final_result as $row) {
        if ($row !== $str_column) {
            $last_result[] = $row;
        }
    }
    array_unshift($last_result, $str_column);

    writeData($last_result);
    dd('success');

}