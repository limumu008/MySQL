# MySQL
1.1 - MySQL 软件安装及数据库基础
## 学习内容：
1. 软件安装及服务器设置。http://www.runoob.com/mysql/mysql-install.html
2. 使用图形界面软件 Navicat for SQL
3. 数据库基础知识
- 数据库定义
- 关系型数据库
- 二维表
- 行
- 列
- 主键
- 外键
4. MySQL数据库管理系统
- 数据库
- 数据表
- 视图
- 存储过程
5. 参考资料
- [SQL必知必会] https://u18036366.pipipan.com/fs/18036366-300877816
- [MySQL教程] http://www.runoob.com/mysql/mysql-tutorial.html


1.2 - MySQL 基础 （一）查询语句
- 导入示例数据库，教程 https://www.yiibai.com/mysql/how-to-load-sample-database-into-mysql-database-server.html
- SQL 是什么？MySQL 是什么？

查询语句 SELECT FROM 
- 语句解释
- 去重语句
- 前 N 个语句

筛选语句 WHERE 
- 语句解释
- 运算符

分组语句 GROUP BY
- 语句解释
-  HAVING 子句

排序语句 ORDER BY 
- 语句解释
- 正序、逆序

SQL 注释
SQL 代码规范
[SQL 编程格式的优化建议] https://zhuanlan.zhihu.com/p/27466166
[SQL Style Guide]https://www.sqlstyle.guide/


2.1-MySQL 基础 （二）- 表操作
1. MySQL表数据类型
- 数据分为三类： 数值、日期/时间和字符串。
- 数值类： INTEGER、SMALLINT、DECIMAL、NUMERIC、FLOAT、REAL和DOUBLE PRECISION。
- 日期/时间类：DATE、TIME、YEAR、DATETIME和TIMESTAMP。
- 字符串类：CHAR、VARCHAR、BINARY、VARBINAR、BLOB、TEXT、ENUM和SET。
2. 用SQL语句创建表
- 通用语法：CREATE TABLE table_name (column_name column_type);
-   语句解释
-   设定列类型 、大小、约束
-   设定主键
3. 用SQL语句向表中添加数据
- 通用语法： INSERT INTO table_name(field1, field2,... fieldN) VALUES (value1, value2,...valueN);
-   语句解释
-   多种添加方式（指定列名；不指定列名）
- 插入多条数据： INSERT INTO table_name(field1,field2,... fieldN) VALUES (valueA1, valueA2,...valueAN), (valueB1, valueB2,...valueBN),...;
- 不指定列名：INSERT INTO table_name VALUES (id, value1,value2,...valueN); 按照列的顺序插入数据
4. 用SQL语句删除表
-   语句解释
-   DELETE
-   DROP
-   TRUNCATE
-   不同方式的区别
5. 用SQL语句修改表
-   修改列名
-   修改表中数据
-   删除行
-   删除列
-   新建列
-   新建行

2.2 MySQL 基础 （三）- 表联结

- MySQL别名
- INNER JOIN
- LEFT JOIN
- CROSS JOIN
- 自连接
- UNION
- 以上几种方式的区别和联系
