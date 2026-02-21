平台：LeetCode
题号：177
题目：第n高的薪水 
难度：中等


题目要求：
返回Empolyee表中第n高的不同工资

特殊要求：
1.需要处理重复值，只考虑不同的薪水
2.需要实现为一个函数
3.如果少于n个不同工资，返回null

解题思路：
1.要考虑不同的工资，所以需要去重
2.正确识别第n高的位置
3.使用limit和offset
    -先对工资去重排序
    -然后跳过前n-1个，取第1个
*/

-- ========== 我的解答 ==========
create function getNthHighestSalary(N INT) 
returns INT
begin
  declare m int;
  set m= n-1;
  return (
    select distinct salary
    from Employee
    order by salary desc
    limit 1 offset m
  );
end

/*
执行结果：通过
提交时间：2026.2.21

关键学习点：
 -LIMIT 和 OFFSET 的使用：LIMIT 1 OFFSET N-1 跳过了前 N-1 个记录
-存储函数的编写：CREATE FUNCTION 语法，RETURNS INT 指定返回类型

2. 易错点：
-去重问题：重复工资会导致排名错误
-需要确保n是整数且大于0
-子查询可能返回多行

学习收获
1.学会编写可复用的函数
2.考虑极端情况
3.limit的动态偏移
4.去重的多种方式
