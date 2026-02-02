/*
平台：牛客网
题号：34
题目： 统计复旦用户8月练题情况
难度：困难


题目要求：

统计复旦大学每个用户在2021年8月份的练习情况

特殊要求：

1.时间范围限定：只统计2021年8月份的数据
2.包含无记录用户：即使8月份没有练习记录，也要显示该用户（计数为0）
3.多表关联：需要关联用户信息表和练习记录表
4.条件聚合：需要区分答题总数和正确答题数

解题思路：

1.表连接选择：使用 LEFT JOIN 确保所有复旦用户都被包含
2.时间筛选位置：时间条件放在 ON 子句而非 WHERE 子句中
3.条件统计：使用 CASE WHEN 或 IF 进行条件计数
4.分组聚合：按用户设备ID和大学进行分组

*/

-- ========== 我的解答 ==========
select 
  up.device_id,up.university,
  count(qd.question_id) question_cnt,
  sum(case when qd.result='right' then 1 else 0 end) right_question_cnt
from
  user_profile up
left join
  question_practice_detail qd
on 
  up.device_id=qd.device_id
and
  qd.date between '2021-08-01' and '2021-08-31' 
where 
  university='复旦大学'
group by
  up.device_id,up.university
order by 
 up.device_id asc;
/*
执行结果：通过
提交时间：2026.2.2

关键学习点：

1. LEFT JOIN 与 INNER JOIN 的区别
2. 时间条件的放置位置
3. 条件聚合的多种写法
4. COUNT函数的选择

易错点：

1. 时间范围写错
2. WHERE与ON混淆
3. 分组字段遗漏
4. 日期格式问题

学习收获：

1.掌握LEFT JOIN的深层理解：理解了ON和WHERE子句在连接查询中的不同作用
2.时间范围查询：学会了如何正确处理包含边界的日期查询
3.复杂聚合：掌握了条件计数和条件求和的多种实现方式
4.数据完整性保护：学会在统计分析中保留无记录的数据行


总结：

1.连接类型选择：LEFT JOIN 保证左表所有记录都被保留
2.条件放置位置：连接条件放在 ON 子句，过滤条件放在 WHERE 子句
3.NULL值处理：COUNT(字段) 自动忽略NULL值，正好符合"无记录显示0"的需求
4.边界包含：使用 BETWEEN 或 >= <= 确保包含起始和结束日期
