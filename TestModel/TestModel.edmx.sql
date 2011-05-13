
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 05/09/2011 15:18:46
-- Generated from EDMX file: c:\users\thompsonj.ibahealth\documents\visual studio 2010\Projects\TestModel\TestModel\TestModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [EFTestDB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------
DROP TABLE [dbo].[ladies]
DROP TABLE [dbo].[gentlemen]
DROP TABLE [dbo].[towns]

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Gentlemen'
CREATE TABLE [dbo].[Gentlemen] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] varchar(255)  NOT NULL
);
GO

-- Creating table 'Towns'
CREATE TABLE [dbo].[Towns] (
    [Name] varchar(255)  NOT NULL
);
GO

-- Creating table 'Ladies'
CREATE TABLE [dbo].[Ladies] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] varchar(255)  NOT NULL,
    [Gentleman_Id] int  NOT NULL,
    [Town_Name] varchar(255)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Gentlemen'
ALTER TABLE [dbo].[Gentlemen]
ADD CONSTRAINT [PK_Gentlemen]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Name] in table 'Towns'
ALTER TABLE [dbo].[Towns]
ADD CONSTRAINT [PK_Towns]
    PRIMARY KEY CLUSTERED ([Name] ASC);
GO

-- Creating primary key on [Id] in table 'Ladies'
ALTER TABLE [dbo].[Ladies]
ADD CONSTRAINT [PK_Ladies]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Gentleman_Id] in table 'Ladies'
ALTER TABLE [dbo].[Ladies]
ADD CONSTRAINT [FK_GentlemanLady]
    FOREIGN KEY ([Gentleman_Id])
    REFERENCES [dbo].[Gentlemen]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_GentlemanLady'
CREATE INDEX [IX_FK_GentlemanLady]
ON [dbo].[Ladies]
    ([Gentleman_Id]);
GO

-- Creating foreign key on [Town_Name] in table 'Ladies'
ALTER TABLE [dbo].[Ladies]
ADD CONSTRAINT [FK_TownLady]
    FOREIGN KEY ([Town_Name])
    REFERENCES [dbo].[Towns]
        ([Name])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_TownLady'
CREATE INDEX [IX_FK_TownLady]
ON [dbo].[Ladies]
    ([Town_Name]);
GO


-- --------------------------------------------------
-- Inserting test DATA
-- --------------------------------------------------

SET IDENTITY_INSERT [dbo].[Gentlemen] ON;

INSERT INTO [dbo].[Towns] (Name) VALUES ('Berlin');
INSERT INTO [dbo].[Towns] (Name) VALUES ('Rome');
INSERT INTO [dbo].[Towns] (Name) VALUES ('Paris');

INSERT INTO [dbo].[Gentlemen] (Id, Name) VALUES (1, 'Johnny');

INSERT INTO [dbo].[Ladies] (Name, Town_Name, Gentleman_Id) VALUES ('Frieda', 'Berlin', 1);
INSERT INTO [dbo].[Ladies] (Name, Town_Name, Gentleman_Id) VALUES ('Adelita', 'Berlin', 1);
INSERT INTO [dbo].[Ladies] (Name, Town_Name, Gentleman_Id) VALUES ('Milla', 'Berlin', 1);
INSERT INTO [dbo].[Ladies] (Name, Town_Name, Gentleman_Id) VALUES ('Georgine', 'Paris', 1);
INSERT INTO [dbo].[Ladies] (Name, Town_Name, Gentleman_Id) VALUES ('Nannette', 'Paris', 1);
INSERT INTO [dbo].[Ladies] (Name, Town_Name, Gentleman_Id) VALUES ('Verona', 'Rome', 1);
INSERT INTO [dbo].[Ladies] (Name, Town_Name, Gentleman_Id) VALUES ('Gavriella', 'Rome', 1);

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------