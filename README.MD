### c/c++ docker开发调试环境

## 解析mysql binlog
```shell
mysqlbinlog  --no-defaults --database {{db-name}} --base64-output=decode-rows -vv {{binlog-name}} > xx.sql
```