### c/c++ docker开发调试环境

## 解析mysql binlog
```shell
mysqlbinlog  --no-defaults --database {{db-name}} --base64-output=decode-rows -vv {{binlog-name}} > xx.sql
```

## 获取列名排序
```sql
SELECT
    TABLE_SCHEMA AS '库名',
    TABLE_NAME AS '表名',
    COLUMN_NAME AS '列名',
    ORDINAL_POSITION AS '列的排列顺序',
    COLUMN_DEFAULT AS '默认值',
    IS_NULLABLE AS '是否为空',
    DATA_TYPE AS '数据类型',
    CHARACTER_MAXIMUM_LENGTH AS '字符最大长度',
    NUMERIC_PRECISION AS '数值精度(最大位数)',
    NUMERIC_SCALE AS '小数精度',
    COLUMN_TYPE AS 列类型,
    COLUMN_KEY 'KEY',
    EXTRA AS '额外说明',
    COLUMN_COMMENT AS '注释'
FROM
    information_schema.`COLUMNS`
    where TABLE_SCHEMA ="db-name" AND TABLE_NAME='xxx'
ORDER BY
    TABLE_NAME,
    ORDINAL_POSITION;
```