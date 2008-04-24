SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Role]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Role](
	[RoleId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Category]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ParentId] [int] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [category_name_unique] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Image]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Image](
	[ImageId] [int] IDENTITY(1,1) NOT NULL,
	[FileName] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[ImageId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Country]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Country](
	[CountryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Position] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](250) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[RoleId] [int] NOT NULL,
	[IsEnabled] [bit] NOT NULL,
	[Timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [user_email_unique] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Product]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Description] [text] NOT NULL,
	[Price] [money] NOT NULL,
	[Position] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [product_name_unique] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductImage]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProductImage](
	[ProductImageId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[ImageId] [int] NOT NULL,
 CONSTRAINT [PK_ProductImage] PRIMARY KEY CLUSTERED 
(
	[ProductImageId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [productImage_productId_imageId_unique] UNIQUE NONCLUSTERED 
(
	[ProductId] ASC,
	[ImageId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Order]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OrderItem]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OrderItem](
	[OrderItemId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[SizeId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderItem] PRIMARY KEY CLUSTERED 
(
	[OrderItemId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Size]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Size](
	[SizeId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[IsInStock] [bit] NOT NULL,
 CONSTRAINT [PK_Size] PRIMARY KEY CLUSTERED 
(
	[SizeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Category_Category]') AND parent_object_id = OBJECT_ID(N'[dbo].[Category]'))
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_Category] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_Category]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_Role]') AND parent_object_id = OBJECT_ID(N'[dbo].[User]'))
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_Category]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductImage_Image]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductImage]'))
ALTER TABLE [dbo].[ProductImage]  WITH CHECK ADD  CONSTRAINT [FK_ProductImage_Image] FOREIGN KEY([ImageId])
REFERENCES [dbo].[Image] ([ImageId])
GO
ALTER TABLE [dbo].[ProductImage] CHECK CONSTRAINT [FK_ProductImage_Image]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductImage_Product]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductImage]'))
ALTER TABLE [dbo].[ProductImage]  WITH CHECK ADD  CONSTRAINT [FK_ProductImage_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[ProductImage] CHECK CONSTRAINT [FK_ProductImage_Product]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Order_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[Order]'))
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OrderItem_Order]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrderItem]'))
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderItem_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK_OrderItem_Order]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OrderItem_Size]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrderItem]'))
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderItem_Size] FOREIGN KEY([SizeId])
REFERENCES [dbo].[Size] ([SizeId])
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK_OrderItem_Size]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Size_Product]') AND parent_object_id = OBJECT_ID(N'[dbo].[Size]'))
ALTER TABLE [dbo].[Size]  WITH CHECK ADD  CONSTRAINT [FK_Size_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[Size] CHECK CONSTRAINT [FK_Size_Product]
GO
