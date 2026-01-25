/*
平台：牛客网
题号：SQL25
题目：查找山东大学或者性别为男生的信息
难度：中等


题目要求：
现在运营想要分别查看学校为山东大学或者性别为男性的用户的device_id、gender、age和gpa数据，请取出相应结果，结果不去重。

特殊要求：
- 先输出学校为山东大学的用户

- 再输出性别为男性的用户

- 结果不去重（但同一条记录不应重复出现）

解题思路：
1. 由于特殊要求（先山东大学后男性，且需要控制输出顺序），不能使用OR
2. 使用UNION ALL连接两个查询结果
3. 关键点：第二个查询需要排除山东大学的用户，避免重复
*/

-- ========== 我的解答 ==========
select
  device_id,gender,age,gpa 
from
  user_profile
where
  university='山东大学'
union all
select 
  device_id,gender,age,gpa
from 
 user_profile
where
  gender='male'
  and university!='山东大学';
/*
执行结果：通过
提交时间：2025.1.24

关键学习点：
1. OR 和 UNION ALL 的区别：
   - OR：单次查询，混合条件，无法控制输出顺序
   - UNION ALL：多次查询结果合并，可以控制顺序和分组

2. 易错点：
   - 使用UNION ALL时，第二个查询必须排除第一个查询已包含的数据
   - 否则会导致符合两个条件的记录重复出现


学习收获：
1.掌握了or和union all的核心区别
2.理解了合适需要手动排除重复数据
3.学会了控制查询结果的输出顺序