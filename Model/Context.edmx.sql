
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 05/19/2022 19:09:34
-- Generated from EDMX file: C:\Users\lautaro\source\repos\Ejerciciouno\Model\Context.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Ejerciciouno];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_EmpleadoCategoria]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Empleadoes] DROP CONSTRAINT [FK_EmpleadoCategoria];
GO
IF OBJECT_ID(N'[dbo].[FK_EmpleadoCliente]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Clientes] DROP CONSTRAINT [FK_EmpleadoCliente];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Categorias]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Categorias];
GO
IF OBJECT_ID(N'[dbo].[Clientes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Clientes];
GO
IF OBJECT_ID(N'[dbo].[Empleadoes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Empleadoes];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Empleadoes'
CREATE TABLE [dbo].[Empleadoes] (
    [IdEmpleado] int IDENTITY(1,1) NOT NULL,
    [CategoriaIdCategoria] int  NOT NULL,
    [Saldo] float  NOT NULL
);
GO

-- Creating table 'Clientes'
CREATE TABLE [dbo].[Clientes] (
    [IdCliente] int IDENTITY(1,1) NOT NULL,
    [EmpleadoIdEmpleado] int  NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Apellido] nvarchar(max)  NOT NULL,
    [FechaNac] datetime  NOT NULL,
    [Telefono] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Categorias'
CREATE TABLE [dbo].[Categorias] (
    [IdCategoria] int IDENTITY(1,1) NOT NULL,
    [NombreCat] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [IdEmpleado] in table 'Empleadoes'
ALTER TABLE [dbo].[Empleadoes]
ADD CONSTRAINT [PK_Empleadoes]
    PRIMARY KEY CLUSTERED ([IdEmpleado] ASC);
GO

-- Creating primary key on [IdCliente] in table 'Clientes'
ALTER TABLE [dbo].[Clientes]
ADD CONSTRAINT [PK_Clientes]
    PRIMARY KEY CLUSTERED ([IdCliente] ASC);
GO

-- Creating primary key on [IdCategoria] in table 'Categorias'
ALTER TABLE [dbo].[Categorias]
ADD CONSTRAINT [PK_Categorias]
    PRIMARY KEY CLUSTERED ([IdCategoria] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [EmpleadoIdEmpleado] in table 'Clientes'
ALTER TABLE [dbo].[Clientes]
ADD CONSTRAINT [FK_EmpleadoCliente]
    FOREIGN KEY ([EmpleadoIdEmpleado])
    REFERENCES [dbo].[Empleadoes]
        ([IdEmpleado])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EmpleadoCliente'
CREATE INDEX [IX_FK_EmpleadoCliente]
ON [dbo].[Clientes]
    ([EmpleadoIdEmpleado]);
GO

-- Creating foreign key on [CategoriaIdCategoria] in table 'Empleadoes'
ALTER TABLE [dbo].[Empleadoes]
ADD CONSTRAINT [FK_EmpleadoCategoria]
    FOREIGN KEY ([CategoriaIdCategoria])
    REFERENCES [dbo].[Categorias]
        ([IdCategoria])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EmpleadoCategoria'
CREATE INDEX [IX_FK_EmpleadoCategoria]
ON [dbo].[Empleadoes]
    ([CategoriaIdCategoria]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------