USE [master]
GO
/****** Object:  Database [AddressBookMultiUser]    Script Date: 21-May-21 3:06:26 PM ******/
CREATE DATABASE [AddressBookMultiUser]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AddressBookMultiUser', FILENAME = N'D:\.net Workshop\Database\AddressBookMultiUser.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AddressBookMultiUser_log', FILENAME = N'D:\.net Workshop\Database\AddressBookMultiUser_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [AddressBookMultiUser] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AddressBookMultiUser].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AddressBookMultiUser] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AddressBookMultiUser] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AddressBookMultiUser] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AddressBookMultiUser] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AddressBookMultiUser] SET ARITHABORT OFF 
GO
ALTER DATABASE [AddressBookMultiUser] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AddressBookMultiUser] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AddressBookMultiUser] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AddressBookMultiUser] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AddressBookMultiUser] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AddressBookMultiUser] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AddressBookMultiUser] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AddressBookMultiUser] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AddressBookMultiUser] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AddressBookMultiUser] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AddressBookMultiUser] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AddressBookMultiUser] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AddressBookMultiUser] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AddressBookMultiUser] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AddressBookMultiUser] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AddressBookMultiUser] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AddressBookMultiUser] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AddressBookMultiUser] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AddressBookMultiUser] SET  MULTI_USER 
GO
ALTER DATABASE [AddressBookMultiUser] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AddressBookMultiUser] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AddressBookMultiUser] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AddressBookMultiUser] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AddressBookMultiUser] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'AddressBookMultiUser', N'ON'
GO
ALTER DATABASE [AddressBookMultiUser] SET QUERY_STORE = OFF
GO
USE [AddressBookMultiUser]
GO
/****** Object:  Table [dbo].[BloodGroup]    Script Date: 21-May-21 3:06:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BloodGroup](
	[BloodGroupID] [int] IDENTITY(1,1) NOT NULL,
	[BloodGroupName] [varchar](50) NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_BloodGroup] PRIMARY KEY CLUSTERED 
(
	[BloodGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 21-May-21 3:06:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [varchar](50) NOT NULL,
	[Pincode] [varchar](50) NULL,
	[StateID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 21-May-21 3:06:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ContactID] [int] IDENTITY(1,1) NOT NULL,
	[ContactName] [varchar](50) NOT NULL,
	[Address] [varchar](100) NULL,
	[CityID] [int] NULL,
	[StateID] [int] NULL,
	[CountryID] [int] NULL,
	[Pincode] [varchar](50) NULL,
	[MobileNo] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Gender] [varchar](10) NULL,
	[BirthDate] [varchar](20) NULL,
	[BloodGroupID] [int] NULL,
	[Profession] [varchar](50) NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactCategory]    Script Date: 21-May-21 3:06:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactCategory](
	[ContactCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[ContactCategoryName] [varchar](50) NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_ContactCategory] PRIMARY KEY CLUSTERED 
(
	[ContactCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactWiseContactCategory]    Script Date: 21-May-21 3:06:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactWiseContactCategory](
	[ContactWiseContactCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[ContactID] [int] NOT NULL,
	[ContactCategoryID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_ContactWiseContactCategory] PRIMARY KEY CLUSTERED 
(
	[ContactWiseContactCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 21-May-21 3:06:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[CountryID] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [varchar](100) NOT NULL,
	[CountryCode] [varchar](10) NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[State]    Script Date: 21-May-21 3:06:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[StateID] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [varchar](50) NOT NULL,
	[CountryID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 21-May-21 3:06:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDetails](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[DisplayName] [varchar](50) NOT NULL,
	[Address] [varchar](100) NULL,
	[MobileNo] [varchar](10) NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_UserDetails] UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BloodGroup]  WITH CHECK ADD  CONSTRAINT [FK_BloodGroup_UserDetails] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserDetails] ([UserID])
GO
ALTER TABLE [dbo].[BloodGroup] CHECK CONSTRAINT [FK_BloodGroup_UserDetails]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_State] FOREIGN KEY([StateID])
REFERENCES [dbo].[State] ([StateID])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_State]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_UserDetails] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserDetails] ([UserID])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_UserDetails]
GO
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD  CONSTRAINT [FK_Contact_BloodGroup] FOREIGN KEY([BloodGroupID])
REFERENCES [dbo].[BloodGroup] ([BloodGroupID])
GO
ALTER TABLE [dbo].[Contact] CHECK CONSTRAINT [FK_Contact_BloodGroup]
GO
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD  CONSTRAINT [FK_Contact_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[Contact] CHECK CONSTRAINT [FK_Contact_City]
GO
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD  CONSTRAINT [FK_Contact_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
ALTER TABLE [dbo].[Contact] CHECK CONSTRAINT [FK_Contact_Country]
GO
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD  CONSTRAINT [FK_Contact_State] FOREIGN KEY([StateID])
REFERENCES [dbo].[State] ([StateID])
GO
ALTER TABLE [dbo].[Contact] CHECK CONSTRAINT [FK_Contact_State]
GO
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD  CONSTRAINT [FK_Contact_UserDetails] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserDetails] ([UserID])
GO
ALTER TABLE [dbo].[Contact] CHECK CONSTRAINT [FK_Contact_UserDetails]
GO
ALTER TABLE [dbo].[ContactCategory]  WITH CHECK ADD  CONSTRAINT [FK_ContactCategory_UserDetails] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserDetails] ([UserID])
GO
ALTER TABLE [dbo].[ContactCategory] CHECK CONSTRAINT [FK_ContactCategory_UserDetails]
GO
ALTER TABLE [dbo].[ContactWiseContactCategory]  WITH CHECK ADD  CONSTRAINT [FK_ContactWiseContactCategory_ContactCategory] FOREIGN KEY([ContactCategoryID])
REFERENCES [dbo].[ContactCategory] ([ContactCategoryID])
GO
ALTER TABLE [dbo].[ContactWiseContactCategory] CHECK CONSTRAINT [FK_ContactWiseContactCategory_ContactCategory]
GO
ALTER TABLE [dbo].[Country]  WITH CHECK ADD  CONSTRAINT [FK_Country_UserDetails] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserDetails] ([UserID])
GO
ALTER TABLE [dbo].[Country] CHECK CONSTRAINT [FK_Country_UserDetails]
GO
ALTER TABLE [dbo].[State]  WITH CHECK ADD  CONSTRAINT [FK_State_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
ALTER TABLE [dbo].[State] CHECK CONSTRAINT [FK_State_Country]
GO
ALTER TABLE [dbo].[State]  WITH CHECK ADD  CONSTRAINT [FK_State_UserDetails] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserDetails] ([UserID])
GO
ALTER TABLE [dbo].[State] CHECK CONSTRAINT [FK_State_UserDetails]
GO
/****** Object:  StoredProcedure [dbo].[PR_BloodGroup_DeleteByPKUserID]    Script Date: 21-May-21 3:06:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_BloodGroup_DeleteByPKUserID]
	@BloodGroupID int,
	@UserID int
AS
DELETE FROM [dbo].[BloodGroup]
WHERE [dbo].[BloodGroup].[BloodGroupID]=@BloodGroupID
AND [dbo].[BloodGroup].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_BloodGroup_InsertByUserID]    Script Date: 21-May-21 3:06:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_BloodGroup_InsertByUserID]
	@BloodGroupName varchar(50),
	@UserID int
AS
INSERT INTO [dbo].[BloodGroup]
(
	[BloodGroupName],
	[UserID]
)
VALUES
(
	@BloodGroupName,
	@UserID
)
GO
/****** Object:  StoredProcedure [dbo].[PR_BloodGroup_SelectAllByUserID]    Script Date: 21-May-21 3:06:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_BloodGroup_SelectAllByUserID]
	@UserID int
AS
SELECT
	[dbo].[BloodGroup].[BloodGroupID],
	[dbo].[BloodGroup].[BloodGroupName]

FROM [dbo].[BloodGroup]
WHERE [dbo].[BloodGroup].[UserID]=@UserID
ORDER BY [dbo].[BloodGroup].[BloodGroupName]
GO
/****** Object:  StoredProcedure [dbo].[PR_BloodGroup_SelectByPKUserID]    Script Date: 21-May-21 3:06:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_BloodGroup_SelectByPKUserID]
	@BloodGroupID int,
	@UserID int
AS
SELECT
	[dbo].[BloodGroup].[BloodGroupID],
	[dbo].[BloodGroup].[BloodGroupName]

FROM [dbo].[BloodGroup]
WHERE [dbo].[BloodGroup].[BloodGroupID]=@BloodGroupID
AND [dbo].[BloodGroup].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_BloodGroup_SelectForDropDownListByUserID]    Script Date: 21-May-21 3:06:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_BloodGroup_SelectForDropDownListByUserID]
	@UserID int
AS
SELECT
	[dbo].[BloodGroup].[BloodGroupID],
	[dbo].[BloodGroup].[BloodGroupName]
FROM [dbo].[BloodGroup]
WHERE [dbo].[BloodGroup].[UserID]=@UserID
ORDER BY [dbo].[BloodGroup].[BloodGroupName]
GO
/****** Object:  StoredProcedure [dbo].[PR_BloodGroup_UpdateByPKUserID]    Script Date: 21-May-21 3:06:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_BloodGroup_UpdateByPKUserID]
	@BloodGroupID int,
	@BloodGroupName varchar(50),
	@UserID int
AS
UPDATE [dbo].[BloodGroup]
SET [BloodGroupName]=@BloodGroupName
WHERE [dbo].[BloodGroup].[BloodGroupID]=@BloodGroupID
AND [dbo].[BloodGroup].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_City_DeleteByPKUserID]    Script Date: 21-May-21 3:06:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_City_DeleteByPKUserID]
	@CityID int,
	@UserID int
AS
DELETE FROM [dbo].[City]
WHERE [dbo].[City].[CityID]=@CityID
AND [dbo].[City].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_City_InsertByUserID]    Script Date: 21-May-21 3:06:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_City_InsertByUserID]
	@CityName varchar(500),
	@Pincode varchar(50),
	@StateID int,
	@UserID int
AS
INSERT INTO [dbo].[City]
(
	[CityName],
	[Pincode],
	[StateID],
	[UserID]
)
VALUES
(
	@CityName,
	@Pincode,
	@StateID,
	@UserID
)
GO
/****** Object:  StoredProcedure [dbo].[PR_City_SelectAllByUserID]    Script Date: 21-May-21 3:06:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_City_SelectAllByUserID]
	@UserID int
AS
SELECT
	[dbo].[City].[CityID],
	[dbo].[City].[CityName],
	[dbo].[City].[Pincode],
	[dbo].[City].[StateID],
	[dbo].[State].[StateID],
	[dbo].[State].[StateName],
	[dbo].[State].[CountryID],
	[dbo].[Country].[CountryID],
	[dbo].[Country].[CountryName],
	[dbo].[Country].[CountryCode]
FROM [dbo].[City]
INNER JOIN [dbo].[State]
ON [dbo].[City].[StateID]=[dbo].[State].[StateID]
INNER JOIN [dbo].[Country]
ON [dbo].[State].[CountryID]=[dbo].[Country].[CountryID]
WHERE [dbo].[City].[UserID]=@UserID
ORDER BY [dbo].[City].[CityName]
GO
/****** Object:  StoredProcedure [dbo].[PR_City_SelectByPKUserID]    Script Date: 21-May-21 3:06:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_City_SelectByPKUserID]
	@CityID int,
	@UserID int
AS
SELECT
	[dbo].[City].[CityID],
	[dbo].[City].[CityName],
	[dbo].[City].[Pincode],
	[dbo].[City].[StateID],
	[dbo].[State].[StateID],
	[dbo].[State].[StateName],
	[dbo].[State].[CountryID],
	[dbo].[Country].[CountryID],
	[dbo].[Country].[CountryName],
	[dbo].[Country].[CountryCode]

FROM [dbo].[City]
INNER JOIN [dbo].[State]
ON [dbo].[City].[StateID]=[dbo].[State].[StateID]
INNER JOIN [dbo].[Country]
ON [dbo].[State].[CountryID]=[dbo].[Country].[CountryID]
WHERE [dbo].[City].[CityID]=@CityID
AND [dbo].[City].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_City_SelectForDropDownListByUserID]    Script Date: 21-May-21 3:06:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_City_SelectForDropDownListByUserID]
	@UserID int
AS
SELECT
	[dbo].[City].[CityID],
	[dbo].[City].[CityName]
FROM [dbo].[City]
WHERE [dbo].[City].[UserID]=@UserID
ORDER BY [dbo].[City].[CityName]
GO
/****** Object:  StoredProcedure [dbo].[PR_City_SelectForDropDownListByUserIDStateID]    Script Date: 21-May-21 3:06:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_City_SelectForDropDownListByUserIDStateID]
	@UserID int,
	@StateID int
AS
SELECT
	[dbo].[City].[CityID],
	[dbo].[City].[CityName]
FROM [dbo].[City]
WHERE [dbo].[City].[UserID]=@UserID AND
	[dbo].[City].[StateID]=@StateID
ORDER BY [dbo].[City].[CityName]
GO
/****** Object:  StoredProcedure [dbo].[PR_City_UpdateByPKUserID]    Script Date: 21-May-21 3:06:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_City_UpdateByPKUserID]
	@CityID int,
	@CityName varchar(50),
	@Pincode varchar(50),
	@StateID int,
	@UserID int
AS
UPDATE [dbo].[City]
SET [CityName]=@CityName,
	[Pincode]=@Pincode ,
	[StateID]=@StateID 
WHERE [dbo].[City].[CityID]=@CityID
AND [dbo].[City].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_Contact_DeleteByPKUserID]    Script Date: 21-May-21 3:06:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Contact_DeleteByPKUserID]
	@ContactID int,
	@UserID int
AS
DELETE
FROM [dbo].[Contact]
WHERE [dbo].[Contact].[ContactID]=@ContactID
AND [dbo].[Contact].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_Contact_InsertByUserID]    Script Date: 21-May-21 3:06:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Contact_InsertByUserID]
	@ContactName varchar(50),
	@Address varchar(100),
	@CityID int,
	@StateID int,
	@CountryID int,
	@Pincode varchar(50),
	@MobileNo varchar(50),
	@Email varchar(50),
	@Gender varchar(10),
	@BirthDate Varchar(20),
	@BloodGroupID int,
	@Profession varchar(50),
	@UserID int,
	@ContactID int output
AS
INSERT INTO [dbo].[Contact]
(
	[ContactName],
	[Address],
	[CityID],
	[StateID],
	[CountryID],
	[Pincode],
	[MobileNo],
	[Email],
	[Gender],
	[BirthDate],
	[BloodGroupID],
	[Profession],
	[UserID]
)
VALUES
(
	@ContactName,
	@Address,
	@CityID,
	@StateID,
	@CountryID,
	@Pincode,
	@MobileNo,
	@Email,
	@Gender,
	@BirthDate,
	@BloodGroupID,
	@Profession,
	@UserID
)
SET @ContactID =SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[PR_Contact_SelectAllByUserID]    Script Date: 21-May-21 3:06:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Contact_SelectAllByUserID]
	@UserID int
AS
SELECT
	[dbo].[Contact].[ContactID],
	[dbo].[Contact].[ContactName],
	[dbo].[Contact].[Address],
	[dbo].[Contact].[BirthDate],
	[dbo].[Contact].[Gender],
	[dbo].[Contact].[MobileNo],
	[dbo].[Contact].[Email],
	[dbo].[Contact].[Pincode],
	[dbo].[Contact].[Profession],
	[dbo].[Contact].[BloodGroupID],
	[dbo].[Contact].[StateID],
	[dbo].[Contact].[CityID],
	[dbo].[Contact].[CountryID],
	[dbo].[Contact].[StateID],
	[dbo].[BloodGroup].[BloodGroupName],
	[dbo].[City].[CityName],
	[dbo].[Country].[CountryName],
	[dbo].[State].[StateName],
	[NewContactCategory].[ContactCategory]
FROM [dbo].[Contact]
LEFT JOIN [dbo].[City]
ON [dbo].[City].[CityID]=[dbo].[Contact].[CityID]
LEFT JOIN [dbo].[State]
ON [dbo].[State].[StateID]=[dbo].[Contact].[StateID]
LEFT JOIN [dbo].[Country]
ON [dbo].[Country].[CountryID]=[dbo].[Contact].[CountryID]
LEFT JOIN [dbo].[BloodGroup]
ON [dbo].[BloodGroup].[BloodGroupID]=[dbo].[Contact].[BloodGroupID]
LEFT JOIN (SELECT t1.Contactid,  
ContactCategory=STUFF  
(  
    (  
      SELECT DISTINCT ', '+ CAST(g.ContactCategoryName AS VARCHAR(MAX))  
      FROM ContactCategory g,ContactWiseContactCategory e   
      WHERE g.ContactCategoryID=e.ContactCategoryID and e.ContactID=t1.ContactID
      FOR XMl PATH('')  
    ),1,1,''  
)
FROM ContactWiseContactCategory t1
WHERE t1.UserID=@UserID
GROUP BY t1.ContactID) as NewContactCategory
on Contact.ContactID=NewContactCategory.ContactID
WHERE [dbo].[Contact].[UserID]=@UserID
ORDER BY [dbo].[Contact].[ContactName]
GO
/****** Object:  StoredProcedure [dbo].[PR_Contact_SelectByPKUserID]    Script Date: 21-May-21 3:06:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_Contact_SelectByPKUserID]
	@ContactID int,
	@UserID int
AS
SELECT
	[dbo].[Contact].[ContactID],
	[dbo].[Contact].[ContactName],
	[dbo].[Contact].[Address],
	[dbo].[Contact].[BirthDate],
	[dbo].[Contact].[Gender],
	[dbo].[Contact].[MobileNo],
	[dbo].[Contact].[Email],
	[dbo].[Contact].[Pincode],
	[dbo].[Contact].[Profession],
	[dbo].[Contact].[BloodGroupID],
	[dbo].[Contact].[StateID],
	[dbo].[Contact].[CityID],
	[dbo].[Contact].[CountryID],
	[dbo].[Contact].[StateID],
	[dbo].[BloodGroup].[BloodGroupName],
	[dbo].[City].[CityName],
	[dbo].[Country].[CountryName],
	[dbo].[State].[StateName]
FROM [dbo].[Contact]
LEFT JOIN [dbo].[City]
ON [dbo].[City].[CityID]=[dbo].[Contact].[CityID]
LEFT JOIN [dbo].[State]
ON [dbo].[State].[StateID]=[dbo].[Contact].[StateID]
LEFT JOIN [dbo].[Country]
ON [dbo].[Country].[CountryID]=[dbo].[Contact].[CountryID]
LEFT JOIN [dbo].[BloodGroup]
ON [dbo].[BloodGroup].[BloodGroupID]=[dbo].[Contact].[BloodGroupID]
WHERE [dbo].[Contact].[ContactID]=@ContactID
AND [dbo].[Contact].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_Contact_SelectForDropDownListByUserID]    Script Date: 21-May-21 3:06:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Contact_SelectForDropDownListByUserID]
	@UserID int
AS
SELECT
	[dbo].[Contact].[ContactID],
	[dbo].[Contact].[ContactName]
FROM [dbo].[Contact]
WHERE [dbo].[Contact].[UserID]=@UserID
ORDER BY [dbo].[Contact].[ContactName]
GO
/****** Object:  StoredProcedure [dbo].[PR_Contact_UpdateByPKUserID]    Script Date: 21-May-21 3:06:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Contact_UpdateByPKUserID]
	@ContactID int,
	@ContactName varchar(50),
	@Address varchar(100),
	@CityID int,
	@StateID int,
	@CountryID int,
	@Pincode varchar(50),
	@MobileNo varchar(50),
	@Email varchar(50),
	@Gender varchar(10),
	@BirthDate varchar(20),
	@BloodGroupID int,
	@Profession varchar(50),
	@UserID int
AS
UPDATE [dbo].[Contact]

SET [ContactName]=@ContactName,
	[Address]=@Address,
	[CityID]=@CityID,
	[StateID]=@StateID,
	[CountryID]=@CountryID,
	[Pincode]=@Pincode,
	[MobileNo]=@MobileNo,
	[Email]=@Email,
	[Gender]=@Gender,
	[BirthDate]=@BirthDate,
	[BloodGroupID]=@BloodGroupID,
	[Profession]=@Profession

WHERE [dbo].[Contact].[ContactID]=@ContactID
AND [dbo].[Contact].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_ContactCategory_DeleteByPKUserID]    Script Date: 21-May-21 3:06:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_ContactCategory_DeleteByPKUserID]
	@ContactCategoryID int,
	@UserID int
AS
DELETE FROM [dbo].[ContactCategory]
WHERE [dbo].[ContactCategory].[ContactCategoryID]=@ContactCategoryID
AND [dbo].[ContactCategory].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_ContactCategory_InsertByUserID]    Script Date: 21-May-21 3:06:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_ContactCategory_InsertByUserID]
	@ContactCategoryName varchar(50),
	@UserID int
AS
INSERT INTO [dbo].[ContactCategory]
(
	[ContactCategoryName],
	[UserID]
)
VALUES
(
	@ContactCategoryName,
	@UserID
)
GO
/****** Object:  StoredProcedure [dbo].[PR_ContactCategory_SelectAllByUserID]    Script Date: 21-May-21 3:06:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_ContactCategory_SelectAllByUserID]
	@UserID int
AS
SELECT
	[dbo].[ContactCategory].[ContactCategoryID],
	[dbo].[ContactCategory].[ContactCategoryName]

FROM [dbo].[ContactCategory]
WHERE [dbo].[ContactCategory].[UserID]=@UserID
ORDER BY [dbo].[ContactCategory].[ContactCategoryName]
GO
/****** Object:  StoredProcedure [dbo].[PR_ContactCategory_SelectByPKUserID]    Script Date: 21-May-21 3:06:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_ContactCategory_SelectByPKUserID]
	@ContactCategoryID int,
	@UserID int
AS
SELECT
	[dbo].[ContactCategory].[ContactCategoryID],
	[dbo].[ContactCategory].[ContactCategoryName]
FROM [dbo].[ContactCategory]
WHERE [dbo].[ContactCategory].[ContactCategoryID]=@ContactCategoryID
AND [dbo].[ContactCategory].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_ContactCategory_SelectForCheckBoxButtonListByUserID]    Script Date: 21-May-21 3:06:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_ContactCategory_SelectForCheckBoxButtonListByUserID]
	@UserID int
AS
SELECT
	[dbo].[ContactCategory].[ContactCategoryID],
	[dbo].[ContactCategory].[ContactCategoryName]
FROM [dbo].[ContactCategory]
WHERE [dbo].[ContactCategory].[UserID]=@UserID
ORDER BY [dbo].[ContactCategory].[ContactCategoryName]
GO
/****** Object:  StoredProcedure [dbo].[PR_ContactCategory_SelectForDropDownListByUserID]    Script Date: 21-May-21 3:06:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_ContactCategory_SelectForDropDownListByUserID]
	@UserID int
AS
SELECT
	[dbo].[ContactCategory].[ContactCategoryID],
	[dbo].[ContactCategory].[ContactCategoryName]
FROM [dbo].[ContactCategory]
WHERE [dbo].[ContactCategory].[UserID]=@UserID
ORDER BY [dbo].[ContactCategory].[ContactCategoryName]
GO
/****** Object:  StoredProcedure [dbo].[PR_ContactCategory_UpdateByPKUserID]    Script Date: 21-May-21 3:06:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_ContactCategory_UpdateByPKUserID]
	@ContactCategoryID int,
	@ContactCategoryName varchar(50),
	@UserID int
AS
UPDATE [dbo].[ContactCategory]
SET [ContactCategoryName]=@ContactCategoryName
WHERE [dbo].[ContactCategory].[ContactCategoryID]=@ContactCategoryID
AND [dbo].[ContactCategory].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_ContactWiseContactCategory_DeleteByUserID]    Script Date: 21-May-21 3:06:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_ContactWiseContactCategory_DeleteByUserID]
	@UserID int,
	@ContactID int
AS
DELETE FROM [dbo].[ContactWiseContactCategory]
WHERE [dbo].[ContactWiseContactCategory].[ContactID]=@ContactID
AND [dbo].[ContactWiseContactCategory].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_ContactWiseContactCategory_InsertByUserID]    Script Date: 21-May-21 3:06:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_ContactWiseContactCategory_InsertByUserID]
	@UserID int,
	@ContactID int,
	@ContactCategoryID int
AS
INSERT INTO [dbo].[ContactWiseContactCategory]
(
	[UserID],
	[ContactID],
	[ContactCategoryID]
)
VALUES
(
	@UserID,
	@ContactID,
	@ContactCategoryID
)
GO
/****** Object:  StoredProcedure [dbo].[PR_ContactWiseContactCategory_SelectForCheckBoxButtonList]    Script Date: 21-May-21 3:06:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_ContactWiseContactCategory_SelectForCheckBoxButtonList]
	@UserID int,
	@ContactID int
AS
SELECT
	[dbo].[ContactWiseContactCategory].[ContactCategoryID]
FROM [dbo].[ContactWiseContactCategory]
WHERE [dbo].[ContactWiseContactCategory].[UserID]=@UserID
AND [dbo].[ContactWiseContactCategory].[ContactID]=@ContactID
GO
/****** Object:  StoredProcedure [dbo].[PR_Country_DeleteByPKUserID]    Script Date: 21-May-21 3:06:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Country_DeleteByPKUserID]
	@CountryID int,
	@UserID int
AS
DELETE
FROM [dbo].[Country]
WHERE [dbo].[Country].[CountryID]=@CountryID
AND [dbo].[Country].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_Country_InsertByUserID]    Script Date: 21-May-21 3:06:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Country_InsertByUserID]
	@CountryName varchar(100),
	@CountryCode varchar(10),
	@UserID int
AS
INSERT INTO [dbo].[Country]
(
	[CountryName],
	[CountryCode],
	[UserID]
)
VALUES
(
	@CountryName,
	@CountryCode,
	@UserID
)
GO
/****** Object:  StoredProcedure [dbo].[PR_Country_SelectAllByUserID]    Script Date: 21-May-21 3:06:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Country_SelectAllByUserID]
	@UserID int
AS
SELECT
	[dbo].[Country].[CountryID],
	[dbo].[Country].[CountryName],
	[dbo].[Country].[CountryCode]
FROM [dbo].[Country]
WHERE [dbo].[Country].[UserID]=@UserID
ORDER BY [dbo].[Country].[CountryName]
GO
/****** Object:  StoredProcedure [dbo].[PR_Country_SelectByPKUserID]    Script Date: 21-May-21 3:06:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Country_SelectByPKUserID]
	@CountryID int,
	@UserID int
AS
SELECT
	[dbo].[Country].[CountryID],
	[dbo].[Country].[CountryName],
	[dbo].[Country].[CountryCode]
FROM [dbo].[Country]
WHERE [dbo].[Country].[CountryID]=@CountryID
AND [dbo].[Country].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_Country_SelectForDropDownListByUserID]    Script Date: 21-May-21 3:06:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Country_SelectForDropDownListByUserID]
	@UserID int
AS
SELECT
	[dbo].[Country].[CountryID],
	[dbo].[Country].[CountryName]
FROM [dbo].[Country]
WHERE [dbo].[Country].[UserID]=@UserID
ORDER BY [dbo].[Country].[CountryName]
GO
/****** Object:  StoredProcedure [dbo].[PR_Country_UpdateByPKUserID]    Script Date: 21-May-21 3:06:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Country_UpdateByPKUserID]
	@CountryID int,
	@CountryName varchar(100),
	@CountryCode varchar(10),
	@UserID int
AS
UPDATE [dbo].[Country]
SET [CountryName]=@CountryName,
	[CountryCode]=@COuntryCode
WHERE [dbo].[Country].[CountryID]=@CountryID
AND [dbo].[Country].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_SelectedContactCategoryDELETE]    Script Date: 21-May-21 3:06:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_SelectedContactCategoryDELETE]
	@UserID int,
	@ContactCategoryID int
AS
SELECT 
	[dbo].[ContactWiseContactCategory].[ContactID]
FROM [dbo].[ContactWiseContactCategory]
WHERE [dbo].[ContactWiseContactCategory].[UserID]=@UserID
AND [dbo].[ContactWiseContactCategory].[ContactCategoryID]=@ContactCategoryID
AND [dbo].[ContactWiseContactCategory].[Value]='True'
GO
/****** Object:  StoredProcedure [dbo].[PR_State_DeleteByPKUserID]    Script Date: 21-May-21 3:06:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_State_DeleteByPKUserID]
	@StateID int,
	@UserID int
AS
DELETE FROM [dbo].[State]
WHERE [dbo].[State].[StateID]=@StateID
AND [dbo].[State].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_State_InsertByUserID]    Script Date: 21-May-21 3:06:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_State_InsertByUserID]
	@StateName varchar(50),
	@CountryID int,
	@UserID int
AS
INSERT INTO [dbo].[State]
(
	[StateName],
	[CountryID],
	[UserID]
)
VALUES
(
	@StateName,
	@CountryID,
	@UserID
)
GO
/****** Object:  StoredProcedure [dbo].[PR_State_SelectAllByUserID]    Script Date: 21-May-21 3:06:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_State_SelectAllByUserID]
	@UserID int
AS
SELECT
	[dbo].[State].[StateID],
	[dbo].[State].[StateName],
	[dbo].[State].[CountryID],
	[dbo].[Country].[CountryID],
	[dbo].[Country].[CountryName],
	[dbo].[Country].[CountryCode]
FROM [dbo].[State]
INNER JOIN [dbo].[Country]
ON [dbo].[State].[CountryID]=[dbo].[Country].[CountryID]
WHERE [dbo].[State].[UserID]=@UserID
ORDER BY [dbo].[State].[StateName]
GO
/****** Object:  StoredProcedure [dbo].[PR_State_SelectByPKUserID]    Script Date: 21-May-21 3:06:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_State_SelectByPKUserID]
	@StateID int,
	@UserID int
AS
SELECT
	[dbo].[State].[StateID],
	[dbo].[State].[StateName],
	[dbo].[State].[CountryID],
	[dbo].[Country].[CountryID],
	[dbo].[Country].[CountryName],
	[dbo].[Country].[CountryCode]

FROM [dbo].[State]
INNER JOIN [dbo].[Country]
ON [dbo].[State].[CountryID]=[dbo].[Country].[CountryID]
WHERE [dbo].[State].[StateID]=@StateID
AND [dbo].[State].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_State_SelectForDropDownListByUserID]    Script Date: 21-May-21 3:06:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_State_SelectForDropDownListByUserID]
	@UserID int
AS
SELECT
	[dbo].[State].[StateID],
	[dbo].[State].[StateName]
FROM [dbo].[State]
WHERE [dbo].[State].[UserID]=@UserID
ORDER BY [dbo].[State].[StateName]
GO
/****** Object:  StoredProcedure [dbo].[PR_State_SelectForDropDownListByUserIDCountryID]    Script Date: 21-May-21 3:06:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_State_SelectForDropDownListByUserIDCountryID]
	@UserID int,
	@CountryID int
AS
SELECT
	[dbo].[State].[StateID],
	[dbo].[State].[StateName]
FROM [dbo].[State]
WHERE [dbo].[State].[UserID]=@UserID AND
	[dbo].[State].[CountryID]=@CountryID
ORDER BY [dbo].[State].[StateName]
GO
/****** Object:  StoredProcedure [dbo].[PR_State_UpdateByPKUserID]    Script Date: 21-May-21 3:06:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_State_UpdateByPKUserID]
	@StateID int,
	@StateName varchar(50),
	@CountryID int,
	@UserID int
AS
UPDATE [dbo].[State]
SET [StateName]=@StateName,
	[CountryID]=@CountryID
WHERE [dbo].[State].[StateID]=@StateID
AND [dbo].[State].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_UserDetails_Insert]    Script Date: 21-May-21 3:06:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_UserDetails_Insert]
	@Username varchar(50),
	@Password varchar(50),
	@DisplayName varchar(50),
	@Address varchar(100),
	@MobileNo varchar(10)
AS
INSERT INTO [dbo].[UserDetails]
(
	[UserName],
	[Password],
	[DisplayName],
	[Address],
	[MobileNo]
)
VALUES
(
	@Username,
	@Password,
	@DisplayName,
	@Address,
	@MobileNo
)
GO
/****** Object:  StoredProcedure [dbo].[PR_UserDetails_SelectByUserID]    Script Date: 21-May-21 3:06:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_UserDetails_SelectByUserID]
	@UserID int
AS
SELECT
	[dbo].[UserDetails].[UserID],
	[dbo].[UserDetails].[UserName],
	[dbo].[UserDetails].[Password],
	[dbo].[UserDetails].[DisplayName],
	[dbo].[UserDetails].[Address],
	[dbo].[UserDetails].[MobileNo]

FROM [dbo].[UserDetails]
WHERE [dbo].[UserDetails].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_UserDetails_SelectByUsername]    Script Date: 21-May-21 3:06:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_UserDetails_SelectByUsername]
AS
SELECT
	[dbo].[UserDetails].[UserName]
FROM [dbo].[UserDetails]
GO
/****** Object:  StoredProcedure [dbo].[PR_UserDetails_SelectByUsernamePassword]    Script Date: 21-May-21 3:06:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_UserDetails_SelectByUsernamePassword]
	@Username varchar(50),
	@Password varchar(50)
AS
SELECT
	[dbo].[UserDetails].[UserID],
	[dbo].[UserDetails].[UserName],
	[dbo].[UserDetails].[DisplayName]

FROM [dbo].[UserDetails]
WHERE [dbo].[UserDetails].[UserName]=@Username
AND [dbo].[UserDetails].[Password]=@Password
GO
/****** Object:  StoredProcedure [dbo].[PR_UserDetails_UpdateByUserID]    Script Date: 21-May-21 3:06:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_UserDetails_UpdateByUserID]
	@UserID int,
	@Username varchar(50),
	@Password varchar(50),
	@DisplayName varchar(50),
	@Address varchar(100),
	@MobileNo varchar(10)
AS
UPDATE [dbo].[UserDetails]
SET [UserName]=@Username,
	[Password]=@Password,
	[DisplayName]=@DisplayName,
	[Address]=@Address,
	[MobileNo]=@MobileNo
WHERE [dbo].[UserDetails].[UserID]=@UserID
GO
USE [master]
GO
ALTER DATABASE [AddressBookMultiUser] SET  READ_WRITE 
GO
