USE [ASSGN_PRJ_Ban_Hang_Web2_Ban_Dien_Thoai]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/7/2024 11:38:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[account_id] [int] IDENTITY(1,1) NOT NULL,
	[account_name] [varchar](255) NULL,
	[password] [varchar](255) NULL,
	[customer_name] [nvarchar](50) NULL,
	[phone] [varchar](10) NULL,
	[address] [nvarchar](255) NULL,
	[email] [varchar](255) NULL,
	[role_id] [int] NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 3/7/2024 11:38:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[account_id] [int] NULL,
	[product_id] [int] NULL,
	[ammount] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/7/2024 11:38:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 3/7/2024 11:38:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[order_date] [date] NULL,
	[account_id] [int] NULL,
	[total] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 3/7/2024 11:38:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NULL,
	[price] [money] NULL,
 CONSTRAINT [PK_LineItem] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/7/2024 11:38:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [nvarchar](50) NULL,
	[list_price] [money] NULL,
	[category_id] [int] NULL,
	[img] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 3/7/2024 11:38:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([account_id], [account_name], [password], [customer_name], [phone], [address], [email], [role_id], [status]) VALUES (1, N'ManhNK', N'1234567', N'Nguyễn KHánh MẠnh', N'0123456789', N'Hà Nội', N'a@gmail.com', 1, 1)
INSERT [dbo].[Account] ([account_id], [account_name], [password], [customer_name], [phone], [address], [email], [role_id], [status]) VALUES (2, N'MinhNT', N'123456', N'Nguyễn Thành Minh', N'0123456789', N'Hà Nội', N'abcxyz2@gmail.com', 1, 1)
INSERT [dbo].[Account] ([account_id], [account_name], [password], [customer_name], [phone], [address], [email], [role_id], [status]) VALUES (3, N'MaiNT', N'123456', N'Nguyễn Thị Mai', N'0123456789', N'Hà Nội', N'abcxyz3@gmail.com', 1, 1)
INSERT [dbo].[Account] ([account_id], [account_name], [password], [customer_name], [phone], [address], [email], [role_id], [status]) VALUES (4, N'AnNB', N'123456', N'Nguyễn Bảo An', N'0123456789', N'Hà Nội', N'abcxyz4@gmail.com', 1, 1)
INSERT [dbo].[Account] ([account_id], [account_name], [password], [customer_name], [phone], [address], [email], [role_id], [status]) VALUES (5, N'AnND', N'123456', N'Nguyễn Duy An', N'0123456789', N'Hà Nội', N'abcxyz5@gmail.com', 1, 1)
INSERT [dbo].[Account] ([account_id], [account_name], [password], [customer_name], [phone], [address], [email], [role_id], [status]) VALUES (6, N'AnNB', N'123456', N'Nguyễn Bình An', N'0123456789', N'Hà Nội', N'abcxyz6@gmail.com', 1, 1)
INSERT [dbo].[Account] ([account_id], [account_name], [password], [customer_name], [phone], [address], [email], [role_id], [status]) VALUES (7, N'NamLM', N'123456', N'Lê Mạnh Nam', N'0123456789', N'Hà Nội', N'abcxyz7@gmail.com', 1, 1)
INSERT [dbo].[Account] ([account_id], [account_name], [password], [customer_name], [phone], [address], [email], [role_id], [status]) VALUES (8, N'HaiLT', N'123456', N'Lê Tú Hải', N'0123456789', N'Hà Nội', N'abcxyz8@gmail.com', 1, 1)
INSERT [dbo].[Account] ([account_id], [account_name], [password], [customer_name], [phone], [address], [email], [role_id], [status]) VALUES (9, N'MinhLV', N'123456', N'Lê Vũ Minh', N'0123456789', N'Hà Nội', N'abcxyz9@gmail.com', 1, 1)
INSERT [dbo].[Account] ([account_id], [account_name], [password], [customer_name], [phone], [address], [email], [role_id], [status]) VALUES (10, N'HanDT', N'123456', N'Đặng Thành Hân', N'0123456789', N'Hà Nội', N'abcxyz10@gmail.com', 1, 1)
INSERT [dbo].[Account] ([account_id], [account_name], [password], [customer_name], [phone], [address], [email], [role_id], [status]) VALUES (13, N'manager1', N'123456', NULL, NULL, NULL, N'admin@gmail.com', 2, 1)
INSERT [dbo].[Account] ([account_id], [account_name], [password], [customer_name], [phone], [address], [email], [role_id], [status]) VALUES (14, N'manager2', N'123456', NULL, NULL, NULL, N'abcxyz12@gmail.com', 2, 1)
INSERT [dbo].[Account] ([account_id], [account_name], [password], [customer_name], [phone], [address], [email], [role_id], [status]) VALUES (15, N'manager3', N'123456', NULL, NULL, NULL, N'abcxyz13@gmail.com', 2, 1)
INSERT [dbo].[Account] ([account_id], [account_name], [password], [customer_name], [phone], [address], [email], [role_id], [status]) VALUES (16, N'admin1', N'123456', NULL, NULL, NULL, N'c@gmail.com', 3, 1)
INSERT [dbo].[Account] ([account_id], [account_name], [password], [customer_name], [phone], [address], [email], [role_id], [status]) VALUES (17, N'admin2', N'123456', NULL, NULL, NULL, N'abcxyz15@gmail.com', 3, 1)
INSERT [dbo].[Account] ([account_id], [account_name], [password], [customer_name], [phone], [address], [email], [role_id], [status]) VALUES (21, N'addaccount', N'12345', N'Thành', N'0365879260', N'23', N'abcxyz@gmail.com', 1, 1)
INSERT [dbo].[Account] ([account_id], [account_name], [password], [customer_name], [phone], [address], [email], [role_id], [status]) VALUES (22, N'manh', N'123456', N'khanh manh', N'0375801453', N'lâm thao-phú tho', N'b@gmail.com', 1, 1)
INSERT [dbo].[Account] ([account_id], [account_name], [password], [customer_name], [phone], [address], [email], [role_id], [status]) VALUES (24, N'manh', N'123456', N'khanh manh', N'1232456576', N'lâm thao-phú tho', N'd@gmail.com', 1, NULL)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (1, N'APPLE')
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (2, N'APPLE')
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (3, N'VIVO')
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (4, N'VIVO')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([order_id], [order_date], [account_id], [total]) VALUES (1, CAST(N'2023-03-09' AS Date), 1, 150000)
INSERT [dbo].[Order] ([order_id], [order_date], [account_id], [total]) VALUES (2, CAST(N'2023-03-09' AS Date), 1, 150000)
INSERT [dbo].[Order] ([order_id], [order_date], [account_id], [total]) VALUES (3, CAST(N'2023-03-09' AS Date), 1, 150000)
INSERT [dbo].[Order] ([order_id], [order_date], [account_id], [total]) VALUES (4, CAST(N'2023-03-09' AS Date), 1, 150000)
INSERT [dbo].[Order] ([order_id], [order_date], [account_id], [total]) VALUES (5, CAST(N'2023-03-09' AS Date), 1, 150000)
INSERT [dbo].[Order] ([order_id], [order_date], [account_id], [total]) VALUES (6, CAST(N'2023-03-09' AS Date), 1, 150000)
INSERT [dbo].[Order] ([order_id], [order_date], [account_id], [total]) VALUES (7, CAST(N'2023-03-09' AS Date), 1, 150000)
INSERT [dbo].[Order] ([order_id], [order_date], [account_id], [total]) VALUES (8, CAST(N'2023-03-09' AS Date), 1, 300000)
INSERT [dbo].[Order] ([order_id], [order_date], [account_id], [total]) VALUES (9, CAST(N'2023-03-09' AS Date), 1, 150000)
INSERT [dbo].[Order] ([order_id], [order_date], [account_id], [total]) VALUES (10, CAST(N'2023-03-09' AS Date), 1, 300000)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [quantity], [price]) VALUES (1, 1, 1, 150000.0000)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [quantity], [price]) VALUES (1, 2, 1, 150000.0000)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [quantity], [price]) VALUES (9, 2, 1, 150000.0000)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [quantity], [price]) VALUES (10, 2, 1, 150000.0000)
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([product_id], [product_name], [list_price], [category_id], [img]) VALUES (1, N'iPhone 12', 15000000.0000, 1, N'https://cdn.xtmobile.vn/vnt_upload/product/06_2023/thumbs/600_iphone_12_pro_pacific_blue_xtmobile_5.jpg')
INSERT [dbo].[Product] ([product_id], [product_name], [list_price], [category_id], [img]) VALUES (2, N'iPhone SE (2020)', 15000000.0000, 1, N'https://cdn.tgdd.vn/Products/Images/42/149456/iphone-se-2020-red-600x600.jpg')
INSERT [dbo].[Product] ([product_id], [product_name], [list_price], [category_id], [img]) VALUES (3, N'iPhone 11 Pro', 15000000.0000, 1, N'https://product.hstatic.net/200000144777/product/ip11prm_3_a15a192b64394ae1bc42b9ee7a0f3522_master.png')
INSERT [dbo].[Product] ([product_id], [product_name], [list_price], [category_id], [img]) VALUES (4, N'iPhone X', 15000000.0000, 1, N'https://cdn.tgdd.vn/Products/Images/42/114115/iphone-x-64gb-hh-600x600.jpg')
INSERT [dbo].[Product] ([product_id], [product_name], [list_price], [category_id], [img]) VALUES (8, N'Samsung Galaxy S21 Ultra', 35000000.0000, 2, N'https://cdn.tgdd.vn/Products/Images/42/226316/samsung-galaxy-s21-ultra-bac-600x600-1-200x200.jpg')
INSERT [dbo].[Product] ([product_id], [product_name], [list_price], [category_id], [img]) VALUES (9, N'Samsung Galaxy Note 20 Ultra', 35000000.0000, 2, N'https://cdn.tgdd.vn/Products/Images/42/220522/samsung-galaxy-note-20-ultra-vangdong-600x600-600x600.jpg')
INSERT [dbo].[Product] ([product_id], [product_name], [list_price], [category_id], [img]) VALUES (10, N'Samsung Galaxy Z Fold 3', 35000000.0000, 2, N'https://cdn.xtmobile.vn/vnt_upload/product/Hinh_DT/SamSung/thumbs/(600x600)_crop_galaxy-z-fold-3-5g-xtmobile.jpg')
INSERT [dbo].[Product] ([product_id], [product_name], [list_price], [category_id], [img]) VALUES (11, N'Samsung Galaxy S20 FE', 35000000.0000, 2, N'https://cdn.tgdd.vn/Products/Images/42/224859/samsung-galaxy-s20-fan-edition-xanh-la-thumbnew-600x600.jpeg')
INSERT [dbo].[Product] ([product_id], [product_name], [list_price], [category_id], [img]) VALUES (15, N'Vivo X60 Pro+', 50000000.0000, 3, N'https://cdn.tgdd.vn/Products/Images/42/232104/Vivo-x60-Pro-Plus--600x600.jpg')
INSERT [dbo].[Product] ([product_id], [product_name], [list_price], [category_id], [img]) VALUES (16, N'Vivo V21 5G', 50000000.0000, 3, N'https://cdn11.dienmaycholon.vn/filewebdmclnew/DMCL21/Picture//Apro/Apro_product_26479/v21-5g8gb128gb-_multi_2_957_450.png.webp')
INSERT [dbo].[Product] ([product_id], [product_name], [list_price], [category_id], [img]) VALUES (17, N'Vivo Y73', 50000000.0000, 3, N'https://cdn.tgdd.vn/Products/Images/42/241348/vivo-y73-2021-1-600x600.jpg')
INSERT [dbo].[Product] ([product_id], [product_name], [list_price], [category_id], [img]) VALUES (18, N'Vivo X50 Pro', 50000000.0000, 3, N'https://asia-exstatic-vivofs.vivo.com/PSee2l50xoirPK7y/1595385977372/0c33091c300449b7ffe0d6225a98684c.png')
INSERT [dbo].[Product] ([product_id], [product_name], [list_price], [category_id], [img]) VALUES (19, N'Vivo Y20s', 50000000.0000, 3, N'https://asia-exstatic-vivofs.vivo.com/PSee2l50xoirPK7y/1595385977372/0c33091c300449b7ffe0d6225a98684c.png')
INSERT [dbo].[Product] ([product_id], [product_name], [list_price], [category_id], [img]) VALUES (20, N'Vivo V21 5G', 50000000.0000, 3, N'https://cdn11.dienmaycholon.vn/filewebdmclnew/DMCL21/Picture//Apro/Apro_product_26479/v21-5g8gb128gb-_multi_2_957_450.png.webp')
INSERT [dbo].[Product] ([product_id], [product_name], [list_price], [category_id], [img]) VALUES (21, N'OPPO Reno6 Pro+', 30000000.0000, 4, N'https://cdn.tgdd.vn/Products/Images/42/236187/oppo-reno6-pro-grey-600x600.jpg')
INSERT [dbo].[Product] ([product_id], [product_name], [list_price], [category_id], [img]) VALUES (22, N'OPPO Find X3 Pro', 30000000.0000, 4, N'https://cdn.tgdd.vn/Products/Images/42/232190/oppo-find-x3-pro-black-001-1-600x600.jpg')
INSERT [dbo].[Product] ([product_id], [product_name], [list_price], [category_id], [img]) VALUES (23, N'OPPO F19 Pro+', 30000000.0000, 4, N'https://cdn.tgdd.vn/Products/Images/42/235310/oppo-f19-pro-plus-600x600-600x600.jpg')
INSERT [dbo].[Product] ([product_id], [product_name], [list_price], [category_id], [img]) VALUES (24, N'OPPO A53', 30000000.0000, 4, N'https://cdn.tgdd.vn/Products/Images/42/227295/oppo-a53-2020-xanh-600x600.jpg')
INSERT [dbo].[Product] ([product_id], [product_name], [list_price], [category_id], [img]) VALUES (25, N'OPPO Reno6 Pro+', 30000000.0000, 4, N'https://cdn.tgdd.vn/Products/Images/42/236187/oppo-reno6-pro-grey-600x600.jpg')
INSERT [dbo].[Product] ([product_id], [product_name], [list_price], [category_id], [img]) VALUES (26, N'OPPO A53', 30000000.0000, 4, N'https://cdn.tgdd.vn/Products/Images/42/227295/oppo-a53-2020-xanh-600x600.jpg')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (1, N'customer')
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (2, N'manager')
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (3, N'admin')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Account__AB6E616418D422D6]    Script Date: 3/7/2024 11:38:31 AM ******/
ALTER TABLE [dbo].[Account] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Account__AB6E61642054C2CC]    Script Date: 3/7/2024 11:38:31 AM ******/
ALTER TABLE [dbo].[Account] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Account__AB6E61645F3514C5]    Script Date: 3/7/2024 11:38:31 AM ******/
ALTER TABLE [dbo].[Account] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT ((1)) FOR [role_id]
GO
ALTER TABLE [dbo].[Cart] ADD  DEFAULT ((1)) FOR [ammount]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  DEFAULT ((1)) FOR [quantity]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ('https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg?20200913095930') FOR [img]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([role_id])
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([role_id])
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([role_id])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([account_id])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([account_id])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([account_id])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([account_id])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([account_id])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([account_id])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Order] ([order_id])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Order] ([order_id])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Order] ([order_id])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([category_id])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([category_id])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([category_id])
GO
