平台：牛客网
题号：29
题目：计算用户的平均留存率 
难度：困难


题目要求：计算用户的平均留存率


特殊要求：
  1.计算每个用户在某天刷题后第二天还会再来刷题的存留情况
  2.统计整体的平均留存率
  3.需要考虑用户一天内多次刷题的情况(需要去重)

解题思路：
  1.自连接：将同一个表连接两次进行比较
  2.日期的计算：精确的日期加减，使用date_add/date_sub
  3.去重处理：使用distinct去除一天内的重复记录
  4.left join确保统计所有活跃日，包含无留存的

*/

-- ========== 我的解答 ==========

with
   sys as (
        select
          distinct device_id,date
        from
          question_practice_detail 
    )
select 
  count(b.device_id)/count(s.device_id) avg_ret
from
  sys s 
left join 
  sys b 
on 
  s.device_id=b.device_id 
and 
  b.date=date_add(s.date,interval 1 day);

/*
执行结果：通过
提交时间：2026.1.27

关键学习点：
  -理解留存率正确的计算
  -自连接的应用
  -count()函数在留存分析中的特殊用法

2. 易错点：
   -join条件的方向性
   -去重处理
   -整数除法问题


学习收获：

  1.留存率的核心概念：理解了用户留存 vs 活跃留存的区别
  2.自连接的高级应用：同一张表的巧妙连接实现时间序列分析
  3.去重的重要性：在用户行为分析中正确处理重复数据
  4.COUNT()函数的灵活使用：利用NULL值特性简化留存统计
  5.日期计算的精确性：DATE_ADD函数的正确使用
  6.复杂业务逻辑的SQL实现：将业务问题转化为SQL查询
