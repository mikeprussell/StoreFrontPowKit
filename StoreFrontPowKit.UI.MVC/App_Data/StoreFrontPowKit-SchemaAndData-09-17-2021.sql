/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.5026)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDetails]') AND type in (N'U'))
ALTER TABLE [dbo].[UserDetails] DROP CONSTRAINT IF EXISTS [FK_UserDetails_AspNetUsers]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
ALTER TABLE [dbo].[Products] DROP CONSTRAINT IF EXISTS [FK_Products_Suppliers]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
ALTER TABLE [dbo].[Products] DROP CONSTRAINT IF EXISTS [FK_Products_ProductStatuses]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
ALTER TABLE [dbo].[Products] DROP CONSTRAINT IF EXISTS [FK_Products_Categories]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employees]') AND type in (N'U'))
ALTER TABLE [dbo].[Employees] DROP CONSTRAINT IF EXISTS [FK_Employees_Departments]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 9/17/2021 2:28:22 PM ******/
DROP TABLE IF EXISTS [dbo].[UserDetails]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 9/17/2021 2:28:22 PM ******/
DROP TABLE IF EXISTS [dbo].[Suppliers]
GO
/****** Object:  Table [dbo].[ProductStatuses]    Script Date: 9/17/2021 2:28:22 PM ******/
DROP TABLE IF EXISTS [dbo].[ProductStatuses]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 9/17/2021 2:28:22 PM ******/
DROP TABLE IF EXISTS [dbo].[Products]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 9/17/2021 2:28:22 PM ******/
DROP TABLE IF EXISTS [dbo].[Employees]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 9/17/2021 2:28:22 PM ******/
DROP TABLE IF EXISTS [dbo].[Departments]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 9/17/2021 2:28:22 PM ******/
DROP TABLE IF EXISTS [dbo].[Customers]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 9/17/2021 2:28:22 PM ******/
DROP TABLE IF EXISTS [dbo].[Categories]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 9/17/2021 2:28:22 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 9/17/2021 2:28:22 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 9/17/2021 2:28:22 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 9/17/2021 2:28:22 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 9/17/2021 2:28:22 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 9/17/2021 2:28:22 PM ******/
DROP TABLE IF EXISTS [dbo].[__MigrationHistory]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 9/17/2021 2:28:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 9/17/2021 2:28:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 9/17/2021 2:28:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 9/17/2021 2:28:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 9/17/2021 2:28:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 9/17/2021 2:28:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 9/17/2021 2:28:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Categories]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Categories](
	[CategoryID] [smallint] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](15) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 9/17/2021 2:28:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](15) NOT NULL,
	[LastName] [nvarchar](15) NOT NULL,
	[Address] [nvarchar](50) NULL,
	[City] [nvarchar](15) NULL,
	[PostalCode] [char](5) NULL,
	[Phone] [nvarchar](24) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 9/17/2021 2:28:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Departments]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Departments](
	[DepartmentID] [smallint] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [varchar](15) NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 9/17/2021 2:28:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employees]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](15) NOT NULL,
	[LastName] [nvarchar](15) NOT NULL,
	[DeptID] [smallint] NOT NULL,
	[HasDirectReport] [bit] NOT NULL,
	[DirectReportID] [int] NULL,
	[BirthDate] [date] NULL,
	[Phone] [nvarchar](24) NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Products]    Script Date: 9/17/2021 2:28:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[SupplierID] [int] NOT NULL,
	[CategoryID] [smallint] NOT NULL,
	[UnitPrice] [money] NULL,
	[ProductStatusID] [int] NULL,
	[ProductImage] [varchar](100) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ProductStatuses]    Script Date: 9/17/2021 2:28:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductStatuses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProductStatuses](
	[ProductStatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_ProductStatuses] PRIMARY KEY CLUSTERED 
(
	[ProductStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 9/17/2021 2:28:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Suppliers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](15) NOT NULL,
	[ContactName] [nvarchar](30) NULL,
	[ContactTitle] [nvarchar](30) NULL,
	[Address] [nvarchar](50) NULL,
	[City] [char](2) NULL,
	[PostalCode] [char](5) NULL,
	[Phone] [nvarchar](24) NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 9/17/2021 2:28:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserDetails](
	[UserId] [nvarchar](128) NOT NULL,
	[FirstName] [varchar](30) NOT NULL,
	[LastName] [varchar](30) NOT NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202109161317550_InitialCreate', N'StoreFrontPowKit.UI.MVC.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5C596FE436127E0FB0FF41D0D36EE069F9C80C668DEE099CB6BD6BCCF8C0B43DD8B7015B62B785912845A23C3682FCB23CE427E52F6C51A22E1E3ABAD5878300C1B458FCAA58AC228BC5A2FFFAE3CFF1CFCFBE673CE128760332318F4687A681891D382E594ECC842EDEBC377FFEF08F1FC6178EFF6C7CC9E94E181DF424F1C47CA4343CB5ACD87EC43E8A47BE6B47411C2CE8C80E7C0B3981757C78F86FEBE8C8C200610296618C3F2784BA3E4E7FC0CF69406C1CD20479D78183BD987F8796598A6ADC201FC721B2F1C49CD120C2975140E85DF0FDA34B470F57A3EB2FD351D6D334CE3C17815433EC2D4C031112504441E6D38718CF28745BCE42F880BCFB971003DD027931E663392DC9BB0EEBF0980DCB2A3BE6507612D3C0EF097874C2F56489DD57D2B659E8113479011AA72F6CD4A93627E69583D34F9F030F1420323C9D7A11239E98D7058BB338BCC17494771C65909711C07D0FA26FA32AE281D1B9DF416157C7A343F6DF81314D3C9A447842704223E41D1877C9DC73ED8FF8E53EF886C9E4E468BE3879FFF61D724EDEFD844FDE56470A6305BADA07F8741705218E4036BC28C66F1A56BD9F25762CBA55FA645A015B0217318D6BF4FC0993257D04E7397E6F1A97EE3376F22FDCB81E880B1E059D6894C0CF9BC4F3D0DCC345BBD5C893FDBF81EBF1DB778370BD414FEE329D7A813F384E047EF5197B696BFCE886997BD5E6FB2B2703CFF4D9EFBA7D65AD5F674112D96C308196E41E454B4CEBD28DADD2783B9934831ADEAC73D4FD376D26A96CDE4A5236A0553C2167B16D6FC8E5DD2CDFCE167716863079A969318D34195CF3C63512900E0C0D7D6952475D4D8AC050FFCE2BE4858F5C6F8025B203178854166EE4E36294BF04609088F496F90EC531AC10CE7F51FCD8203AFC7300D167D84E2230DC19457EB8716E778F01C137893F67FEB03D5E834DCDFDF7E012D9E07D1784F55A1BEF53607F0B127A419C7344F103B57340F6F3DEF5BB030C22CE996DE338BE0463C6CE3480403C07BC22F4E4B8371C5BAC761DA24C3DE4FAEA18455856BFE6A4659CA2A69062150D992A5E6912F553B0744937517352BDA81945ABA89CACAFA80CAC9BA49C522F684AD02A674635580498CED0F021600ABBFF31E07A9BB76E2DA8A8318D4FFE83098E601973EE10A53822E50C74593776112CA4D3C7986E7C6F4A397D415E3234AB95BC215D0486F7861476FFBD2115133E3FB90E8B4A3A1C8C726280EF44AF3E73B5FB9C20D9B6DDA136CC6D33DFCE1AA07397B3380E6C37F502454A8C2734EAF2430C67B46737B2D1881912181818BACBB63CF802633345A3BA25E7D8C3141B677696329CA2D8468EAC461890D343B07C47550856664AEAC2FD28F1044BC711EB84D82128064F750995DDC225B61B22AF554B42CF8E5B181B7BC1436C39C721268C61AB26BA305727469800051F6152DA3434B62A16D76C889AA85537E76D216C39EF52BE622B36D9123B6BEC92C76F1B31CC668D6DC1389B55D245006D926F1706CACF2A5D0D403CB8EC9B810A27268D81F2906A2B065AD7D80E0CB4AE925767A0D911B5EBFC0BE7D57D33CFFA4179FBDB7AA3BA76609B357DEC996966B127F4A1D00347B2799ECF59237EA68AC319C8C9CF67310F75451361E0334CEB299B32DE55C6A156338868444D80A5A1B580F2EB41094872A81EC2E5B9BC46E97814D10336CFBB35C2F2B55F80ADD8808C5DBD26AD10EA2F5345E3EC74FA284656588364E49D0E0B151C8541888B577DE01D94A2CBCBCA8AE9120BF789862B03E393D1A0A096C855A3A47C30836B2937CD762DA902B23E21D95A5A12C2278D96F2C10CAE256EA3ED4A5204053DC282B55454DFC20772B63CD351EC3645DBD8CA2AA9F887B1A529B91A5FA33074C9B25282C5BF18B3ACFE6AFA66D6BF18C9CF302C3B56D42415D2169C6810A125165A8135487AE946313D4714CD11CBF34C1D5F2253EEAD9AE53F6759DD3EE549CCF7819C9AFD9BDFAC365FEAD7F65D3930E17897305A9F4537299AC216D4DD0D561E873C1429B2F8D3C04B7CA20FB6F4BDB3BBBC6AFFEC8B8C30B604F9A5604AD29C14F2D6A7A1D324C90EB281092BE29AD5274D0FA1537D1E955695AF8B54F52879E2AA8AA24B66ED6C127501CECA1327C691FDE7AD156133FEC68B57AA00FC534F8C4AFD83045669EB8E5A2F51A962D65BBA230A75285548A1A98794D56A939A90D58695F0341A555374E720D79754D1E5D6EEC88A4A932AB4A279056C85CC625B775445314A1558D1DC1DBBAC4C1117D43DDED1B4A79B41B6B4EC30BCDE9EA6C1D8CCEA38CC9658B9F3AF02553EF7C4E2B7FA1218FFBE9796A53D110E6259593E643DCBD260E857A4DACD797D416ABCEED763D6AEC36B8B7E5339801EAF9FFD6ED44AA4C3A14852702F0E89C26170CC0F66ED8F74A4935A46621AB91AC1B65E628AFD112318CD7EF5A69E8BD9F29E135C23E22E704CB31210F3F8F0E85878DBB33FEF6CAC38763CC5C156F7D8A63E675BA8E6224F28B21F5124D756ACF116A50495D2D657C4C1CF13F3B7B4D7699A0161FF4A3F1F1857F103717F4DA0E13E4AB0F1BB5C2B3A4C6D7EF3416C4F5F5274D7EAD5FFBE665D0F8CDB083CE6D4381474B9CA0CD7DF57F49226EBBA86342BBFBA78BD0E557BBAA044151C62F5970A73970EF24A2197F29F3E7AFE575FD1942F11D64254BC36180A6F1015EA5E13AC82A57D49E0C04F9ABE24E83758F5CB825544D3BE2A70497F30F14D41F76528EFB9C3AD46713EDAC69294EAB9B5267BAD02CD5DEF4D52E9F65A8E2E9767F7805BA3047B05CB7865D5CB83ED8E8AE2E4C1B07769DA1BAF48DE9722E4B23C64B7B5C7DB2C376EB83AFA5B5519EF415D9CA2CE67F7B5C4DBB6355D4E77CF0B32FB550CEF99B1F1EAAFDDD7056FDBD87469DE3D37B65ED5BF7B666BBBDA3F776C699DB7D09DD7F2CA65499ABB19552EB8AD56374B9CC3097F1E8011641165F6C4525D1CD654D8DAC2B024D133D557A5898C25C791F84A14CD6CFB8D956FF88D83E534CD6C35B59C4DBCF9FADFC89BD334F3D65448EEA2CA5859A3A8AAFC6E59C79A0AA55E5355716D242D45EC6D316BE345FB6B2A221E442935EFD1DC11BF9E9AE1415432A4EBF4A81196AF7B61EFACFCE546D8BF63775942B0BFE348B05DDB350B9A2BB208F2CD5B902827113234D7982207B6D4B388BA0B6453686639E6F48D789AB763371D73EC5C91DB8486098521637FEED5125E2C0868E29F1642D7651EDF86E99F3B19620820A6CB72F3B7E497C4F59C42EE4B454E4803C1A20B9ED1657349596677F95220DD04A42310575F1114DD633FF4002CBE2533F48457910DCCEF135E22FBA5CC00EA40DA27A2AEF6F1B98B9611F2638E51F6879F60C38EFFFCE1FFA7DA6A12C0540000, N'6.1.0-30225')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'0d4d03aa-d706-43e2-afe8-7c8b7ba4a246', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'abaf7a0f-3972-4ebf-9215-f919d1d7a396', N'Customer')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'fb891bc8-174f-4110-8f9e-508f05fdd60f', N'Employee')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'd3a6c127-e481-4297-9f6c-250ccfd803d5', N'HR Employee')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'c4e481e8-8cf3-4d35-b43f-a9d6446b856c', N'Operations Employee')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c6790135-15a9-47e7-9bb2-4a81f801edb3', N'0d4d03aa-d706-43e2-afe8-7c8b7ba4a246')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'9870c7a5-13c0-482d-8030-11f38776d761', N'c4e481e8-8cf3-4d35-b43f-a9d6446b856c')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'affd42d4-bb12-4fd4-af63-58ee579aee30', N'd3a6c127-e481-4297-9f6c-250ccfd803d5')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'abda4034-9225-4758-9131-8e680edf1e2b', N'fb891bc8-174f-4110-8f9e-508f05fdd60f')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'9870c7a5-13c0-482d-8030-11f38776d761', N'operations@powkit.com', 0, N'AEdvEfRi+wLj2ebIyfHnkcazxqbLwawKILPWg96sgTwBXLRKKzqMltTm0HSNlSfkmA==', N'bf59343c-7b6a-439c-a9cd-6865adab8cf7', NULL, 0, 0, NULL, 1, 0, N'operations@powkit.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'abda4034-9225-4758-9131-8e680edf1e2b', N'employee@powkit.com', 0, N'AJGaLFb3+EMmFeQRfe3XqKZchpjHPZ6ki/BFytnNxx0BUxSaSYr6r6XQ0OQMW3+ZVg==', N'05c04972-9903-49bf-a692-e8e19237f00e', NULL, 0, 0, NULL, 1, 0, N'employee@powkit.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'affd42d4-bb12-4fd4-af63-58ee579aee30', N'hr@powkit.com', 0, N'AOr2iMeg4BS4q1wEqt72+Xf4gmSIHbnHKm+6dMJ3zOW8FTpLdkNn6S2+Z/7ezdszPA==', N'4143d5be-be96-4206-9870-351d7cf7fd76', NULL, 0, 0, NULL, 1, 0, N'hr@powkit.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c6790135-15a9-47e7-9bb2-4a81f801edb3', N'mikeprussell@outlook.com', 0, N'ACXz2oP0AasTxmv9KrtRQ0zjBqy/JDRNknq9h2Rchxtlu/RNWUyw5mB7RDWSosKpsg==', N'3b81c764-34a1-4865-a708-6e9cb19a31e3', NULL, 0, 0, NULL, 1, 0, N'mikeprussell@outlook.com')
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (1, N'Snowboards')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (2, N'Boots')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (3, N'Bindings')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Address], [City], [PostalCode], [Phone]) VALUES (1, N'Robert', N'Mitchell', N'12345 Main St.', N'Kansas City', N'66012', N'(816) 890-5925')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Address], [City], [PostalCode], [Phone]) VALUES (2, N'James', N'Slashner', N'9125 Broadway Terr.', N'Kansas City', N'66101', N'(816) 785-2698')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Address], [City], [PostalCode], [Phone]) VALUES (3, N'Suzanne', N'Rollins', N'8963 Lackman Dr.', N'Overland Park', N'66207', N'(913) 685-9243')
SET IDENTITY_INSERT [dbo].[Customers] OFF
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (1, N'Management')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (2, N'Sales')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (3, N'Marketing')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (4, N'Operations')
SET IDENTITY_INSERT [dbo].[Departments] OFF
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [DeptID], [HasDirectReport], [DirectReportID], [BirthDate], [Phone]) VALUES (1, N'Michael', N'Scott', 1, 1, NULL, CAST(N'1976-08-05' AS Date), NULL)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [DeptID], [HasDirectReport], [DirectReportID], [BirthDate], [Phone]) VALUES (2, N'Jim', N'Halpert', 2, 0, 1, CAST(N'1984-07-29' AS Date), N'(913) 890-5947')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [DeptID], [HasDirectReport], [DirectReportID], [BirthDate], [Phone]) VALUES (3, N'Jan', N'Levinson', 3, 0, 1, CAST(N'1978-10-02' AS Date), N'(816) 598-2456')
SET IDENTITY_INSERT [dbo].[Employees] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [SupplierID], [CategoryID], [UnitPrice], [ProductStatusID], [ProductImage]) VALUES (15, N'Lib Tech T.Rice Pro HP C2 Snowboard 2021', NULL, 2, 1, 529.9900, 1, N'ArborCaskSnowboard2021.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [SupplierID], [CategoryID], [UnitPrice], [ProductStatusID], [ProductImage]) VALUES (20, N'Jones Hovercraft Snowboard 2021
', NULL, 5, 1, 412.9900, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [SupplierID], [CategoryID], [UnitPrice], [ProductStatusID], [ProductImage]) VALUES (21, N'Arbor Men’s Cask Snowboard 2021', NULL, 4, 1, 299.9900, 1, N'ArborCaskSnowboard2021.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [SupplierID], [CategoryID], [UnitPrice], [ProductStatusID], [ProductImage]) VALUES (22, N'Salomon Pulse Snowboard 2021', NULL, 1, 1, 279.9900, 1, N'NoImage.png')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [SupplierID], [CategoryID], [UnitPrice], [ProductStatusID], [ProductImage]) VALUES (28, N'TEST', N'TEST', 1, 1, NULL, 1, N'ArborCaskSnowboard2021.jpg')
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[ProductStatuses] ON 

INSERT [dbo].[ProductStatuses] ([ProductStatusID], [StatusName]) VALUES (1, N'InStock')
INSERT [dbo].[ProductStatuses] ([ProductStatusID], [StatusName]) VALUES (2, N'Backordered')
INSERT [dbo].[ProductStatuses] ([ProductStatusID], [StatusName]) VALUES (3, N'OutOfStock')
INSERT [dbo].[ProductStatuses] ([ProductStatusID], [StatusName]) VALUES (4, N'Discontinued')
SET IDENTITY_INSERT [dbo].[ProductStatuses] OFF
SET IDENTITY_INSERT [dbo].[Suppliers] ON 

INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [ContactTitle], [Address], [City], [PostalCode], [Phone]) VALUES (1, N'Salomon', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [ContactTitle], [Address], [City], [PostalCode], [Phone]) VALUES (2, N'Lib Tech', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [ContactTitle], [Address], [City], [PostalCode], [Phone]) VALUES (3, N'Burton', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [ContactTitle], [Address], [City], [PostalCode], [Phone]) VALUES (4, N'Arbor', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [ContactTitle], [Address], [City], [PostalCode], [Phone]) VALUES (5, N'Jones', NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName]) VALUES (N'9870c7a5-13c0-482d-8030-11f38776d761', N'Ops', N'Employee')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName]) VALUES (N'abda4034-9225-4758-9131-8e680edf1e2b', N'Regular', N'Employee')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName]) VALUES (N'affd42d4-bb12-4fd4-af63-58ee579aee30', N'HR', N'Employee')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName]) VALUES (N'c6790135-15a9-47e7-9bb2-4a81f801edb3', N'Mike', N'Russell')
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employees_Departments]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employees]'))
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Departments] FOREIGN KEY([DeptID])
REFERENCES [dbo].[Departments] ([DepartmentID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employees_Departments]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employees]'))
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Departments]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Products_Categories]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Products_Categories]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Products_ProductStatuses]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductStatuses] FOREIGN KEY([ProductStatusID])
REFERENCES [dbo].[ProductStatuses] ([ProductStatusID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Products_ProductStatuses]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductStatuses]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Products_Suppliers]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Products_Suppliers]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Suppliers]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserDetails_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserDetails]'))
ALTER TABLE [dbo].[UserDetails]  WITH CHECK ADD  CONSTRAINT [FK_UserDetails_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserDetails_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserDetails]'))
ALTER TABLE [dbo].[UserDetails] CHECK CONSTRAINT [FK_UserDetails_AspNetUsers]
GO
