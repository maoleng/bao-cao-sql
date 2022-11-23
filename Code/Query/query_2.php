<form action="" method="post" enctype="multipart/form-data">
	<input type="file" name="file">
	<button>Export</button>
</form>


<?php
require 'vendor/autoload.php';

const CONDITIONALS = [
	'id' => null,
	'area' => 'bbfd',
	'birthday' => 'bbfd',
	'phone' => 'bbfd',
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

function positionOfCondition($records): array
{
    $columns = explode(',', $records[0]);
    $columns = array_map(static function ($column) {
        if (str_starts_with($column, '__')) {
            return substr($column, 2);
        }
        if (str_starts_with($column, '_')) {
            return substr($column, 1);
        }

        return $column;
	}, $columns);
    $pos = [];
    $conditional_column = array_keys(CONDITIONALS);
    foreach ($conditional_column as $column) {
		$pos[] = array_search($column, $columns, true);
	}

    return $pos;
}

function getRecords($file): array
{
	$file_content = file_get_contents($file);
	preg_match_all('/.*\r/', $file_content, $matches);
    $records = [];
    foreach ($matches[0] as $record) {
        $records[] = str_replace('\,', '', substr($record, 0, -1));
    }

	return $records;
}