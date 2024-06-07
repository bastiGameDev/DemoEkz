set ansi_nulls on
go
set ansi_padding on
go
set quoted_identifier on
go

create database [DB_RepairNew]
go

use [DB_RepairNew]
go


create table [dbo].[Client]
(
	[ID_Client] [int] not null identity(1,1),
	[Client_First_Name] [varchar] (50) not null,
	[Client_Second_Name] [varchar] (50) not null,
	[Client_Middle_Name] [varchar] (50) not null
	constraint [PK_Client] primary key clustered
	([ID_Client] ASC) on [PRIMARY],
)
go

create table [dbo].[Status]
(
	[ID_Status] [int] not null identity(1,1),
	[Name_Status] [varchar] (30) not null
	constraint [PK_Status] primary key clustered
	([ID_Status] ASC) on [PRIMARY]
)
go

create table [dbo].[Employee]
(
	[ID_Employee] [int] not null identity(1,1),
	[Employee_First_Name] [varchar] (50) not null,
	[Employee_Second_Name] [varchar] (50) not null,
	[Employee_Middle_Name] [varchar] (50) not null,
	[Role_Employee] varchar (50) not null,
	constraint [PK_Employee] primary key clustered
	([ID_Employee] ASC) on [PRIMARY],
)
go

create table [dbo].[Request]
(
	[ID_Request] [int] not null identity(1,1),
	[Number_Request] [varchar] (6) not null,
	[Date_Request] [date] not null,
	[Item_Request] [varchar] (max) not null,
	[Type_Crash] [varchar] (max) not null,
	[Crash_Discription] [varchar] (max) not null,
	[Comment] [varchar] (500),
	[Client_ID] [int] not null,
	[Employee_ID] [int] not null,
	[Status_ID] [int] not null,
	constraint [PK_Request] primary key clustered
	([ID_Request] ASC) on [PRIMARY],
	constraint [UQ_Number_Request] unique ([Number_Request]),
	constraint [FK_Request_Client] foreign key ([Client_ID])
	references [dbo].[Client] ([ID_Client]), 
	constraint [FK_Request_Employee] foreign key ([Employee_ID])
	references [dbo].[Employee] ([ID_Employee]),
	constraint [FK_Request_Status] foreign key ([Status_ID])
	references [dbo].[Status] ([ID_Status])
)
go

--------





