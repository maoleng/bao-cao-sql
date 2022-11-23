<form action="" method="post" enctype="multipart/form-data">
	<input type="file" name="file">
	<button>Export</button>
</form>


<?php
require 'AutoLoad.php';

const CONDITIONALS = [
	'name' => null,
	'student_card_id' => null,
];

if (! empty($_FILES)) {
	$records = getRecords($_FILES['file']['tmp_name']);
    $pos = positionOfCondition($records);
    $result = [];
	foreach ($records as $row => $record) {
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
        $result[] = $result_row;
    }
    dd($result);
}