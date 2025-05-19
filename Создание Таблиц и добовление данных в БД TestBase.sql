USE TestBase
/****** Object:  Table [dbo].[inventory]    Script Date: 29.04.2025 16:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inventory](
	[id] [varchar](50) NULL,
	[book_id] [varchar](50) NULL,
	[condition] [varchar](50) NULL,
	[location] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[librarians]    Script Date: 29.04.2025 16:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[librarians](
	[id] [varchar](50) NULL,
	[full_name] [varchar](50) NULL,
	[position] [varchar](50) NULL,
	[phone] [varchar](50) NULL,
	[email] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material_type]    Script Date: 29.04.2025 16:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material_type](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[������� ����� ��������� ] [float] NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Material_type] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partners]    Script Date: 29.04.2025 16:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partners](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[��� ��������] [nvarchar](255) NULL,
	[������������ ��������] [nvarchar](255) NULL,
	[��������] [nvarchar](255) NULL,
	[����������� ����� ��������] [nvarchar](255) NULL,
	[������� ��������] [nvarchar](255) NULL,
	[����������� ����� ��������] [nvarchar](255) NULL,
	[���] [float] NULL,
	[�������] [float] NULL,
 CONSTRAINT [PK_Partners] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partners_product]    Script Date: 29.04.2025 16:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partners_product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID Product] [int] NOT NULL,
	[ID Partner] [int] NOT NULL,
	[���������� ���������] [float] NULL,
	[���� �������] [datetime] NULL,
 CONSTRAINT [PK_Partners_product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 29.04.2025 16:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID Type] [int] NULL,
	[������������ ���������] [nvarchar](255) NULL,
	[�������] [float] NULL,
	[����������� ��������� ��� ��������] [float] NULL,
	[ID_material] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_type]    Script Date: 29.04.2025 16:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_type](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[��������] [nvarchar](255) NULL,
	[����������� ���� ���������] [float] NULL,
 CONSTRAINT [PK_Product_type] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[inventory] ([id], [book_id], [condition], [location]) VALUES (N'1', N'1', N'Хорошее', N'Стеллаж 1')
INSERT [dbo].[inventory] ([id], [book_id], [condition], [location]) VALUES (N'2', N'2', N'Удовлетворительное', N'Стеллаж 2')
INSERT [dbo].[inventory] ([id], [book_id], [condition], [location]) VALUES (N'3', N'3', N'Новое', N'Стеллаж 3')
GO
SET IDENTITY_INSERT [dbo].[Material_type] ON 

INSERT [dbo].[Material_type] ([ID], [������� ����� ��������� ], [Name]) VALUES (1, 0.001, N'�����')
INSERT [dbo].[Material_type] ([ID], [������� ����� ��������� ], [Name]) VALUES (2, 0.0095, N'���')
INSERT [dbo].[Material_type] ([ID], [������� ����� ��������� ], [Name]) VALUES (3, 0.0028, N'������')
INSERT [dbo].[Material_type] ([ID], [������� ����� ��������� ], [Name]) VALUES (4, 0.0055, N'���')
INSERT [dbo].[Material_type] ([ID], [������� ����� ��������� ], [Name]) VALUES (5, 0.0034, N'�����')
SET IDENTITY_INSERT [dbo].[Material_type] OFF
GO
SET IDENTITY_INSERT [dbo].[Partners] ON 

INSERT [dbo].[Partners] ([ID], [��� ��������], [������������ ��������], [��������], [����������� ����� ��������], [������� ��������], [����������� ����� ��������], [���], [�������]) VALUES (1, N'���', N'���� ���������', N'������� ���������� ��������', N'aleksandraivanova@ml.ru', N'493 123 45 67', N'652050, ����������� �������, ����� ����, ��. ������, 15', 2222455179, 7)
INSERT [dbo].[Partners] ([ID], [��� ��������], [������������ ��������], [��������], [����������� ����� ��������], [������� ��������], [����������� ����� ��������], [���], [�������]) VALUES (2, N'���', N'������ 29', N'������ ������� ��������', N'vppetrov@vl.ru', N'987 123 56 66', N'164500, ������������� �������, ����� ������������, ��. ����������, 18', 3333888520, 7)
INSERT [dbo].[Partners] ([ID], [��� ��������], [������������ ��������], [��������], [����������� ����� ��������], [������� ��������], [����������� ����� ��������], [���], [�������]) VALUES (3, N'���', N'�����������', N'�������� ������ ����������', N'ansolovev@st.ru', N'812 223 32 00', N'188910, ������������� �������, ����� ��������, ��. ��������, 21', 4440391035, 7)
INSERT [dbo].[Partners] ([ID], [��� ��������], [������������ ��������], [��������], [����������� ����� ��������], [������� ��������], [����������� ����� ��������], [���], [�������]) VALUES (4, N'���', N'������ � �������', N'��������� ��������� ����������', N'ekaterina.vorobeva@ml.ru', N'444 222 33 11', N'143960, ���������� �������, ����� ������, ��. �������, 51', 1111520857, 5)
INSERT [dbo].[Partners] ([ID], [��� ��������], [������������ ��������], [��������], [����������� ����� ��������], [������� ��������], [����������� ����� ��������], [���], [�������]) VALUES (5, N'���', N'���������', N'�������� ������ ���������', N'stepanov@stepan.ru', N'912 888 33 33', N'309500, ������������ �������, ����� ������ �����, ��. �������, 122', 5552431140, 10)
INSERT [dbo].[Partners] ([ID], [��� ��������], [������������ ��������], [��������], [����������� ����� ��������], [������� ��������], [����������� ����� ��������], [���], [�������]) VALUES (6, N'���', N'sdfsdfds', N'dsdfasf', N'sdfsdf', N'sdfsdf', N'sdfsdf', -2, 0)
SET IDENTITY_INSERT [dbo].[Partners] OFF
GO
SET IDENTITY_INSERT [dbo].[Partners_product] ON 

INSERT [dbo].[Partners_product] ([ID], [ID Product], [ID Partner], [���������� ���������], [���� �������]) VALUES (1, 1, 1, 15500, CAST(N'2023-03-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Partners_product] ([ID], [ID Product], [ID Partner], [���������� ���������], [���� �������]) VALUES (2, 3, 1, 12350, CAST(N'2023-12-18T00:00:00.000' AS DateTime))
INSERT [dbo].[Partners_product] ([ID], [ID Product], [ID Partner], [���������� ���������], [���� �������]) VALUES (3, 4, 1, 37400, CAST(N'2024-06-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Partners_product] ([ID], [ID Product], [ID Partner], [���������� ���������], [���� �������]) VALUES (4, 2, 2, 35000, CAST(N'2022-12-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Partners_product] ([ID], [ID Product], [ID Partner], [���������� ���������], [���� �������]) VALUES (5, 5, 2, 1250, CAST(N'2023-05-17T00:00:00.000' AS DateTime))
INSERT [dbo].[Partners_product] ([ID], [ID Product], [ID Partner], [���������� ���������], [���� �������]) VALUES (6, 3, 2, 1000, CAST(N'2024-06-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Partners_product] ([ID], [ID Product], [ID Partner], [���������� ���������], [���� �������]) VALUES (7, 1, 2, 7550, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Partners_product] ([ID], [ID Product], [ID Partner], [���������� ���������], [���� �������]) VALUES (8, 1, 3, 7250, CAST(N'2023-01-22T00:00:00.000' AS DateTime))
INSERT [dbo].[Partners_product] ([ID], [ID Product], [ID Partner], [���������� ���������], [���� �������]) VALUES (9, 2, 3, 2500, CAST(N'2024-07-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Partners_product] ([ID], [ID Product], [ID Partner], [���������� ���������], [���� �������]) VALUES (10, 4, 4, 59050, CAST(N'2023-03-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Partners_product] ([ID], [ID Product], [ID Partner], [���������� ���������], [���� �������]) VALUES (11, 3, 4, 37200, CAST(N'2024-03-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Partners_product] ([ID], [ID Product], [ID Partner], [���������� ���������], [���� �������]) VALUES (12, 5, 4, 4500, CAST(N'2024-05-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Partners_product] ([ID], [ID Product], [ID Partner], [���������� ���������], [���� �������]) VALUES (13, 3, 5, 50000, CAST(N'2023-09-19T00:00:00.000' AS DateTime))
INSERT [dbo].[Partners_product] ([ID], [ID Product], [ID Partner], [���������� ���������], [���� �������]) VALUES (14, 4, 5, 670000, CAST(N'2023-11-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Partners_product] ([ID], [ID Product], [ID Partner], [���������� ���������], [���� �������]) VALUES (15, 1, 5, 35000, CAST(N'2024-04-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Partners_product] ([ID], [ID Product], [ID Partner], [���������� ���������], [���� �������]) VALUES (16, 2, 5, 25000, CAST(N'2024-06-12T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Partners_product] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [ID Type], [������������ ���������], [�������], [����������� ��������� ��� ��������], [ID_material]) VALUES (1, 3, N'��������� ����� ����� ������ ������������ 14 ��', 8758385, 4456.9, 1)
INSERT [dbo].[Product] ([ID], [ID Type], [������������ ���������], [�������], [����������� ��������� ��� ��������], [ID_material]) VALUES (2, 3, N'���������� ����� ��� ����������� ���� ������������ 12 ��', 8858958, 7330.99, 2)
INSERT [dbo].[Product] ([ID], [ID Type], [������������ ���������], [�������], [����������� ��������� ��� ��������], [ID_material]) VALUES (3, 1, N'������� ��� �������-����� 33 ����� 12 ��', 7750282, 1799.33, 2)
INSERT [dbo].[Product] ([ID], [ID Type], [������������ ���������], [�������], [����������� ��������� ��� ��������], [ID_material]) VALUES (4, 1, N'������� ��� ����� 32 ����� 8 �� � ������', 7028748, 3890.41, 2)
INSERT [dbo].[Product] ([ID], [ID Type], [������������ ���������], [�������], [����������� ��������� ��� ��������], [ID_material]) VALUES (5, 4, N'��������� ��������� ������� �������� 32 ����� 4 ��', 5012543, 5450.59, 3)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Product_type] ON 

INSERT [dbo].[Product_type] ([ID], [��������], [����������� ���� ���������]) VALUES (1, N'�������', 2.35)
INSERT [dbo].[Product_type] ([ID], [��������], [����������� ���� ���������]) VALUES (2, N'��������� �����', 5.15)
INSERT [dbo].[Product_type] ([ID], [��������], [����������� ���� ���������]) VALUES (3, N'��������� �����', 4.34)
INSERT [dbo].[Product_type] ([ID], [��������], [����������� ���� ���������]) VALUES (4, N'��������� ��������', 1.5)
SET IDENTITY_INSERT [dbo].[Product_type] OFF
GO
ALTER TABLE [dbo].[Partners_product]  WITH CHECK ADD  CONSTRAINT [FK_Partners_product_Partners] FOREIGN KEY([ID Partner])
REFERENCES [dbo].[Partners] ([ID])
GO
ALTER TABLE [dbo].[Partners_product] CHECK CONSTRAINT [FK_Partners_product_Partners]
GO
ALTER TABLE [dbo].[Partners_product]  WITH CHECK ADD  CONSTRAINT [FK_Partners_product_Product] FOREIGN KEY([ID Product])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[Partners_product] CHECK CONSTRAINT [FK_Partners_product_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Material_type] FOREIGN KEY([ID_material])
REFERENCES [dbo].[Material_type] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Material_type]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Product_type] FOREIGN KEY([ID Type])
REFERENCES [dbo].[Product_type] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Product_type]
GO
USE [master]
GO
ALTER DATABASE [TestBase] SET  READ_WRITE 
GO