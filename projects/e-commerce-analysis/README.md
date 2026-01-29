# 电商销售数据分析项目

## 项目概述
模拟电商平台数据分析，使用SQL进行数据处理和业务洞察。

## 数据来源
模拟生成的电商订单数据，包含订单、用户、商品等信息。

## 分析目标
1. 计算核心销售指标
2. 分析用户购买行为  
3. 识别热销商品和品类

## 技术栈
- 数据库：MySQL
- 工具：Navicat Premium

## 分析内容
### 1. 基础销售指标
- 总销售额（GMV）
- 总订单数
- 平均客单价
- 每日销售趋势

### 2. 商品分析
- 最畅销商品
- 各品类销售占比
- 高单价商品分析

### 3. 用户分析
- 消费TOP5用户
- 用户复购分析
- 用户活跃时间段

## 项目结构
e-commerce-analysis/
├── sql/
│ ├── 01_create_table.sql
│ ├── 02_insert_data.sql
│ ├── 03_basic_analysis.sql
│ ├── 04_product_analysis.sql
│ └── 05_user_analysis.sql
└── README.md

text

复制

下载

## 如何使用
1. 运行 `sql/01_create_table.sql` 创建表
2. 运行 `sql/02_insert_data.sql` 插入数据
3. 运行分析脚本（03-05）

## 关键SQL技能
- 数据聚合与分组
- 业务指标计算
- 复杂查询编写
