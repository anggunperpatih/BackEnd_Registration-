create database [LocalDB]
go
USE [LocalDB]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 17/12/2023 12:09:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Username] [nvarchar](max) NULL,
	[PasswordHash] [varbinary](max) NULL,
	[PasswordSalt] [varbinary](max) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Username], [PasswordHash], [PasswordSalt]) VALUES (1, N'Anggun', N'Perpatih', N'Anggun', 0x5CD520F61A1C24BFD4E2893B02EC23C6E907E80E9C8130DBD981CEFE9B7AE93ED7E601FCBD0FE1A4FCE047EF205F1CE1125DCD6E1BF3A7879E50B90D54D0CF07, 0x5BC2301E2995B724F26A499AE31F197B3B4A9C7348D99C7A6D064DFD3304514B161A4A7D42319177E7DF3A7FA7B0FD4716FE6471D84C3558DE68AAA60D7743666AB76E1D52B1C906210C7CD2CECEB0FABB9ACA15BCAD21027933115EAFCABB3C292733FCFF40F2BD6255EA944B55EBA3AD92E6E4279E8573ADCF4C0432C73122)
GO
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Username], [PasswordHash], [PasswordSalt]) VALUES (2, N'Siti', N'Hawa', N'Hawa', 0x320EAA96B6764C5FF747F93835ED4D554CC10B95EC49835845FB14572FAA8515FE0699FFBF241DC432CC95F5E7B29ABA394D48C0D175EC07346578D81A430121, 0xAA84AD0F9B0713F2D8ACDB27DCBC95164A2F93B72F0E07CC68DBC8BBEC7872648D1CB353DBA638DF90913D5EE1353234BF25BBEDEF029599267E25EE0BF9ED5C97A315133AA8EC38A9CA512BE70FD830ABBF24913D2961BB6624227071854A2E9735B87CEAF0CD44AC11833007F2E9A0A2B1B6838AAA1314C1BEC3CEB363988B)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  StoredProcedure [dbo].[Usp_Login]    Script Date: 17/12/2023 12:09:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_Login]  
@UserName varchar(50)='',  
@Password varchar(50)=''  
as begin  
declare @UserId int =0,@TotalCnt int =0  
select @UserId=UserId,@TotalCnt=TotalCnt from Employeemaster um  
where LoginName=@UserName and Password=@Password and Status<>3 and IsApporved=1  
if(@TotalCnt>=5)  
begin  
select 0 UserId,'' UserName,'' LoginName,'' Password,'' Email,'' ContactNo,  
''Address,0 IsApporved,-1 Status  
end  
if(@UserId>0)  
begin  
select UserId, UserName, LoginName, Password, Email, ContactNo,  
Address, IsApporved, Status from Employeemaster um  
where UserId=@UserId  
--update Employeemaster set Status=2 where UserId=@UserId  
end  
else  
begin  
Update Employeemaster set @TotalCnt=TotalCnt+1  
where LoginName=@UserName and Status=1 and IsApporved=1  
select 0 UserId,'' UserName,'' LoginName,'' Password,'' Email,'' ContactNo,  
''Address,0 IsApporved,0 Status  
end end  
GO
