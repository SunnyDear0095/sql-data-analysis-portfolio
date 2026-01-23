/*
平台：牛客网
题号：SQL23
题目：统计每个学校各难度的用户平均刷题数
难度：中等
链接：https://www.nowcoder.com/practice/...（可选，如果有具体链接）

题目描述：
- 需要统计每个学校、每个难度的用户平均刷题数
- 涉及三张表：user_profile, question_practice_detail, question_detail
- 结果保留四位小数

解题思路：
1. 表连接：通过 user_profile 连接 question_practice_detail，再连接 question_detail
2. 分组计算：按 university 和 difficult_level 分组
3. 平均值计算：答题总数 ÷ 独立用户数
4. 格式化：ROUND(..., 4) 保留四位小数
*/

-- ========== 我的解答 ==========
SELECT
    u.university,
    qd.difficult_level,
    ROUND(COUNT(qpd.id) / COUNT(DISTINCT u.device_id), 4) AS avg_answer_cnt
FROM
    user_profile u
JOIN
    question_practice_detail qpd ON u.device_id = qpd.device_id
JOIN
    question_detail qd ON qpd.question_id = qd.question_id
GROUP BY
    u.university, qd.difficult_level
ORDER BY
    u.university, qd.difficult_level;

/*
执行结果：通过
提交时间：2025.XX.XX

关键学习点：
1. 多表JOIN的使用（特别是通过中间表连接）
2. COUNT(DISTINCT ...) 用于计算独立用户数
3. ROUND函数控制小数位数
4. GROUP BY 多个字段的分组统计
*/