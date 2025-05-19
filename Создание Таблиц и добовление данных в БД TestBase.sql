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
	[Процент брака материала ] [float] NULL,
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
	[Тип партнера] [nvarchar](255) NULL,
	[Наименование партнера] [nvarchar](255) NULL,
	[Директор] [nvarchar](255) NULL,
	[Электронная почта партнера] [nvarchar](255) NULL,
	[Телефон партнера] [nvarchar](255) NULL,
	[Юридический адрес партнера] [nvarchar](255) NULL,
	[ИНН] [float] NULL,
	[Рейтинг] [float] NULL,
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
	[Количество продукции] [float] NULL,
	[Дата продажи] [datetime] NULL,
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
	[Наименование продукции] [nvarchar](255) NULL,
	[Артикул] [float] NULL,
	[Минимальная стоимость для партнера] [float] NULL,
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
	[Название] [nvarchar](255) NULL,
	[Коэффициент типа продукции] [float] NULL,
 CONSTRAINT [PK_Product_type] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[inventory] ([id], [book_id], [condition], [location]) VALUES (N'1', N'1', N'РҐРѕСЂРѕС€РµРµ', N'РЎС‚РµР»Р»Р°Р¶ 1')
INSERT [dbo].[inventory] ([id], [book_id], [condition], [location]) VALUES (N'2', N'2', N'РЈРґРѕРІР»РµС‚РІРѕСЂРёС‚РµР»СЊРЅРѕРµ', N'РЎС‚РµР»Р»Р°Р¶ 2')
INSERT [dbo].[inventory] ([id], [book_id], [condition], [location]) VALUES (N'3', N'3', N'РќРѕРІРѕРµ', N'РЎС‚РµР»Р»Р°Р¶ 3')
GO
SET IDENTITY_INSERT [dbo].[Material_type] ON 

INSERT [dbo].[Material_type] ([ID], [Процент брака материала ], [Name]) VALUES (1, 0.001, N'Ясень')
INSERT [dbo].[Material_type] ([ID], [Процент брака материала ], [Name]) VALUES (2, 0.0095, N'Дуб')
INSERT [dbo].[Material_type] ([ID], [Процент брака материала ], [Name]) VALUES (3, 0.0028, N'Пробка')
INSERT [dbo].[Material_type] ([ID], [Процент брака материала ], [Name]) VALUES (4, 0.0055, N'Ель')
INSERT [dbo].[Material_type] ([ID], [Процент брака материала ], [Name]) VALUES (5, 0.0034, N'Сосна')
SET IDENTITY_INSERT [dbo].[Material_type] OFF
GO
SET IDENTITY_INSERT [dbo].[Partners] ON 

INSERT [dbo].[Partners] ([ID], [Тип партнера], [Наименование партнера], [Директор], [Электронная почта партнера], [Телефон партнера], [Юридический адрес партнера], [ИНН], [Рейтинг]) VALUES (1, N'ЗАО', N'База Строитель', N'Иванова Александра Ивановна', N'aleksandraivanova@ml.ru', N'493 123 45 67', N'652050, Кемеровская область, город Юрга, ул. Лесная, 15', 2222455179, 7)
INSERT [dbo].[Partners] ([ID], [Тип партнера], [Наименование партнера], [Директор], [Электронная почта партнера], [Телефон партнера], [Юридический адрес партнера], [ИНН], [Рейтинг]) VALUES (2, N'ООО', N'Паркет 29', N'Петров Василий Петрович', N'vppetrov@vl.ru', N'987 123 56 66', N'164500, Архангельская область, город Северодвинск, ул. Строителей, 18', 3333888520, 7)
INSERT [dbo].[Partners] ([ID], [Тип партнера], [Наименование партнера], [Директор], [Электронная почта партнера], [Телефон партнера], [Юридический адрес партнера], [ИНН], [Рейтинг]) VALUES (3, N'ПАО', N'Стройсервис', N'Соловьев Андрей Николаевич', N'ansolovev@st.ru', N'812 223 32 00', N'188910, Ленинградская область, город Приморск, ул. Парковая, 21', 4440391035, 7)
INSERT [dbo].[Partners] ([ID], [Тип партнера], [Наименование партнера], [Директор], [Электронная почта партнера], [Телефон партнера], [Юридический адрес партнера], [ИНН], [Рейтинг]) VALUES (4, N'ОАО', N'Ремонт и отделка', N'Воробьева Екатерина Валерьевна', N'ekaterina.vorobeva@ml.ru', N'444 222 33 11', N'143960, Московская область, город Реутов, ул. Свободы, 51', 1111520857, 5)
INSERT [dbo].[Partners] ([ID], [Тип партнера], [Наименование партнера], [Директор], [Электронная почта партнера], [Телефон партнера], [Юридический адрес партнера], [ИНН], [Рейтинг]) VALUES (5, N'ЗАО', N'МонтажПро', N'Степанов Степан Сергеевич', N'stepanov@stepan.ru', N'912 888 33 33', N'309500, Белгородская область, город Старый Оскол, ул. Рабочая, 122', 5552431140, 10)
INSERT [dbo].[Partners] ([ID], [Тип партнера], [Наименование партнера], [Директор], [Электронная почта партнера], [Телефон партнера], [Юридический адрес партнера], [ИНН], [Рейтинг]) VALUES (6, N'ОАО', N'sdfsdfds', N'dsdfasf', N'sdfsdf', N'sdfsdf', N'sdfsdf', -2, 0)
SET IDENTITY_INSERT [dbo].[Partners] OFF
GO
SET IDENTITY_INSERT [dbo].[Partners_product] ON 

INSERT [dbo].[Partners_product] ([ID], [ID Product], [ID Partner], [Количество продукции], [Дата продажи]) VALUES (1, 1, 1, 15500, CAST(N'2023-03-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Partners_product] ([ID], [ID Product], [ID Partner], [Количество продукции], [Дата продажи]) VALUES (2, 3, 1, 12350, CAST(N'2023-12-18T00:00:00.000' AS DateTime))
INSERT [dbo].[Partners_product] ([ID], [ID Product], [ID Partner], [Количество продукции], [Дата продажи]) VALUES (3, 4, 1, 37400, CAST(N'2024-06-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Partners_product] ([ID], [ID Product], [ID Partner], [Количество продукции], [Дата продажи]) VALUES (4, 2, 2, 35000, CAST(N'2022-12-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Partners_product] ([ID], [ID Product], [ID Partner], [Количество продукции], [Дата продажи]) VALUES (5, 5, 2, 1250, CAST(N'2023-05-17T00:00:00.000' AS DateTime))
INSERT [dbo].[Partners_product] ([ID], [ID Product], [ID Partner], [Количество продукции], [Дата продажи]) VALUES (6, 3, 2, 1000, CAST(N'2024-06-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Partners_product] ([ID], [ID Product], [ID Partner], [Количество продукции], [Дата продажи]) VALUES (7, 1, 2, 7550, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Partners_product] ([ID], [ID Product], [ID Partner], [Количество продукции], [Дата продажи]) VALUES (8, 1, 3, 7250, CAST(N'2023-01-22T00:00:00.000' AS DateTime))
INSERT [dbo].[Partners_product] ([ID], [ID Product], [ID Partner], [Количество продукции], [Дата продажи]) VALUES (9, 2, 3, 2500, CAST(N'2024-07-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Partners_product] ([ID], [ID Product], [ID Partner], [Количество продукции], [Дата продажи]) VALUES (10, 4, 4, 59050, CAST(N'2023-03-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Partners_product] ([ID], [ID Product], [ID Partner], [Количество продукции], [Дата продажи]) VALUES (11, 3, 4, 37200, CAST(N'2024-03-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Partners_product] ([ID], [ID Product], [ID Partner], [Количество продукции], [Дата продажи]) VALUES (12, 5, 4, 4500, CAST(N'2024-05-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Partners_product] ([ID], [ID Product], [ID Partner], [Количество продукции], [Дата продажи]) VALUES (13, 3, 5, 50000, CAST(N'2023-09-19T00:00:00.000' AS DateTime))
INSERT [dbo].[Partners_product] ([ID], [ID Product], [ID Partner], [Количество продукции], [Дата продажи]) VALUES (14, 4, 5, 670000, CAST(N'2023-11-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Partners_product] ([ID], [ID Product], [ID Partner], [Количество продукции], [Дата продажи]) VALUES (15, 1, 5, 35000, CAST(N'2024-04-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Partners_product] ([ID], [ID Product], [ID Partner], [Количество продукции], [Дата продажи]) VALUES (16, 2, 5, 25000, CAST(N'2024-06-12T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Partners_product] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [ID Type], [Наименование продукции], [Артикул], [Минимальная стоимость для партнера], [ID_material]) VALUES (1, 3, N'Паркетная доска Ясень темный однополосная 14 мм', 8758385, 4456.9, 1)
INSERT [dbo].[Product] ([ID], [ID Type], [Наименование продукции], [Артикул], [Минимальная стоимость для партнера], [ID_material]) VALUES (2, 3, N'Инженерная доска Дуб Французская елка однополосная 12 мм', 8858958, 7330.99, 2)
INSERT [dbo].[Product] ([ID], [ID Type], [Наименование продукции], [Артикул], [Минимальная стоимость для партнера], [ID_material]) VALUES (3, 1, N'Ламинат Дуб дымчато-белый 33 класс 12 мм', 7750282, 1799.33, 2)
INSERT [dbo].[Product] ([ID], [ID Type], [Наименование продукции], [Артикул], [Минимальная стоимость для партнера], [ID_material]) VALUES (4, 1, N'Ламинат Дуб серый 32 класс 8 мм с фаской', 7028748, 3890.41, 2)
INSERT [dbo].[Product] ([ID], [ID Type], [Наименование продукции], [Артикул], [Минимальная стоимость для партнера], [ID_material]) VALUES (5, 4, N'Пробковое напольное клеевое покрытие 32 класс 4 мм', 5012543, 5450.59, 3)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Product_type] ON 

INSERT [dbo].[Product_type] ([ID], [Название], [Коэффициент типа продукции]) VALUES (1, N'Ламинат', 2.35)
INSERT [dbo].[Product_type] ([ID], [Название], [Коэффициент типа продукции]) VALUES (2, N'Массивная доска', 5.15)
INSERT [dbo].[Product_type] ([ID], [Название], [Коэффициент типа продукции]) VALUES (3, N'Паркетная доска', 4.34)
INSERT [dbo].[Product_type] ([ID], [Название], [Коэффициент типа продукции]) VALUES (4, N'Пробковое покрытие', 1.5)
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