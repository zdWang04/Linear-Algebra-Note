# 线性代数笔记

## 参考用书

- Sheldon Axler, _Linear Algebra Done Right_, 4th Edition, Springer, 2024.

## 文档结构

```bash
./
├── assets
│   └── 瑞鹤图.png # 笔记封面
├── contents
│   ├── appendix  # 附录内容
│   │   └── appendixA.typ
│   └── chapters  # 正文内容
│       ├── chapter01.typ
│       ├── chapter02.typ
│       ├── chapter03.typ
│       └── ...
├── main.pdf
├── main.typ # 主文件
├── README.md
└── utils  # 工具函数
    └── utils.typ
```

## 编译文档

0. 下载 `typst` 编译器

   请参阅[官方仓库](https://github.com/typst/typst)的说明

1. 下载字体（可选）

   请前往[官方仓库 release](https://github.com/lxgw/LxgwWenKai)下载

2. 编译

   在终端中运行以下命令

```bash
typst compile ./main.typ
```

3. 阅读

   编译产生的文档默认名为 `main.pdf`
