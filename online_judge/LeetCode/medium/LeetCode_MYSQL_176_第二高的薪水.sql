/*
平台：LeetCode
题号：176
题目： 第二高的薪水
难度：中等


题目要求：
   查询Employee表中第二高的不同薪水。如果不存在第二高的薪水，查询应该返回null

特殊要求：
  1.需要处理重复值 - 只考虑不同的薪水
  2.如果不存在第二高的薪水，返回 null
  3.结果列名必须为 SecondHighestSalary

解题思路：
  -想要找到第二高的，我们可以使用子查询+max函数先找到最高的
  -然后在所以小于最高薪水里找到最大值
*/

-- ========== 我的解答 ==========
select 
  max(salary) as SecondHighestSalary 
from 
  Employee 
where 
  salary 
not in  
  ( select
      max(salary) as salary 
    from 
      Employee 
  );

/*
执行结果：通过
提交时间：2026.02.16

关键学习点：

  -MAX() 聚合函数
  -子查询
  -NULL 值的处理
  -SQL 查询执行顺序

2. 易错点：
  -没有处理重复值，且当没有第二高值时不返回null
  -忘记处理重复值

学习收获：
  -聚合函数的巧妙应用 - MAX 函数不仅用于找最大，还能用于处理空值
  -SQL 执行顺序的理解 - 子查询先执行，外层查询后执行
  -处理 NULL 的技巧：聚合函数是处理 NULL 的好帮手