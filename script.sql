USE [ToyShop]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 5/10/2023 11:57:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[accountID] [int] IDENTITY(1,1) NOT NULL,
	[phone] [varchar](10) NULL,
	[password] [varchar](70) NULL,
	[enabled] [tinyint] NULL,
	[roleID] [int] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[accountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Accounts] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 5/10/2023 11:57:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[productID] [int] NOT NULL,
	[userID] [int] NOT NULL,
	[amount] [int] NULL,
	[price] [money] NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[userID] ASC,
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Carts] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 5/10/2023 11:57:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[categoryID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[description] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Categories] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 5/10/2023 11:57:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[commentID] [int] IDENTITY(1,1) NOT NULL,
	[rate] [float] NULL,
	[content] [nvarchar](200) NULL,
	[email] [nchar](30) NULL,
	[userName] [nvarchar](200) NULL,
	[productID] [int] NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[commentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Comments] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Images]    Script Date: 5/10/2023 11:57:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[imageID] [int] IDENTITY(1,1) NOT NULL,
	[src] [nvarchar](250) NULL,
	[productID] [int] NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[imageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Images] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Order_Detail]    Script Date: 5/10/2023 11:57:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Detail](
	[orderID] [int] NOT NULL,
	[productID] [int] NOT NULL,
	[amount] [int] NULL,
	[price] [money] NULL,
 CONSTRAINT [PK_Order_detail] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC,
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Order_Detail] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 5/10/2023 11:57:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[createdAt] [date] NULL,
	[total] [money] NULL,
	[shipAddress] [nvarchar](250) NULL,
	[shipPhone] [varchar](10) NULL,
	[discount] [float] NULL,
	[comment] [nvarchar](1000) NULL,
	[userID] [int] NULL,
	[statusID] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Orders] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Products]    Script Date: 5/10/2023 11:57:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[productID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) NULL,
	[price] [money] NULL,
	[oldPrice] [money] NULL,
	[detail] [nvarchar](1000) NULL,
	[description] [nvarchar](1000) NULL,
	[stock] [int] NULL,
	[discount] [float] NULL,
	[newProduct] [bit] NULL,
	[bestSaler] [bit] NULL,
	[categoryID] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Products] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 5/10/2023 11:57:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[roleID] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NULL,
	[description] [nvarchar](200) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Roles] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Slide]    Script Date: 5/10/2023 11:57:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slide](
	[slideID] [int] IDENTITY(1,1) NOT NULL,
	[image] [nvarchar](200) NULL,
 CONSTRAINT [PK_Slide] PRIMARY KEY CLUSTERED 
(
	[slideID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Slide] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Statuses]    Script Date: 5/10/2023 11:57:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statuses](
	[statusID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) NULL,
	[description] [nvarchar](500) NULL,
 CONSTRAINT [PK_Statuses] PRIMARY KEY CLUSTERED 
(
	[statusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Statuses] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/10/2023 11:57:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[fullName] [nvarchar](200) NULL,
	[address] [nvarchar](200) NULL,
	[email] [varchar](100) NULL,
	[phone] [varchar](10) NULL,
	[accountID] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Users] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Vouchers]    Script Date: 5/10/2023 11:57:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vouchers](
	[voucherID] [int] IDENTITY(1,1) NOT NULL,
	[discount] [float] NULL,
	[minTotal] [money] NULL,
	[code] [nchar](50) NULL,
	[amount] [int] NULL,
	[startDate] [date] NULL,
	[endDate] [date] NULL,
 CONSTRAINT [PK_Vouchers] PRIMARY KEY CLUSTERED 
(
	[voucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Vouchers] TO  SCHEMA OWNER 
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 

INSERT [dbo].[Accounts] ([accountID], [phone], [password], [enabled], [roleID]) VALUES (1, N'0333007630', N'{bcrypt}$2a$10$fnMKJ3bCH6tl4HPE9CjotORLGu6YwqvDP/5IKJjKlcL14tPN6Mt.y', 1, 1)
INSERT [dbo].[Accounts] ([accountID], [phone], [password], [enabled], [roleID]) VALUES (2, N'0399986559', N'{bcrypt}$2a$10$5DEE2cdT0S/MyYmELT15oOw5ApQKrBt9ThZ/eA7eLddIAqGlKPQ4O', 1, 2)
INSERT [dbo].[Accounts] ([accountID], [phone], [password], [enabled], [roleID]) VALUES (3, N'0522561467', N'{bcrypt}$2a$10$EclowJxt5QBRuaAT8QUI2.pJyCrH.IcjCpLo2wCthG9ptktfQYWI2', 1, 1)
INSERT [dbo].[Accounts] ([accountID], [phone], [password], [enabled], [roleID]) VALUES (4, N'0853300586', N'{bcrypt}$2a$10$5Z9GR/NS5Cebfa5E5r4Y3uVfczKBxHc3iQlh0f8hZiHyAFWStDhx.', 1, 1)
SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([categoryID], [name], [description]) VALUES (1, N'ĐỒ CHƠI MÔ HÌNH', N'Chưa có mô tả')
INSERT [dbo].[Categories] ([categoryID], [name], [description]) VALUES (2, N'ĐỒ CHƠI XẾP HÌNH', N'Chưa có mô tả')
INSERT [dbo].[Categories] ([categoryID], [name], [description]) VALUES (3, N'ĐỒ CHƠI BÚP BÊ', N'Chưa có mô tả')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Images] ON 

INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (1, N'/resources/img/product_picture/img_1_1.jpg', 1)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (2, N'/resources/img/product_picture/img_1_2.jpg', 1)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (3, N'/resources/img/product_picture/img_1_3.jpg', 1)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (5, N'/resources/img/product_picture/img_2_1.jpg', 2)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (6, N'/resources/img/product_picture/img_2_2.jpg', 2)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (7, N'/resources/img/product_picture/img_2_3.jpg', 2)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (9, N'/resources/img/product_picture/img_3_1.jpg', 3)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (10, N'/resources/img/product_picture/img_3_2.jpg', 3)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (13, N'/resources/img/product_picture/img_4_1.jpg', 4)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (14, N'/resources/img/product_picture/img_4_2.jpg', 4)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (15, N'/resources/img/product_picture/img_4_3.jpg', 4)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (17, N'/resources/img/product_picture/img_5_1.jpg', 5)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (18, N'/resources/img/product_picture/img_5_2.jpg', 5)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (19, N'/resources/img/product_picture/img_5_3.jpg', 5)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (21, N'/resources/img/product_picture/img_6_1.jpg', 6)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (22, N'/resources/img/product_picture/img_6_2.jpg', 6)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (23, N'/resources/img/product_picture/img_6_3.jpg', 6)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (24, N'/resources/img/product_picture/img_6_4.jpg', 6)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (25, N'/resources/img/product_picture/img_7_1.jpg', 7)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (26, N'/resources/img/product_picture/img_7_2.jpg', 7)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (29, N'/resources/img/product_picture/img_8_1.jpg', 8)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (33, N'/resources/img/product_picture/img_9_1.jpg', 9)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (34, N'/resources/img/product_picture/img_9_2.jpg', 9)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (35, N'/resources/img/product_picture/img_9_3.jpg', 9)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (37, N'/resources/img/product_picture/img_10_1.jpg', 10)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (38, N'/resources/img/product_picture/img_10_2.jpg', 10)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (39, N'/resources/img/product_picture/img_10_3.jpg', 10)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (41, N'/resources/img/product_picture/img_11_1.jpg', 11)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (42, N'/resources/img/product_picture/img_11_2.jpg', 11)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (43, N'/resources/img/product_picture/img_11_3.jpg', 11)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (45, N'/resources/img/product_picture/img_12_1.jpg', 12)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (46, N'/resources/img/product_picture/img_12_2.jpg', 12)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (49, N'/resources/img/product_picture/img_13_1.jpg', 13)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (50, N'/resources/img/product_picture/img_13_2.jpg', 13)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (51, N'/resources/img/product_picture/img_13_3.jpg', 13)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (53, N'/resources/img/product_picture/img_14_1.jpg', 14)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (54, N'/resources/img/product_picture/img_14_2.jpg', 14)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (57, N'/resources/img/product_picture/img_15_1.jpg', 15)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (58, N'/resources/img/product_picture/img_15_2.jpg', 15)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (59, N'/resources/img/product_picture/img_15_3.jpg', 15)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (60, N'/resources/img/product_picture/img_15_4.jpg', 15)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (61, N'/resources/img/product_picture/img_16_1.jpg', 16)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (62, N'/resources/img/product_picture/img_16_2.jpg', 16)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (63, N'/resources/img/product_picture/img_16_3.jpg', 16)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (65, N'/resources/img/product_picture/img_17_1.jpg', 17)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (66, N'/resources/img/product_picture/img_17_2.jpg', 17)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (67, N'/resources/img/product_picture/img_17_3.jpg', 17)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (69, N'/resources/img/product_picture/img_18_1.jpg', 18)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (70, N'/resources/img/product_picture/img_18_2.jpg', 18)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (73, N'/resources/img/product_picture/img_19_1.jpg', 19)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (74, N'/resources/img/product_picture/img_19_2.jpg', 19)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (75, N'/resources/img/product_picture/img_19_3.jpg', 19)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (77, N'/resources/img/product_picture/img_20_1.jpg', 20)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (78, N'/resources/img/product_picture/img_20_2.jpg', 20)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (79, N'/resources/img/product_picture/img_20_3.jpg', 20)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (80, N'/resources/img/product_picture/img_20_4.jpg', 20)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (81, N'/resources/img/product_picture/img_21_1.jpg', 21)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (82, N'/resources/img/product_picture/img_21_2.jpg', 21)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (83, N'/resources/img/product_picture/img_21_3.jpg', 21)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (85, N'/resources/img/product_picture/img_22_1.jpg', 22)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (86, N'/resources/img/product_picture/img_22_2.jpg', 22)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (89, N'/resources/img/product_picture/img_23_1.jpg', 23)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (93, N'/resources/img/product_picture/img_24_1.jpg', 24)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (94, N'/resources/img/product_picture/img_24_2.jpg', 24)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (95, N'/resources/img/product_picture/img_24_3.jpg', 24)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (97, N'/resources/img/product_picture/img_25_1.jpg', 25)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (98, N'/resources/img/product_picture/img_25_2.jpg', 25)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (99, N'/resources/img/product_picture/img_25_3.jpg', 25)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (101, N'/resources/img/product_picture/img_26_1.jpg', 26)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (102, N'/resources/img/product_picture/img_26_2.jpg', 26)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (103, N'/resources/img/product_picture/img_26_3.jpg', 26)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (105, N'/resources/img/product_picture/img_27_1.jpg', 27)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (106, N'/resources/img/product_picture/img_27_2.jpg', 27)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (107, N'/resources/img/product_picture/img_27_3.jpg', 27)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (108, N'/resources/img/product_picture/img_27_4.jpg', 27)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (109, N'/resources/img/product_picture/img_28_1.jpg', 28)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (110, N'/resources/img/product_picture/img_28_2.jpg', 28)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (111, N'/resources/img/product_picture/img_28_3.jpg', 28)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (112, N'/resources/img/product_picture/img_28_4.jpg', 28)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (113, N'/resources/img/product_picture/img_29_1.jpg', 29)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (114, N'/resources/img/product_picture/img_29_2.jpg', 29)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (115, N'/resources/img/product_picture/img_29_3.jpg', 29)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (116, N'/resources/img/product_picture/img_29_4.jpg', 29)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (117, N'/resources/img/product_picture/img_30_1.jpg', 30)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (118, N'/resources/img/product_picture/img_30_2.jpg', 30)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (119, N'/resources/img/product_picture/img_30_3.jpg', 30)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (120, N'/resources/img/product_picture/img_30_4.jpg', 30)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (121, N'/resources/img/product_picture/img_31_1.jpg', 31)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (122, N'/resources/img/product_picture/img_31_2.jpg', 31)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (123, N'/resources/img/product_picture/img_31_3.jpg', 31)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (124, N'/resources/img/product_picture/img_31_4.jpg', 31)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (125, N'/resources/img/product_picture/img_32_1.jpg', 32)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (126, N'/resources/img/product_picture/img_32_2.jpg', 32)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (127, N'/resources/img/product_picture/img_32_3.jpg', 32)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (129, N'/resources/img/product_picture/img_33_1.jpg', 33)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (130, N'/resources/img/product_picture/img_33_2.jpg', 33)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (131, N'/resources/img/product_picture/img_33_3.jpg', 33)
INSERT [dbo].[Images] ([imageID], [src], [productID]) VALUES (132, N'/resources/img/product_picture/img_33_4.jpg', 33)
SET IDENTITY_INSERT [dbo].[Images] OFF
GO
INSERT [dbo].[Order_Detail] ([orderID], [productID], [amount], [price]) VALUES (1, 12, 2, 1200000.0000)
INSERT [dbo].[Order_Detail] ([orderID], [productID], [amount], [price]) VALUES (2, 4, 1, 2000000.0000)
INSERT [dbo].[Order_Detail] ([orderID], [productID], [amount], [price]) VALUES (2, 19, 1, 1500000.0000)
INSERT [dbo].[Order_Detail] ([orderID], [productID], [amount], [price]) VALUES (3, 13, 1, 1000000.0000)
INSERT [dbo].[Order_Detail] ([orderID], [productID], [amount], [price]) VALUES (5, 12, 1, 1200000.0000)
INSERT [dbo].[Order_Detail] ([orderID], [productID], [amount], [price]) VALUES (5, 27, 1, 1000000.0000)
INSERT [dbo].[Order_Detail] ([orderID], [productID], [amount], [price]) VALUES (6, 27, 1, 1000000.0000)
INSERT [dbo].[Order_Detail] ([orderID], [productID], [amount], [price]) VALUES (7, 18, 1, 1850000.0000)
INSERT [dbo].[Order_Detail] ([orderID], [productID], [amount], [price]) VALUES (7, 22, 1, 2850000.0000)
INSERT [dbo].[Order_Detail] ([orderID], [productID], [amount], [price]) VALUES (10, 6, 1, 1000000.0000)
INSERT [dbo].[Order_Detail] ([orderID], [productID], [amount], [price]) VALUES (10, 32, 1, 1500000.0000)
INSERT [dbo].[Order_Detail] ([orderID], [productID], [amount], [price]) VALUES (12, 4, 1, 2000000.0000)
INSERT [dbo].[Order_Detail] ([orderID], [productID], [amount], [price]) VALUES (12, 19, 1, 1500000.0000)
INSERT [dbo].[Order_Detail] ([orderID], [productID], [amount], [price]) VALUES (13, 9, 9, 850000.0000)
INSERT [dbo].[Order_Detail] ([orderID], [productID], [amount], [price]) VALUES (13, 18, 2, 1850000.0000)
INSERT [dbo].[Order_Detail] ([orderID], [productID], [amount], [price]) VALUES (14, 12, 1, 1200000.0000)
INSERT [dbo].[Order_Detail] ([orderID], [productID], [amount], [price]) VALUES (14, 19, 1, 1500000.0000)
INSERT [dbo].[Order_Detail] ([orderID], [productID], [amount], [price]) VALUES (15, 14, 1, 1200000.0000)
INSERT [dbo].[Order_Detail] ([orderID], [productID], [amount], [price]) VALUES (16, 6, 1, 1000000.0000)
INSERT [dbo].[Order_Detail] ([orderID], [productID], [amount], [price]) VALUES (17, 18, 4, 1850000.0000)
INSERT [dbo].[Order_Detail] ([orderID], [productID], [amount], [price]) VALUES (18, 18, 4, 1850000.0000)
INSERT [dbo].[Order_Detail] ([orderID], [productID], [amount], [price]) VALUES (19, 22, 5, 2850000.0000)
INSERT [dbo].[Order_Detail] ([orderID], [productID], [amount], [price]) VALUES (20, 27, 5, 1000000.0000)
INSERT [dbo].[Order_Detail] ([orderID], [productID], [amount], [price]) VALUES (22, 12, 1, 1200000.0000)
INSERT [dbo].[Order_Detail] ([orderID], [productID], [amount], [price]) VALUES (23, 22, 3, 2850000.0000)
INSERT [dbo].[Order_Detail] ([orderID], [productID], [amount], [price]) VALUES (24, 6, 2, 1000000.0000)
INSERT [dbo].[Order_Detail] ([orderID], [productID], [amount], [price]) VALUES (25, 18, 3, 1850000.0000)
INSERT [dbo].[Order_Detail] ([orderID], [productID], [amount], [price]) VALUES (26, 9, 2, 850000.0000)
INSERT [dbo].[Order_Detail] ([orderID], [productID], [amount], [price]) VALUES (27, 16, 1, 850000.0000)
INSERT [dbo].[Order_Detail] ([orderID], [productID], [amount], [price]) VALUES (28, 19, 4, 1500000.0000)
INSERT [dbo].[Order_Detail] ([orderID], [productID], [amount], [price]) VALUES (29, 19, 3, 1500000.0000)
INSERT [dbo].[Order_Detail] ([orderID], [productID], [amount], [price]) VALUES (30, 19, 2, 1500000.0000)
INSERT [dbo].[Order_Detail] ([orderID], [productID], [amount], [price]) VALUES (31, 18, 2, 1850000.0000)
INSERT [dbo].[Order_Detail] ([orderID], [productID], [amount], [price]) VALUES (32, 16, 1, 850000.0000)
INSERT [dbo].[Order_Detail] ([orderID], [productID], [amount], [price]) VALUES (32, 22, 1, 2850000.0000)
INSERT [dbo].[Order_Detail] ([orderID], [productID], [amount], [price]) VALUES (33, 12, 1, 1200000.0000)
INSERT [dbo].[Order_Detail] ([orderID], [productID], [amount], [price]) VALUES (34, 22, 1, 2850000.0000)
INSERT [dbo].[Order_Detail] ([orderID], [productID], [amount], [price]) VALUES (35, 12, 2, 1200000.0000)
INSERT [dbo].[Order_Detail] ([orderID], [productID], [amount], [price]) VALUES (36, 22, 1, 2850000.0000)
INSERT [dbo].[Order_Detail] ([orderID], [productID], [amount], [price]) VALUES (37, 19, 1, 1500000.0000)
INSERT [dbo].[Order_Detail] ([orderID], [productID], [amount], [price]) VALUES (38, 5, 1, 3000000.0000)
INSERT [dbo].[Order_Detail] ([orderID], [productID], [amount], [price]) VALUES (39, 5, 5, 3000000.0000)
INSERT [dbo].[Order_Detail] ([orderID], [productID], [amount], [price]) VALUES (40, 5, 5, 3000000.0000)
INSERT [dbo].[Order_Detail] ([orderID], [productID], [amount], [price]) VALUES (41, 22, 10, 2850000.0000)
INSERT [dbo].[Order_Detail] ([orderID], [productID], [amount], [price]) VALUES (42, 9, 1, 850000.0000)
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([orderID], [createdAt], [total], [shipAddress], [shipPhone], [discount], [comment], [userID], [statusID]) VALUES (1, CAST(N'2022-05-19' AS Date), 2400000.0000, N'13, Nguyễn Văn Bảo', N'0333007630', 0, N'đóng gói cẩn thận', 1, 5)
INSERT [dbo].[Orders] ([orderID], [createdAt], [total], [shipAddress], [shipPhone], [discount], [comment], [userID], [statusID]) VALUES (2, CAST(N'2022-05-20' AS Date), 3500000.0000, N'563/93/47, LÊ VĂN KHƯƠNG, QUẬN 12', N'0333007630', 0, NULL, 1, 2)
INSERT [dbo].[Orders] ([orderID], [createdAt], [total], [shipAddress], [shipPhone], [discount], [comment], [userID], [statusID]) VALUES (3, CAST(N'2022-05-20' AS Date), 1000000.0000, N'13, NGUYỄN VĂN BẢO, QUẬN GÒ VẤP', N'0399986559', 0, N'Giao nhanh giúp mình', 2, 1)
INSERT [dbo].[Orders] ([orderID], [createdAt], [total], [shipAddress], [shipPhone], [discount], [comment], [userID], [statusID]) VALUES (4, CAST(N'2022-05-20' AS Date), 135000.0000, N'147/B PHAN ĐÌNH PHÙNG', N'0522561467', 0, NULL, 3, 2)
INSERT [dbo].[Orders] ([orderID], [createdAt], [total], [shipAddress], [shipPhone], [discount], [comment], [userID], [statusID]) VALUES (5, CAST(N'2022-05-21' AS Date), 2665000.0000, N'Binh Chanh', N'0853300586', 0, NULL, 4, 5)
INSERT [dbo].[Orders] ([orderID], [createdAt], [total], [shipAddress], [shipPhone], [discount], [comment], [userID], [statusID]) VALUES (6, CAST(N'2022-05-21' AS Date), 1613000.0000, N'Binh Chanh', N'0853300586', 0, NULL, 4, 5)
INSERT [dbo].[Orders] ([orderID], [createdAt], [total], [shipAddress], [shipPhone], [discount], [comment], [userID], [statusID]) VALUES (7, CAST(N'2020-05-21' AS Date), 4700000.0000, N'147/B PHAN ĐÌNH PHÙNG', N'0522561467', 0, NULL, 3, 1)
INSERT [dbo].[Orders] ([orderID], [createdAt], [total], [shipAddress], [shipPhone], [discount], [comment], [userID], [statusID]) VALUES (8, CAST(N'2020-05-21' AS Date), 503000.0000, N'147/B PHAN ĐÌNH PHÙNG', N'0522561467', 0, NULL, 3, 4)
INSERT [dbo].[Orders] ([orderID], [createdAt], [total], [shipAddress], [shipPhone], [discount], [comment], [userID], [statusID]) VALUES (9, CAST(N'2022-04-21' AS Date), 543000.0000, N'147/B PHAN ĐÌNH PHÙNG', N'0522561467', 0, NULL, 3, 4)
INSERT [dbo].[Orders] ([orderID], [createdAt], [total], [shipAddress], [shipPhone], [discount], [comment], [userID], [statusID]) VALUES (10, CAST(N'2022-03-20' AS Date), 3150000.0000, N'147/B PHAN ĐÌNH PHÙNG', N'0522561467', 0, NULL, 3, 3)
INSERT [dbo].[Orders] ([orderID], [createdAt], [total], [shipAddress], [shipPhone], [discount], [comment], [userID], [statusID]) VALUES (11, CAST(N'2022-03-20' AS Date), 3150000.0000, N'147/B PHAN ĐÌNH PHÙNG', N'0522561467', 0, NULL, 3, 5)
INSERT [dbo].[Orders] ([orderID], [createdAt], [total], [shipAddress], [shipPhone], [discount], [comment], [userID], [statusID]) VALUES (12, CAST(N'2022-03-20' AS Date), 3500000.0000, N'Go Vap', N'0829283721', 0, N'giao nhanh', 3, 5)
INSERT [dbo].[Orders] ([orderID], [createdAt], [total], [shipAddress], [shipPhone], [discount], [comment], [userID], [statusID]) VALUES (13, CAST(N'2022-05-19' AS Date), 11350000.0000, N'147/B PHAN ĐÌNH PHÙNG', N'0522561467', 0, NULL, 3, 3)
INSERT [dbo].[Orders] ([orderID], [createdAt], [total], [shipAddress], [shipPhone], [discount], [comment], [userID], [statusID]) VALUES (14, CAST(N'2022-05-19' AS Date), 3240000.0000, N'Binh Chanh', N'0853300586', 0, NULL, 4, 5)
INSERT [dbo].[Orders] ([orderID], [createdAt], [total], [shipAddress], [shipPhone], [discount], [comment], [userID], [statusID]) VALUES (15, CAST(N'2022-05-19' AS Date), 1200000.0000, N'563/93/47, LÊ VĂN KHƯƠNG, QUẬN 12', N'0333007630', 0, NULL, 1, 5)
INSERT [dbo].[Orders] ([orderID], [createdAt], [total], [shipAddress], [shipPhone], [discount], [comment], [userID], [statusID]) VALUES (16, CAST(N'2022-05-19' AS Date), 1000000.0000, N'563/93/47, LÊ VĂN KHƯƠNG, QUẬN 12', N'0333007630', 0, NULL, 1, 3)
INSERT [dbo].[Orders] ([orderID], [createdAt], [total], [shipAddress], [shipPhone], [discount], [comment], [userID], [statusID]) VALUES (17, CAST(N'2022-05-18' AS Date), 8723000.0000, N'563/93/47, LÊ VĂN KHƯƠNG, QUẬN 12', N'0333007630', 0, NULL, 1, 5)
INSERT [dbo].[Orders] ([orderID], [createdAt], [total], [shipAddress], [shipPhone], [discount], [comment], [userID], [statusID]) VALUES (18, CAST(N'2022-05-17' AS Date), 8270000.0000, N'563/93/47, LÊ VĂN KHƯƠNG, QUẬN 12', N'0333007630', 0, NULL, 1, 5)
INSERT [dbo].[Orders] ([orderID], [createdAt], [total], [shipAddress], [shipPhone], [discount], [comment], [userID], [statusID]) VALUES (19, CAST(N'2022-05-16' AS Date), 14250000.0000, N'563/93/47, LÊ VĂN KHƯƠNG, QUẬN 12', N'0333007630', 0, NULL, 1, 5)
INSERT [dbo].[Orders] ([orderID], [createdAt], [total], [shipAddress], [shipPhone], [discount], [comment], [userID], [statusID]) VALUES (20, CAST(N'2022-05-15' AS Date), 6550000.0000, N'Binh Chanh', N'0853300586', 0, NULL, 4, 1)
INSERT [dbo].[Orders] ([orderID], [createdAt], [total], [shipAddress], [shipPhone], [discount], [comment], [userID], [statusID]) VALUES (21, CAST(N'2022-05-15' AS Date), 189000.0000, N'Binh Chanh', N'0853300586', 0, NULL, 4, 5)
INSERT [dbo].[Orders] ([orderID], [createdAt], [total], [shipAddress], [shipPhone], [discount], [comment], [userID], [statusID]) VALUES (22, CAST(N'2022-05-15' AS Date), 1798000.0000, N'Binh Chanh', N'0853300586', 0, NULL, 4, 5)
INSERT [dbo].[Orders] ([orderID], [createdAt], [total], [shipAddress], [shipPhone], [discount], [comment], [userID], [statusID]) VALUES (23, CAST(N'2022-05-15' AS Date), 8550000.0000, N'Binh Chanh', N'0853300586', 0, NULL, 4, 3)
INSERT [dbo].[Orders] ([orderID], [createdAt], [total], [shipAddress], [shipPhone], [discount], [comment], [userID], [statusID]) VALUES (24, CAST(N'2022-05-15' AS Date), 2354000.0000, N'147/B PHAN ĐÌNH PHÙNG', N'0522561467', 0, NULL, 3, 4)
INSERT [dbo].[Orders] ([orderID], [createdAt], [total], [shipAddress], [shipPhone], [discount], [comment], [userID], [statusID]) VALUES (25, CAST(N'2022-05-15' AS Date), 5550000.0000, N'147/B PHAN ĐÌNH PHÙNG', N'0522561467', 0, NULL, 3, 5)
INSERT [dbo].[Orders] ([orderID], [createdAt], [total], [shipAddress], [shipPhone], [discount], [comment], [userID], [statusID]) VALUES (26, CAST(N'2022-05-15' AS Date), 1700000.0000, N'147/B PHAN ĐÌNH PHÙNG', N'0522561467', 0, NULL, 3, 5)
INSERT [dbo].[Orders] ([orderID], [createdAt], [total], [shipAddress], [shipPhone], [discount], [comment], [userID], [statusID]) VALUES (27, CAST(N'2022-05-15' AS Date), 850000.0000, N'147/B PHAN ĐÌNH PHÙNG', N'0522561467', 0, NULL, 3, 5)
INSERT [dbo].[Orders] ([orderID], [createdAt], [total], [shipAddress], [shipPhone], [discount], [comment], [userID], [statusID]) VALUES (28, CAST(N'2022-05-21' AS Date), 6000000.0000, N'147/B PHAN ĐÌNH PHÙNG', N'0522561467', 0, NULL, 3, 2)
INSERT [dbo].[Orders] ([orderID], [createdAt], [total], [shipAddress], [shipPhone], [discount], [comment], [userID], [statusID]) VALUES (29, CAST(N'2022-05-13' AS Date), 4500000.0000, N'147/B PHAN ĐÌNH PHÙNG', N'0522561467', 0, NULL, 3, 5)
INSERT [dbo].[Orders] ([orderID], [createdAt], [total], [shipAddress], [shipPhone], [discount], [comment], [userID], [statusID]) VALUES (30, CAST(N'2022-05-13' AS Date), 3000000.0000, N'147/B PHAN ĐÌNH PHÙNG', N'0522561467', 0, NULL, 3, 5)
INSERT [dbo].[Orders] ([orderID], [createdAt], [total], [shipAddress], [shipPhone], [discount], [comment], [userID], [statusID]) VALUES (31, CAST(N'2022-05-12' AS Date), 3879000.0000, N'147/B PHAN ĐÌNH PHÙNG', N'0522561467', 0, NULL, 3, 5)
INSERT [dbo].[Orders] ([orderID], [createdAt], [total], [shipAddress], [shipPhone], [discount], [comment], [userID], [statusID]) VALUES (32, CAST(N'2022-05-11' AS Date), 3700000.0000, N'147/B PHAN ĐÌNH PHÙNG', N'0522561467', 0, NULL, 3, 5)
INSERT [dbo].[Orders] ([orderID], [createdAt], [total], [shipAddress], [shipPhone], [discount], [comment], [userID], [statusID]) VALUES (33, CAST(N'2022-05-11' AS Date), 1200000.0000, N'Binh Chanh', N'0853300586', 0, NULL, 4, 5)
INSERT [dbo].[Orders] ([orderID], [createdAt], [total], [shipAddress], [shipPhone], [discount], [comment], [userID], [statusID]) VALUES (34, CAST(N'2022-05-12' AS Date), 2850000.0000, N'Binh Chanh', N'0853300586', 0, NULL, 4, 5)
INSERT [dbo].[Orders] ([orderID], [createdAt], [total], [shipAddress], [shipPhone], [discount], [comment], [userID], [statusID]) VALUES (35, CAST(N'2022-05-13' AS Date), 2400000.0000, N'Binh Chanh', N'0853300586', 0, NULL, 4, 5)
INSERT [dbo].[Orders] ([orderID], [createdAt], [total], [shipAddress], [shipPhone], [discount], [comment], [userID], [statusID]) VALUES (36, CAST(N'2022-05-13' AS Date), 2850000.0000, N'563/93/47, LÊ VĂN KHƯƠNG, QUẬN 12', N'0333007630', 0, NULL, 1, 5)
INSERT [dbo].[Orders] ([orderID], [createdAt], [total], [shipAddress], [shipPhone], [discount], [comment], [userID], [statusID]) VALUES (37, CAST(N'2022-05-12' AS Date), 1500000.0000, N'563/93/47, LÊ VĂN KHƯƠNG, QUẬN 12', N'0333007630', 0, NULL, 1, 5)
INSERT [dbo].[Orders] ([orderID], [createdAt], [total], [shipAddress], [shipPhone], [discount], [comment], [userID], [statusID]) VALUES (38, CAST(N'2022-05-11' AS Date), 3000000.0000, N'563/93/47, LÊ VĂN KHƯƠNG, QUẬN 12', N'0333007630', 0, NULL, 1, 5)
INSERT [dbo].[Orders] ([orderID], [createdAt], [total], [shipAddress], [shipPhone], [discount], [comment], [userID], [statusID]) VALUES (39, CAST(N'2022-05-21' AS Date), 15000000.0000, N'147/B PHAN ĐÌNH PHÙNG', N'0522561467', 0, NULL, 3, 2)
INSERT [dbo].[Orders] ([orderID], [createdAt], [total], [shipAddress], [shipPhone], [discount], [comment], [userID], [statusID]) VALUES (40, CAST(N'2022-05-14' AS Date), 15000000.0000, N'147/B PHAN ĐÌNH PHÙNG', N'0522561467', 0, NULL, 3, 5)
INSERT [dbo].[Orders] ([orderID], [createdAt], [total], [shipAddress], [shipPhone], [discount], [comment], [userID], [statusID]) VALUES (41, CAST(N'2022-05-20' AS Date), 28500000.0000, N'147/B PHAN ĐÌNH PHÙNG', N'0522561467', 0, NULL, 3, 5)
INSERT [dbo].[Orders] ([orderID], [createdAt], [total], [shipAddress], [shipPhone], [discount], [comment], [userID], [statusID]) VALUES (42, CAST(N'2022-05-20' AS Date), 850000.0000, N'Binh Chanh', N'0853300586', 0, NULL, 4, 5)
INSERT [dbo].[Orders] ([orderID], [createdAt], [total], [shipAddress], [shipPhone], [discount], [comment], [userID], [statusID]) VALUES (43, CAST(N'2022-05-21' AS Date), 204120.0000, N'147/B PHAN ĐÌNH PHÙNG', N'0522561467', 0, NULL, 3, 1)
INSERT [dbo].[Orders] ([orderID], [createdAt], [total], [shipAddress], [shipPhone], [discount], [comment], [userID], [statusID]) VALUES (44, CAST(N'2023-05-06' AS Date), 579960.0000, N'147/B PHAN ĐÌNH PHÙNG', N'0522561467', 0, NULL, 3, 1)
INSERT [dbo].[Orders] ([orderID], [createdAt], [total], [shipAddress], [shipPhone], [discount], [comment], [userID], [statusID]) VALUES (45, CAST(N'2023-05-10' AS Date), 145800.0000, N'147/B PHAN ĐÌNH PHÙNG', N'0522561467', 0, NULL, 3, 1)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([productID], [name], [price], [oldPrice], [detail], [description], [stock], [discount], [newProduct], [bestSaler], [categoryID]) VALUES (1, N'7 viên ngọc rồng mô hình Dragon Ball Super Saiyan Goku Battle Damage Version 12-Inch Limit Breaker Action Figure', 2500000.0000, 0.0000, N'Không có mô tả thêm', N'Người hâm mộ 7 viên ngọc rồng giờ đây có thể thỏa sức tưởng tượng những trận chiến trong bộ phim yêu thích. Mô hình Dragon Ball Super Limit Breaker Super Saiyan Goku Battle Damage có 5 điểm khớp. Nhân vật 7 viên ngọc rồng mô hình Dragon Ball Super Saiyan Goku của Bandai được xây dựng với phong cách ngoại hình tỉ mỉ và trang trí tuyệt vời, kết hợp chất lượng và khả năng linh hoạt mà người hâm mộ yêu thích.', 10, 0, 0, 0, 1)
INSERT [dbo].[Products] ([productID], [name], [price], [oldPrice], [detail], [description], [stock], [discount], [newProduct], [bestSaler], [categoryID]) VALUES (2, N'Búp bê Licca công chúa trong truyện cổ tích', 1500000.0000, 0.0000, N'Không có mô tả thêm', N'Gọi nàng là Licca công chúa trong truyện cổ tích bởi nàng  búp bê ở phiên bản này vận một bộ trang phục vô cùng quý phái và kiểu cách của các nàng công chúa trong một vương quốc cổ tích thần kì. Các fan nhí của truyện cổ tích sẽ vô cùng thích thú khi cô nàng Licca công chúa cổ tích này mặc một chiếc váy xòe rộng, vải xanh kẻ sóc trắng in nhiều hình vương miện và cả chiếc đồng hồ tròn bên trên.
Công chúa Licca còn đeo một chiếc nơ lớn trên đầu với màu sắc phù hợp với chiếc váy đang mặc. Chiếc túi đeo hình thỏ bông khiến cô trẻ trung và thật dịu dàng.Mái tóc xoăn nhẹ rất tự nhiên của nàng Licca công chúa cổ tích được cột gọn. Khuôn mặt thanh tú, đôi mắt to tròn thông minh là điểm nhấn đặc biệt cho vẻ đẹp ngoại hình của búp bê  Licca .
', 10, 0, 0, 0, 3)
INSERT [dbo].[Products] ([productID], [name], [price], [oldPrice], [detail], [description], [stock], [discount], [newProduct], [bestSaler], [categoryID]) VALUES (3, N'Ben 10 Omni-Enhanced XLR8 CN Playmates Cartoon 5-Inch', 2500000.0000, 0.0000, N'Không có mô tả thêm', N'Nhân vật hành động Omni-Enhanced XLR8 được tạo ra bởi công ty Giochi Preziosi của Ý. Bộ này đến từ loạt đồ chơi Ben 10 Omniverse. Đồ chơi được lấy cảm hứng từ loạt phim hoạt hình dành cho trẻ em có tên Ben 10, kể về cuộc phiêu lưu của cậu bé 10 tuổi Benjamin "Ben" Tennyson, người đã tìm ra một thiết bị giống đồng hồ độc đáo - Omnitrix. Thiết bị này giúp cậu bé có thể biến đổi thành nhiều loại người ngoài hành tinh và dưới những nhân vật này, cậu bé bảo vệ thế giới chống lại cái ác.', 10, 0, 0, 0, 1)
INSERT [dbo].[Products] ([productID], [name], [price], [oldPrice], [detail], [description], [stock], [discount], [newProduct], [bestSaler], [categoryID]) VALUES (4, N'Xe Cứu Hộ Biến Hình 2 Trong 1 Paw Patrol Flip & Fly Marshall 6037883', 2000000.0000, 0.0000, N'Không có mô tả thêm', N'Phóng to trên đất liền và bay lên không trung với Xe Cứu Hộ Biến Hình 2 Trong 1 Flip & Fly Marshall! Đặt phương tiện 2 trong 1 này ở chế độ xe cứu hỏa và trẻ em có thể tham gia cùng Marshall (hình bao gồm) khi anh ấy chạy đua để giải cứu! Đối với các cuộc phiêu lưu trên không, hãy sử dụng tay cầm để nâng và chuyển từ xe cứu hỏa thành máy bay phản lực! Khi bạn và Marshall đang lướt trên không, hãy sử dụng bệ phóng để phóng đĩa và vòi rồng di chuyển các vật thể và tiết kiệm một ngày! Với lòng dũng cảm, tình bạn và tinh thần đồng đội luôn được ghi nhớ, máy bay phản lực của Marshall đi kèm với móc cứu hộ để vớt chuột con gặp nguy hiểm và nâng chúng đến nơi an toàn! Thu thập Skye, Rubble và Chase để lắp ráp đồ chơi Paw Patrol của riêng bạn ở nhà! Đi thẳng vào cuộc phiêu lưu với Flip & Fly Marshall’s Transforming Vehicle!', 10, 0, 0, 0, 1)
INSERT [dbo].[Products] ([productID], [name], [price], [oldPrice], [detail], [description], [stock], [discount], [newProduct], [bestSaler], [categoryID]) VALUES (5, N'Bộ đồ chơi Ben 10 Micro Omnitrix Playset 2-IN-1 Omnitrix với Mô hình Micro World Playmates', 3000000.0000, 0.0000, N'Không có mô tả thêm', N'•	Đồ chơi trẻ em 4 tuổi trở lên
•	Hoạt hình Ben 10
•	Nhãn hiệu: Ben 10
•	Xuất xứ thương hiệu: Anh
Omnitrix 2 trong 1 mở ra để lộ Playset siêu nhỏ!
Khám phá hành tinh với vụ nổ nhiệt và đánh bại Người ngoài hành tinh xấu xa của Kevin 11! Một môi trường chơi vi mô hoàn chỉnh cho phép trẻ em tạo ra những cuộc phiêu lưu ngoài hành tinh của riêng mình!
', 10, 0, 0, 0, 1)
INSERT [dbo].[Products] ([productID], [name], [price], [oldPrice], [detail], [description], [stock], [discount], [newProduct], [bestSaler], [categoryID]) VALUES (6, N'Búp bê Licca LD-01 Daisuki Licca-chan Gift Set', 1000000.0000, 0.0000, N'Không có mô tả thêm', N'Độ tuổi sử dụng: Trên 3 tuổi,
Không sử dụng pin.
Sản xuất tại: Trung Quốc,
Gồm 1 búp bê Licca kèm phụ kiện
Set LD-01 Licca Gift Set bao gồm:
Búp bê Licca (với Váy, Đồ lót, Hoa tai, Băng đô) x1
Áo dài x1
Váy nhỏ x1
Giày (Giày có dây đeo) x1
Giày (Bơm) x1
Nghe Nhỏ gọn x1
Bàn chải tóc x1
Clip hoa hồng x2
Dây buộc tóc x1
Móc áo x2
', 10, 0, 0, 0, 3)
INSERT [dbo].[Products] ([productID], [name], [price], [oldPrice], [detail], [description], [stock], [discount], [newProduct], [bestSaler], [categoryID]) VALUES (7, N'Chó cứu hộ Paw Patrol giải cứu Marshall', 2500000.0000, 0.0000, N'Không có mô tả thêm', N'Khi một người bạn khủng long gặp khó khăn, chỉ cần nhấn nút huy hiệu của Marshall để bắt đầu hành động. Công cụ trên ba lô của anh ấy sẽ biến đổi và mở ra. Sau đó, đẩy đuôi khủng long ăn thịt lên và xuống để miệng của nó mở và đóng lại.
Bộ đồ chơi Chó cứu hộ Paw Patrol giải cứu Marshall bao gồm 2 phần: 1 Marshall, 1 Khủng long Velociraptor màu xanh lớn và 1 chú khủng long bí ẩn.
Bật mí cho bé: Mở gói để tiết lộ hình khủng long bất ngờ để sử dụng trong mọi nhiệm vụ giải cứu! Thu thập tất cả 6 Gói Pup và Dino (mỗi gói được bán riêng) và hợp tác để cứu khủng long.
', 10, 0, 0, 0, 1)
INSERT [dbo].[Products] ([productID], [name], [price], [oldPrice], [detail], [description], [stock], [discount], [newProduct], [bestSaler], [categoryID]) VALUES (8, N'Bandai Kamen Masked Rider Ex-Aid DX Gashakon Key Slasher', 2000000.0000, 0.0000, N'Không có mô tả thêm', N'Từ "Masked Rider Ex-Aid", "Double Gas DX Gasachon Key Slasher" được sử dụng bởi Masked Rider Ex-Aid Double Action Gamer xuất hiện! Chuyển sang chế độ lưỡi, chế độ súng và chế độ rìu 3 chế độ bằng cách nhấn 3 nút chỉnh chế độ 
Đòn tấn công đặc biệt!
Âm thanh chờ được kích hoạt bằng cách nhấn nút phím và nút chế độ! Một âm thanh tấn công đặc biệt được kích hoạt khi kéo cò.
Ngoài ra, bạn có thể đặt DX Mighty Action XX Gasshut (được bán riêng) thành di chuyển siêu đặc biệt và bạn có thể tải đồng thời hai tay đua Gasshut tùy chọn để kích hoạt Di chuyển đặc biệt.
', 10, 0, 0, 0, 1)
INSERT [dbo].[Products] ([productID], [name], [price], [oldPrice], [detail], [description], [stock], [discount], [newProduct], [bestSaler], [categoryID]) VALUES (9, N'Xe đạp dành cho búp bê Licca', 850000.0000, 0.0000, N'Không có mô tả thêm', N'Chiếc xe đạp búp bê này cũng có thể chở được thêm búp bê Miki và Maki vì giỏ xe phía trước và ghế xe phía sau đều là nơi có thể tận dụng. Khi đến góc, các bánh xe phía trước cũng có thể di chuyển theo đường cong để tạo độ uyển chuyển, linh hoạt cho búp bê Licca.', 10, 0, 1, 0, 3)
INSERT [dbo].[Products] ([productID], [name], [price], [oldPrice], [detail], [description], [stock], [discount], [newProduct], [bestSaler], [categoryID]) VALUES (10, N'Đường đua Đối đầu Thách thức Hot Wheels Turbo Race Mattel BGJ08 ', 1150000.0000, 0.0000, N'Không có mô tả thêm', N'
Đường đua Đối đầu Thách thức Hot Wheels Turbo Race Mattel BGJ08 gồm 2 đoạn đường đua song song, tốc độ cực cao, cảm giác cực mạnh. Hai chiếc xe đua Hot Wheels sẽ có một cuộc đối đầu khốc liệt đầy thách thức. Lá cờ sẽ phất lên ở cuối đường đua vinh danh người chiến thắng! Bộ đường đua Hot Wheels Turbo Race Set này cũng có thể tháo rời giúp bé sáng tạo nhiều kiểu đường đua khác nhau hoặc kết hợp với các bộ Hot Wheels Track Set khác (được bán riêng) để tiếp tục xây dựng cho mình cả một thế giới xe đua tuyệt vời nhất. Đồ chơi kèm theo 2 mô hình xe ô tô Hot Wheels tỷ lệ 1/64, phù hợp dành cho các bé trai từ 4 tuổi trở lên
', 10, 0, 0, 0, 1)
INSERT [dbo].[Products] ([productID], [name], [price], [oldPrice], [detail], [description], [stock], [discount], [newProduct], [bestSaler], [categoryID]) VALUES (11, N'Đồ chơi máy bay Tomica JASDF T-4 BLUE IMPULSE là mô hình 1/140', 2000000.0000, 0.0000, N'Không có mô tả thêm', N'Đồ chơi ra mắt trong dòng Tomica Premium toyline.
•	Kích thước: W78 x H41 x D39mm
•	Không sử dụng pin
•	Độ tuổi mục tiêu: từ 6 tuổi trở lên
•	Nhà sản xuất: Takara Tomy
', 10, 0, 0, 1, 1)
INSERT [dbo].[Products] ([productID], [name], [price], [oldPrice], [detail], [description], [stock], [discount], [newProduct], [bestSaler], [categoryID]) VALUES (12, N'Trang phục búp bê Licca Diamond Queen Rose Purple', 1200000.0000, 0.0000, N'Không có mô tả thêm', N'Bộ trang phục tuyệt đẹp được thiết kế với màu sắc tím và hồng nhẹ mang lại sự thanh cao cho búp bê Licca. Sản phẩm bao gồm một bộ váy áo, một chiếc nơ cài, một micro, và một đôi giày xinh xắn.
Trang phục búp bê Licca Diamond Queen Rose Purple thuộc thương hiệu đồ chơi cao cấp Takara Tomy, chật liệu làm vải áo mềm mại, nhẹ nhàng, không gây kích ứng da với bé.
Sản phẩm dành cho bé 3 tuổi trở lên
Kích thước: 21 x 26.5 x 2 cm 
', 10, 0, 1, 0, 3)
INSERT [dbo].[Products] ([productID], [name], [price], [oldPrice], [detail], [description], [stock], [discount], [newProduct], [bestSaler], [categoryID]) VALUES (13, N'Bộ Ania tháp Động vật trên đảo Mountain Island (tặng 1 sư tử đen)', 1000000.0000, 0.0000, N'Không có mô tả thêm', N'Sản phẩm của hãng Takara Tomy (Nhật Bản)
Mã vạch quốc tế: 4904810890607
Set sản phẩm bao gồm một mô hình núi với nhiều đường trượt, và 1 sư tử đen.
', 10, 0, 1, 0, 1)
INSERT [dbo].[Products] ([productID], [name], [price], [oldPrice], [detail], [description], [stock], [discount], [newProduct], [bestSaler], [categoryID]) VALUES (14, N'BANDAI Godzilla Movie Monster Series Godzilla 2019 Figure', 1200000.0000, 0.0000, N'Không có mô tả thêm', N'Mô hình nhân vật Godzilla 2019 xuất hiện từ loạt phim quái vật!
Phiên bản Hollywood của "Godzilla" xuất hiện trong "Godzilla King of Monsters" với sự hiện diện áp đảo và mô hình thực tế trong loạt phim quái vật!
Mô hình nhân vật bằng vinyl mềm với tổng chiều cao khoảng 16 cm.
◆ Kích thước: khoảng H160 × W80 × D275mm
◆ Độ tuổi mục tiêu: 3 tuổi trở lên
◆ Chất liệu sản phẩm: PVC
◆ Hãng sản xuất: Bandai
', 10, 0, 0, 1, 1)
INSERT [dbo].[Products] ([productID], [name], [price], [oldPrice], [detail], [description], [stock], [discount], [newProduct], [bestSaler], [categoryID]) VALUES (15, N'Đồ Chơi Khủng Long NATURE WORLD (6 mẫu)', 900000.0000, 0.0000, N'Không có mô tả thêm', N'là sản phẩm Nature World thuộc tập đoàn Simba Dickie Group của Đức. Chơi cùng các chú khủng long yêu thích của mình, bé không chỉ vui chơi thư giãn mà còn có thể học thêm về nhiều loài khủng long khác nhau.
Đặc biệt, chất liệu nhựa mềm an toàn với trẻ em, mô phỏng các loại khủng long thời tiền sử với độ chi tiết cao, các bé có thể thoải mái chơi mà không sợ đồ chơi mau hư.
Lưu ý: sản phẩm được giao theo mẫu ngẫu nhiên, không phụ thuộc vào chú thích khi đặt hàng.
', 10, 0, 0, 0, 1)
INSERT [dbo].[Products] ([productID], [name], [price], [oldPrice], [detail], [description], [stock], [discount], [newProduct], [bestSaler], [categoryID]) VALUES (16, N'Bộ đồ chơi Lego 31099 Máy Bay Cánh Quạt Propeller Plane Jet - Helicopter - Aeroplane', 850000.0000, 0.0000, N'Không có mô tả thêm', N'Khơi dậy sự sáng tạo và niềm yêu thích vui chơi của trẻ với Bộ đồ chơi Lego 31099 Máy Bay Cánh Quạt. Cất cánh và hạ cánh với chiếc máy bay đầy màu sắc, có cánh quạt quay và các đầu cánh có thể điều chỉnh được.
Trẻ em có được 3 trải nghiệm xây dựng và chơi khác nhau với Bộ đồ chơi Lego 31099 Máy Bay Cánh Quạt. Bé có thể chế tạo một chiếc máy bay cánh quạt, thành một chiếc máy bay phản lực hoặc một chiếc trực thăng đồ chơi có bệ hạ cánh. Các mô hình độc lập, đem lại các mô hình dành cho trẻ em 6 tuổi trở lên có độ chi tiết và thực tế cao.
', 10, 0, 0, 0, 2)
INSERT [dbo].[Products] ([productID], [name], [price], [oldPrice], [detail], [description], [stock], [discount], [newProduct], [bestSaler], [categoryID]) VALUES (17, N'203748000 Bộ Đồ Chơi Bãi Đỗ Xe DICKIE TOYS Parking Station', 850000.0000, 0.0000, N'Không có mô tả thêm', N'•	Xuất xứ thương hiệu: Đức
•	Kích thước sản phẩm: Cao 31 cm.
•	Chất liệu: Nhựa cao cấp
•	Độ tuổi: 3 tuổi trở lên.
•	Đồ chơi không dùng pin.', 10, 0, 0, 0, 1)
INSERT [dbo].[Products] ([productID], [name], [price], [oldPrice], [detail], [description], [stock], [discount], [newProduct], [bestSaler], [categoryID]) VALUES (18, N'Bộ lắp ráp Lego sáng tạo 2016-10702', 1850000.0000, 0.0000, N'Không có mô tả thêm', N'Nằm trong bộ chủ đề LEGO Classic, LEGO® Creative Building Set LEGO 10702 gồm 583 chi tiết, dành cho trẻ trên 4 tuổi, là món đồ chơi thú vị và hấp dẫn. Trẻ có thể sử dụng các viên gạch đầy màu sắc, cùng với sự sáng tạo và tư duy để hoàn thành các ngôi nhà với kiểu dáng đa dạng, chú chõ nhỏ, chú vẹt, xe ô tô, máy cassette, tàu thủy,... hoặc bất kỳ mô hình gì tùy theo sở thích và khả năng. Đặc biệt, bộ sản phẩm gồm các chi tiết đôi mắt, cánh cửa, bánh xe,... cho phép trẻ tạo nên các con vật, đồ vật ngộ nghĩnh, đáng yêu mà mình yêu ', 10, 0, 0, 0, 2)
INSERT [dbo].[Products] ([productID], [name], [price], [oldPrice], [detail], [description], [stock], [discount], [newProduct], [bestSaler], [categoryID]) VALUES (19, N'Bộ lego cho bé gái Duplo 10928 Tiệm Bánh Ngọt', 1500000.0000, 0.0000, N'Không có mô tả thêm', N'Tất cả trẻ em đều thích đến tiệm bánh! Sử dụng máy trộn bột và lò nướng trong Bộ lego cho bé gái Duplo 10928 Tiệm Bánh Ngọt để nướng bánh. Hãy thử một chiếc bánh ngon tại quán cà phê đầy màu sắc. Trẻ nấu ăn và phục vụ đồ ăn trong quán cà phê đồ chơi, sau đó lái xe tải để giao bánh nướng nhỏ!Bộ lego cho bé gái Duplo 10928 Tiệm Bánh Ngọt là món đồ chơi trẻ em cho bé 2 tuổi trở lên.', 10, 0, 1, 0, 2)
INSERT [dbo].[Products] ([productID], [name], [price], [oldPrice], [detail], [description], [stock], [discount], [newProduct], [bestSaler], [categoryID]) VALUES (20, N'Đồ chơi mô hình xe Ford F-150 Raptor 2017 1:24', 2000000.0000, 0.0000, N'Không có mô tả thêm', N'Xe được thiết kế như thật với những đường nét mô phỏng chi tiết theo đúng tỷ lệ 1:24 so với phiên bản xe thật, thân xe được sơn tĩnh điện một cách tinh tế theo quy trình tự động đảm bảo các tiêu chuẩn về chất lượng nghiêm ngặt của nhà sản xuất để tạo ra các sản phẩm hoàn hảo rất phù hợp để trưng bày ở phòng khách, phòng làm việc, showroom.. với kích cỡ nhỏ nhắn,vừa phải.
Mô hình này sẽ trở thành một món sưu tập thú vị trong BST của bạn. 
Chất liệu: Toàn bộ khung xe được đúc bằng kim loại nguyên khối, các chi tiết nội thất, lốp được làm từ cao su tự nhiên, các chi tiết ống xả và lưới tản nhiệt được xi bóng, các chi tiết kính chắn gió, đèn được làm từ Mica cao cấp. 
', 10, 0, 0, 1, 1)
INSERT [dbo].[Products] ([productID], [name], [price], [oldPrice], [detail], [description], [stock], [discount], [newProduct], [bestSaler], [categoryID]) VALUES (21, N'Đồ Chơi Trẻ Em Trạm Cứu Hộ Kèm Bộ Đàm Dickie Toys 203716015-038 ', 2500000.0000, 0.0000, N'Không có mô tả thêm', N'Cùng bé diễn tập một nhiệm vụ cứu hỏa với bộ đồ chơi Trạm Cứu Hỏa Kèm Bộ Đàm bạn nhé!
Có một cuộc gọi khẩn cấp đến trạm cứu hỏa, cứu hỏa!
Ngay lập tức, các anh hùng trẻ tuổi tại nhà ga sẽ bắt tay thực hiện ngay nhiệm vụ.
Bộ đồ chơi mô phỏng thực tế và chi tiết của trạm cứu hỏa thực sự giúp phát triển trí tưởng tượng của trẻ.
Các cửa trong nhà ga dễ dàng đóng mở, có tay cầm giúp bé dễ cầm nắm hơn. 
Thang cứu hỏa có thể mở rộng.
', 10, 0, 0, 0, 1)
INSERT [dbo].[Products] ([productID], [name], [price], [oldPrice], [detail], [description], [stock], [discount], [newProduct], [bestSaler], [categoryID]) VALUES (22, N'Bộ lắp ghép Lego duplo 10931 Xe Tải & Xe Xúc ', 2850000.0000, 0.0000, N'Không có mô tả thêm', N'Bộ lắp ghép Lego duplo 10931 bao gồm xe tải, máy xúc đẩy với máy đào xoay và một tảng đá đồ chơi mà bé có thể mở ra, ngoài ra còn có 2 nhân vật công nhân để trẻ có thể xây dựng các câu chuyện về công trường xây dựng. Bộ đồ chơi Bộ lắp ghép Lego duplo 10931 Xe Tải & Xe Xúc công trường với các phương tiện và công nhân là đồ chơi cho bé 2 tuổi trở lên phát triển các kỹ năng vận động', 10, 0, 0, 0, 2)
INSERT [dbo].[Products] ([productID], [name], [price], [oldPrice], [detail], [description], [stock], [discount], [newProduct], [bestSaler], [categoryID]) VALUES (23, N'Xếp khối thú xinh Mega Bloks DPY43', 1400000.0000, 0.0000, N'Không có mô tả thêm', N'Với bộ Xếp khối thú xinh Mega Bloks DPY43, bé sẽ trở nên ham mê với những khám phá mới khi được học cách lắp ghép những gia đình thú xinh. Những khối ghép đầy màu sắc này sẽ khiến bé được thỏa sức sáng tạo xây dựng những cặp động vật bố mẹ và con cái khác nhau, gồm có sư tử, voi, khỉ, và cá sấu. Bé có thể xây dựng được cả một vườn thú, một khu rừng khổng lồ khi bé ghép cặp và xếp khối thú với nhau, hay tạo ra những sinh vật ngộ nghĩnh nhất, rèn luyện khả năng vận động và tư duy giải quyết vấn đề.
 
Đồ chơi Xếp khối thú xinh Mega Bloks DPY43 giúp phát triển trí tưởng tượng của bé qua từng lần chơi mà không quá phức tạp. Bé sẽ học được sự khéo léo, tỉ mỉ, kiên nhẫn khi lắp ráp từng khối ghép, nhận dạng các loài động vật khác nhau.
', 10, 0, 0, 0, 2)
INSERT [dbo].[Products] ([productID], [name], [price], [oldPrice], [detail], [description], [stock], [discount], [newProduct], [bestSaler], [categoryID]) VALUES (24, N'Xếp khối phương tiện giao thông Mega Bloks CNH09 (Zoomin'' Vehicle)', 1200000.0000, 0.0000, N'Không có mô tả thêm', N'Bộ đồ chơi giúp bé phát triển trí tưởng tượng cũng như sự khéo léo tỉ mỉ trong lúc sáng tạo.
 
Các khối ghép của Xếp khối phương tiện giao thông Mega Bloks CNH09 được làm từ nhựa ABS nguyên sinh cao cấp, không độc hại, và không góc cạnh rất an toàn cho bé.
', 10, 0, 0, 0, 2)
INSERT [dbo].[Products] ([productID], [name], [price], [oldPrice], [detail], [description], [stock], [discount], [newProduct], [bestSaler], [categoryID]) VALUES (25, N'Disney Motors DM-31 Mickey Mouse Ambulance', 2500000.0000, 0.0000, N'Không có mô tả thêm', N'chiếc xe cứu thương trong hình dáng của chú chuột Mickey nổi tiếng khiến các bé cảm thấy thật quen thuộc.
 
Chuột Mickey (phát âm như Mích-ky) là nhân vật hoạt hình của điện ảnh Hoa Kỳ, là biểu tượng của hãng phim Walt Disney. Chú chuột đáng yêu này được họa sĩ Ub Iwerks tạo ra vào năm 1928 và được ông Walt Disney  lồng tiếng. Hãng phim Walt Disney ấn định ngày sinh của chú chuột này là ngày 18 tháng 11, thời điểm tung ra (năm 1928) bộ phim Tàu hơi nước Willie. 
', 10, 0, 1, 0, 1)
INSERT [dbo].[Products] ([productID], [name], [price], [oldPrice], [detail], [description], [stock], [discount], [newProduct], [bestSaler], [categoryID]) VALUES (26, N'Bộ búp bê làm tóc mellchan', 1000000.0000, 0.0000, N'Không có mô tả thêm', N'Độ tuổi mục tiêu: 3 tuổi trở lên
"Lena-chan" sành điệu với mái tóc dài mê thời trang
Bộ nội dung: Cơ thể Rena-chan (có quần), váy, áo khoác, giày buộc dây, tất, lược
Bạn có thể sử dụng quần áo của Mel-chan
Đi tắm với Mel
', 10, 0, 0, 0, 3)
INSERT [dbo].[Products] ([productID], [name], [price], [oldPrice], [detail], [description], [stock], [discount], [newProduct], [bestSaler], [categoryID]) VALUES (27, N'Đồ chơi Bandai DX Kirameidine', 1000000.0000, 0.0000, N'Không có mô tả thêm', N'[Made in japan] 
- Cam kết hàng chính hãng.
- Hàng mua trực tiếp từ Nhật.
- Hàng mới - nguyên box.
- Hỗ trợ inbox, tư vấn, xem ảnh thật .
- Hỗ trợ tìm ảnh mua hàng theo yêu cầu.
* Khách mua hàng vui lòng quay video unbox sản phẩm để shop hỗ trợ những vấn đề về sản phẩm, nếu khách không quay video unbox shop sẽ không giải quyết các vấn đề liên quan.
', 10, 0, 0, 0, 2)
INSERT [dbo].[Products] ([productID], [name], [price], [oldPrice], [detail], [description], [stock], [discount], [newProduct], [bestSaler], [categoryID]) VALUES (28, N'Búp bê LF-01 Tủ lạnh cho búp bê Licca', 1000000.0000, 0.0000, N'Không có mô tả thêm', N'LF-01 Tủ lạnh búp bê Licca được sản xuất bởi hãng Takara Tomy đến từ Nhật Bản. Hãng nổi tiếng với đến hơn 90 năm uy tín trong lĩnh vực đồ chơi cho trẻ em cao cấp, an toàn, chất lượng.
LF-01 Tủ lạnh búp bê Licca được làm từ chất liệu nhựa cao cấp với 5 ngăn chứa đồ vô cùng rộng rãi và hiện đại. Cánh cửa tủ có thể đóng mở dễ dàng, bên trong là rất nhiều các phụ kiện đồ ăn, nước uống. Các chi tiết cũng được làm từ nhựa, không chứa chất độc hại, đảm bảo an toàn cho trẻ nhỏ. Thiết kế vừa tầm nắm, không góc cạnh, rất thích hợp làm đồ chơi cho bé gái từ 3 tuổi trở lên.
', 10, 0, 0, 0, 3)
INSERT [dbo].[Products] ([productID], [name], [price], [oldPrice], [detail], [description], [stock], [discount], [newProduct], [bestSaler], [categoryID]) VALUES (29, N'Anh Em Husky Đạp Xe DF-15 Nakayoshi Cycling Set Husky Siblings Sylvanian Families', 1000000.0000, 0.0000, N'Không có mô tả thêm', N'•	Dành cho bé gái và bé trai từ 3 tuổi trở lên
•	Thương hiệu : Sylvanian Families
•	Vật liệu : nhựa
•	Kích thước LxWxH 7,9 x 2,2 x 6,7 inch
•	Cân nặng 500g', 10, 0, 0, 1, 3)
INSERT [dbo].[Products] ([productID], [name], [price], [oldPrice], [detail], [description], [stock], [discount], [newProduct], [bestSaler], [categoryID]) VALUES (30, N'Bộ đồ chơi giường tầng Epoch Everlasting Triple Baby Bunk Beds', 1500000.0000, 0.0000, N'Không có mô tả thêm', N'Ngôi nhà búp bê thu nhỏ, vở kịch và hình người Calico Critters là đồ chơi chất lượng cao. Có một bữa tiệc ngủ với Calico Critters! Giường Tầng Ba Trẻ Em là ba giường xếp chồng lên nhau phù hợp với kích thước của Calico Critters dành cho trẻ nhỏ. Bộ bao gồm ba giường, ba nệm với gối, ba chăn và hai thang. Sắp xếp các giường theo ba cách khác nhau bao gồm xếp chồng lên nhau, so le và riêng lẻ để có nhiều cách chơi hơn! Calico Critters là một loạt các nhân vật động vật độc đáo và đáng yêu với những ngôi nhà, đồ nội thất và phụ kiện duyên dáng và chi tiết đẹp mắt. Họ sống, làm việc và vui chơi ở một nơi bình dị và tuyệt vời có tên là Calico Village.', 10, 0, 0, 0, 3)
INSERT [dbo].[Products] ([productID], [name], [price], [oldPrice], [detail], [description], [stock], [discount], [newProduct], [bestSaler], [categoryID]) VALUES (31, N'Bộ Phòng Bếp Sylvanian Families EP-5341 Kitchen Play ', 2500000.0000, 0.0000, N'Không có mô tả thêm', N'Bộ đồ chơi có đầy đủ những thành phần nhà bếp phức tạp để bé sở hữu một căn bếp rộng rãi đầy đủ tiện nghi.
Bộ Phòng Bếp Sylvanian Families EP-5341 Kitchen Play bao gồm một cửa đôi, tủ lạnh ba ngăn, bộ nồi, bộ phận bồn rửa, dụng cụ nấu ăn, các nguyên liệu như Táo, Dưa chuột, ớt bột, Chai nhựa, Hộp sữa, Trứng, v.v. Tất cả các tiện ích đều giống như cuộc sống với các chi tiết phức tạp. Có ngăn đá trong tủ lạnh có đá xúc ra được. Bộ bàn ghế có các ngăn để đựng đồ dùng. Con bạn bây giờ có thể tổ chức tiệc trà và bữa trưa cho bạn bè.
Không bao gồm nhân vật.
', 10, 0, 0, 0, 3)
INSERT [dbo].[Products] ([productID], [name], [price], [oldPrice], [detail], [description], [stock], [discount], [newProduct], [bestSaler], [categoryID]) VALUES (32, N'Đồ chơi Gundam Lắp Ráp HGBD:R Gundam Build Divers Re: RISE Aegis Knight
Gundam
', 1500000.0000, 0.0000, N'Không có mô tả thêm', N'( ガ ン ダ ム シ リ ー ズ,  Gundam Series) được tạo ra bởi Yoshiyuki Tomino và Sunrise, nhượng quyền thương mại có các robot khổng lồ với tên "Gundam". Bắt đầu vào ngày 7/4/1979 với Mobile Suit Gundam, một sê-ri phim truyền hình anime giới thiệu những con robot khổng lồ trong bối cảnh quân phiệt. Sự nổi tiếng của bộ truyện và đồ chơi nhật đã tạo ra nhượng quyền thương mại bao gồm 50 phim truyền hình, phim và OVA cũng như manga, tiểu thuyết và trò chơi điện tử.
•	Đồ chơi trẻ em 8 tuổi trở lên
•	Hoạt hình Gundam
•	Nhà sản xuất: Bandai
•	Nhãn hiệu: Gundam
•	Xuất xứ thương hiệu: Nhật Bản
•	Kích cỡ: 32x20x8
•	Cân nặng: 400g', 10, 0, 0, 0, 2)
INSERT [dbo].[Products] ([productID], [name], [price], [oldPrice], [detail], [description], [stock], [discount], [newProduct], [bestSaler], [categoryID]) VALUES (33, N'Đồ chơi Lắp ráp Gundam MG 1/100 GUNDAM SANDROCK EW', 1500000.0000, 0.0000, N'Không có mô tả thêm', N'Gundam ( ガ ン ダ ム シ リ ー ズ,  Gundam Series) được tạo ra bởi Yoshiyuki Tomino và Sunrise, nhượng quyền thương mại có các robot khổng lồ với tên "Gundam". Sự nổi tiếng của bộ truyện và đồ chơi nhật đã tạo ra nhượng quyền thương mại bao gồm 50 phim truyền hình, phim và OVA cũng như manga, tiểu thuyết và trò chơi điện tử.
•	Đồ chơi trẻ em 8 tuổi trở lên
•	Nhà sản xuất: Bandai
•	Nhãn hiệu: Gundam
•	Xuất xứ thương hiệu: Nhật Bản
•	Kích cỡ: 32x20x11
•	Cân nặng: 600g', 10, 0, 0, 0, 2)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([roleID], [title], [description]) VALUES (1, N'ROLE_ADMIN', N'')
INSERT [dbo].[Roles] ([roleID], [title], [description]) VALUES (2, N'ROLE_CUSTOMER', N'')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Statuses] ON 

INSERT [dbo].[Statuses] ([statusID], [name], [description]) VALUES (1, N'Đang xử lý', NULL)
INSERT [dbo].[Statuses] ([statusID], [name], [description]) VALUES (2, N'Đang chuẩn bị hàng', NULL)
INSERT [dbo].[Statuses] ([statusID], [name], [description]) VALUES (3, N'Đang giao', NULL)
INSERT [dbo].[Statuses] ([statusID], [name], [description]) VALUES (4, N'Đã hủy', NULL)
INSERT [dbo].[Statuses] ([statusID], [name], [description]) VALUES (5, N'Giao thành công', NULL)
SET IDENTITY_INSERT [dbo].[Statuses] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([userID], [fullName], [address], [email], [phone], [accountID]) VALUES (1, N'NGUYỄN HẢI NAM', N'563/93/47, LÊ VĂN KHƯƠNG, QUẬN 12', N'hainamdev@gmail.com', N'0333007630', 1)
INSERT [dbo].[Users] ([userID], [fullName], [address], [email], [phone], [accountID]) VALUES (2, N'NGUYỄN THỊ LƯƠNG', N'13, NGUYỄN VĂN BẢO, QUẬN GÒ VẤP', N'luong@gmail.com', N'0399986559', 2)
INSERT [dbo].[Users] ([userID], [fullName], [address], [email], [phone], [accountID]) VALUES (3, N'NGUYEN QUY KHA', N'147/B PHAN ĐÌNH PHÙNG', N'nguyenquykha092@gmail.com', N'0522561467', 3)
INSERT [dbo].[Users] ([userID], [fullName], [address], [email], [phone], [accountID]) VALUES (4, N'Nguyễn Nhật Quang', N'Binh Chanh', N'nhatquang@gmail.com', N'0853300586', 4)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Accounts] ADD  DEFAULT ((1)) FOR [enabled]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT (N'') FOR [description]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (N'') FOR [comment]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [price]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [oldPrice]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (N'') FOR [detail]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (N'') FOR [description]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [stock]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [discount]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [newProduct]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [bestSaler]
GO
ALTER TABLE [dbo].[Roles] ADD  DEFAULT (N'') FOR [description]
GO
ALTER TABLE [dbo].[Statuses] ADD  DEFAULT (N'') FOR [description]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (N'') FOR [fullName]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (N'') FOR [address]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (N'') FOR [email]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Account_Roles] FOREIGN KEY([roleID])
REFERENCES [dbo].[Roles] ([roleID])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Account_Roles]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_Products] FOREIGN KEY([productID])
REFERENCES [dbo].[Products] ([productID])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_Products]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_Users] FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_Users]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Products] FOREIGN KEY([productID])
REFERENCES [dbo].[Products] ([productID])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Products]
GO
ALTER TABLE [dbo].[Images]  WITH CHECK ADD  CONSTRAINT [FK_Images_Products] FOREIGN KEY([productID])
REFERENCES [dbo].[Products] ([productID])
GO
ALTER TABLE [dbo].[Images] CHECK CONSTRAINT [FK_Images_Products]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Order_Detail_Orders] FOREIGN KEY([orderID])
REFERENCES [dbo].[Orders] ([orderID])
GO
ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [FK_Order_Detail_Orders]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Order_Detail_Products] FOREIGN KEY([productID])
REFERENCES [dbo].[Products] ([productID])
GO
ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [FK_Order_Detail_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Statuses] FOREIGN KEY([statusID])
REFERENCES [dbo].[Statuses] ([statusID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Statuses]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([categoryID])
REFERENCES [dbo].[Categories] ([categoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Account] FOREIGN KEY([accountID])
REFERENCES [dbo].[Accounts] ([accountID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Account]
GO
