<?php

require 'vendor/autoload.php';
if (! function_exists('getRecords')) {
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
}

if (! function_exists('getRecordsManyFiles')) {
    function getRecordsManyFiles($files): array
    {
        $result = [];
        foreach ($files as $file) {
            $file_content = file_get_contents($file);
            preg_match_all('/.*\r/', $file_content, $matches);
            $records = [];
            foreach ($matches[0] as $record) {
                $records[] = str_replace('\,', '', substr($record, 0, -1));
            }
            $result[] = $records;
        }

        return $result;
    }
}

if (! function_exists('positionOfCondition')) {
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
}

if (! function_exists('getValueOfCondition')) {
    function getValueOfCondition($key)
    {
        return array_values(CONDITIONALS)[$key] ?? null;
    }
}

if (! function_exists('getStringColumn')) {
    function getStringColumn(): string
    {
        $arr = array_map(static function ($each) {
            if ($each === 'id') {
                return $each;
            }
            if (str_ends_with($each, '_id')) {
                return '_'.$each;
            }

            return '__'.$each;
        }, array_keys(CONDITIONALS));
        return implode(',', $arr);
    }

}

if (! function_exists('writeData')) {
    function writeData($result)
    {
        $fp = fopen('result.txt', 'w');
        foreach ($result as $row) {
            fwrite($fp, $row. "\n");
        }
    }
}