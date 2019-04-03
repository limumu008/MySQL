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
-   设定列类型 、大小、约束
-   设定主键
3. 用SQL语句向表中添加数据
- 通用语法： INSERT INTO table_name(field1, field2,... fieldN) VALUES (value1, value2,...valueN);
-   多种添加方式（指定列名；不指定列名）
- 插入多条数据： INSERT INTO table_name(field1,field2,... fieldN) VALUES (valueA1, valueA2,...valueAN), (valueB1, valueB2,...valueBN),...;
- 不指定列名：INSERT INTO table_name VALUES (id, value1,value2,...valueN); 按照列的顺序插入数据
4. 用SQL语句删除表
-   删除表内部分数据，用DELETE。 DELETE FROM table_name WHERE condition;
-   删除表，用DROP，慎用。 DROP TABLE table_name;
-   清除表内数据，保持表结构，用TRUNCATE。 TRUNCATE TABLE table_name;
-   不同方式的区别： 
- DROP，立即释放磁盘空间； 
- TRUNCATE，保留表结构，立即释放磁盘空间；
- DELETE FROM table_name, 也会删除表全部数据，表结构不变，对于MyISAM会立刻释放磁盘空间，InnoDB不会释放磁盘空间； 
- DELETE FROM table_name WHERE condition, 表结构不变，不会释放磁盘空间。
5. 用SQL语句修改表
-   修改列名： ALTER TABLE table_name CHANGE column column_name new_column_name type;
-   修改表中数据: 先删除再添加 ALTER TABLE table_name DROP i; ALTER TABLE table_name ADD i type;
-   删除行：ALTER TABLE table_name DROP i;
-   删除列: ALTER TABLE table_name DROP column_name;
-   新建列: ALTER TABLE table_name ADD column_name type;
-   新建行: ALTER TABLE table_name ADD 

2.2 MySQL 基础 （三）- 表联结

- INNER JOIN: 获取两个表中字段匹配关系的记录。SELECT * FROM A INNER JOIN B ON A.ID = B.ID;
- LEFT(RIGHT) JOIN： 获取左(右)表所有记录，即使右(左)表没有对应匹配的记录。SELECT * FROM A LEFT JOIN B ON A.ID = B.ID;
- CROSS JOIN： 返回行的笛卡尔乘积。SELECT * FROM A CROSS JOIN B; 如果加入连接条件，和INNER JOIN就非常类似。
SELECT * FROM A CROSS JOIN B WHERE A.ID = B.ID;
- 自连接： 一个表进行自我链接。 SELECT * FROM A R1, A R2 WHERE R1.ID = R2.ID AND R1.NAME = R2.NAME;
- UNION：连接两个以上的SELECT语句的结果组合到一个结果集合中，多个SELECT语句会删除重复的数据。 SELECT * FROM A UNION (ALL) SELECT * FROM B;
如果加入ALL，就保留所有数据，包括重复的数据。

