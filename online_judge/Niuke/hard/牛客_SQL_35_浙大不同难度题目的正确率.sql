
/*
平台：牛客网
题号：35
题目： 浙大不同难度题目的正确率
难度：困难


题目要求：

统计浙江大学用户在不同难度题目下的答题正确率，并按正确率升序排列

特殊要求：

1.多表关联：需要关联三张表：用户信息表、答题记录表、题目详情表
2.条件过滤：只统计浙江大学用户的数据
3.分组计算：按题目难度分组计算正确率
4.结果排序：按计算出的正确率升序排列
5.精度要求：正确率保留4位小数

解题思路：

1.表连接逻辑
2.使用where子句筛选浙大用户
3.正确率的计算：
  -分子：答对的题目数，使用sum和if函数
  -分母：总答题数：使用count
4.使用round函数保留四位小数

*/

-- ========== 我的解答 ==========
select
  qd.difficult_level,
  round(sum(if(qpd.result='right',1,0))/count(qpd.question_id),4) correct_rate
from 
  user_profile up
join
  question_practice_detail qpd
on 
  up.device_id=qpd.device_id
join
  question_detail qd
on 
  qpd.question_id=qd.question_id
where
  university='浙江大学'
group by
   qd.difficult_level
order by
  correct_rate ASC; 
/*
执行结果：通过
提交时间：2026.2.2

关键学习点：

1.多表连接技巧
2.正确率的计算方法
3.分组统计逻辑
4.round函数的使用

 易错点：

1.连接条件的错误
2.分母选择错误
3.整数除法问题
4.select 语句语法的错误
5，排序字段混淆


学习收获：

1.复杂多表连接：掌握三表及以上关联查询的写法
2.条件聚合计算：学会计算带条件的统计值（如正确率）
3.数据精度控制：使用ROUND函数控制小数位数
4.连接条件验证：注意连接条件的正确性，避免自连接错误

总结：

1.多表连接：正确的连接条件是关键
2.条件聚合：使用SUM+IF或CASE WHEN实现
3.分组统计：GROUP BY + 聚合函数
4.结果排序：ORDER BY 可以使用别名