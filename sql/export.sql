USE [master]
GO
/****** Object:  Database [recetas]    Script Date: 08/06/2022 03:32:30 p. m. ******/
CREATE DATABASE [recetas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'recetas', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\recetas.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'recetas_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\recetas_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [recetas] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [recetas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [recetas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [recetas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [recetas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [recetas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [recetas] SET ARITHABORT OFF 
GO
ALTER DATABASE [recetas] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [recetas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [recetas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [recetas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [recetas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [recetas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [recetas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [recetas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [recetas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [recetas] SET  ENABLE_BROKER 
GO
ALTER DATABASE [recetas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [recetas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [recetas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [recetas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [recetas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [recetas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [recetas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [recetas] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [recetas] SET  MULTI_USER 
GO
ALTER DATABASE [recetas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [recetas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [recetas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [recetas] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [recetas] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [recetas] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [recetas] SET QUERY_STORE = OFF
GO
USE [recetas]
GO
/****** Object:  Table [dbo].[categoria]    Script Date: 08/06/2022 03:32:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categoria](
	[id_categoria] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chef]    Script Date: 08/06/2022 03:32:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chef](
	[id_chef] [char](4) NOT NULL,
	[nombre] [varchar](20) NOT NULL,
	[apellido_p] [varchar](20) NOT NULL,
	[apellido_m] [varchar](20) NOT NULL,
	[contrasenia] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_chef] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ingrediente]    Script Date: 08/06/2022 03:32:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ingrediente](
	[id_ingrediente] [char](4) NOT NULL,
	[nombre] [varchar](20) NOT NULL,
	[id_categoria] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_ingrediente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[receta]    Script Date: 08/06/2022 03:32:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[receta](
	[id_receta] [char](4) NOT NULL,
	[id_autor] [char](4) NOT NULL,
	[nombre] [varchar](20) NOT NULL,
	[preparacion] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_receta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recetaIngredientes]    Script Date: 08/06/2022 03:32:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recetaIngredientes](
	[id_receta] [char](4) NOT NULL,
	[id_ingrediente] [char](4) NOT NULL,
	[cantidad] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_receta] ASC,
	[id_ingrediente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ingrediente]  WITH CHECK ADD  CONSTRAINT [fk_categoriaIngrediente] FOREIGN KEY([id_categoria])
REFERENCES [dbo].[categoria] ([id_categoria])
GO
ALTER TABLE [dbo].[ingrediente] CHECK CONSTRAINT [fk_categoriaIngrediente]
GO
ALTER TABLE [dbo].[receta]  WITH CHECK ADD  CONSTRAINT [fk_chefReceta] FOREIGN KEY([id_autor])
REFERENCES [dbo].[chef] ([id_chef])
GO
ALTER TABLE [dbo].[receta] CHECK CONSTRAINT [fk_chefReceta]
GO
ALTER TABLE [dbo].[recetaIngredientes]  WITH CHECK ADD  CONSTRAINT [fk_ingredienteReceta] FOREIGN KEY([id_ingrediente])
REFERENCES [dbo].[ingrediente] ([id_ingrediente])
GO
ALTER TABLE [dbo].[recetaIngredientes] CHECK CONSTRAINT [fk_ingredienteReceta]
GO
ALTER TABLE [dbo].[recetaIngredientes]  WITH CHECK ADD  CONSTRAINT [fk_recetaIngrediente] FOREIGN KEY([id_receta])
REFERENCES [dbo].[receta] ([id_receta])
GO
ALTER TABLE [dbo].[recetaIngredientes] CHECK CONSTRAINT [fk_recetaIngrediente]
GO
/****** Object:  StoredProcedure [dbo].[deleteCategoria]    Script Date: 08/06/2022 03:32:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[deleteCategoria] 
	@id_categoria int
as
begin
	begin try
		delete from categoria where id_categoria=@id_categoria
		select @@ROWCOUNT as 'result'
	end try
	begin catch
		select 0 as 'result'
	end catch
	
end;
GO
/****** Object:  StoredProcedure [dbo].[deleteChef]    Script Date: 08/06/2022 03:32:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[deleteChef] 
	@id_chef char(4)
as
begin
	begin try
		delete from chef where id_chef=@id_chef
		select @@ROWCOUNT as 'result'
	end try
	begin catch
		select 0 as 'result'
	end catch
	
end;
GO
/****** Object:  StoredProcedure [dbo].[deleteIngrediente]    Script Date: 08/06/2022 03:32:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[deleteIngrediente] 
	@id_ingrediente char(4)
as
begin
	begin try
		delete from ingrediente where id_ingrediente=@id_ingrediente
		select @@ROWCOUNT as 'result'
	end try
	begin catch
		select 0 as 'result'
	end catch
	
end;
GO
/****** Object:  StoredProcedure [dbo].[deleteReceta]    Script Date: 08/06/2022 03:32:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[deleteReceta] 
	@id_receta char(4)
as
begin
	begin try
		delete from receta where id_receta=@id_receta
		select @@ROWCOUNT as 'result'
	end try
	begin catch
		select 0 as 'result'
	end catch
end;
GO
/****** Object:  StoredProcedure [dbo].[deleteRecetaIngrediente]    Script Date: 08/06/2022 03:32:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[deleteRecetaIngrediente] 
	@id_receta char(4),
	@id_ingrediente char(4)
as
begin
	begin try
		delete from recetaIngredientes where id_receta=@id_receta and id_ingrediente=@id_ingrediente
		select @@ROWCOUNT as 'result'
	end try
	begin catch
		select 0 as 'result'
	end catch
end;
GO
/****** Object:  StoredProcedure [dbo].[modCategoria]    Script Date: 08/06/2022 03:32:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[modCategoria] 
	@nombre varchar(20), 
	@id_categoria int
as
begin
	begin try
		update categoria set nombre=@nombre where id_categoria=@id_categoria
		select @@ROWCOUNT as 'result'
	end try
	begin catch
		select 0 as 'result'
	end catch
	
end;
GO
/****** Object:  StoredProcedure [dbo].[modChef]    Script Date: 08/06/2022 03:32:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[modChef] 
	@nombre varchar(20), 
	@apellido_p varchar(20), 
	@apellido_m varchar(20), 
	@contrasenia varchar(15),
	@id_chef char(4)
as
begin
	begin try
		update chef set nombre=@nombre, apellido_p=@apellido_p, apellido_m=@apellido_m, contrasenia=@contrasenia where id_chef=@id_chef
		select @@ROWCOUNT as 'result'
	end try
	begin catch
		select 0 as 'result'
	end catch
	
end;
GO
/****** Object:  StoredProcedure [dbo].[modIngrediente]    Script Date: 08/06/2022 03:32:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[modIngrediente] 
	@id_ingrediente char(4),
	@nombre varchar(20), 
	@id_categoria int
as
begin
	begin try
		update ingrediente set nombre=@nombre,id_categoria=@id_categoria where id_ingrediente=@id_ingrediente
		select @@ROWCOUNT as 'result'
	end try
	begin catch
		select 0 as 'result'
	end catch
	
end;
GO
/****** Object:  StoredProcedure [dbo].[modReceta]    Script Date: 08/06/2022 03:32:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[modReceta] 
	@id_receta char(4),
	@id_autor char(4),
	@nombre varchar(20),
	@preparacion varchar(500)
as
begin
	begin try
		update receta set nombre=@nombre,id_autor=@id_autor, preparacion=@preparacion where id_receta=@id_receta
		select @@ROWCOUNT as 'result'
	end try
	begin catch
		select 0 as 'result'
	end catch
end;
GO
/****** Object:  StoredProcedure [dbo].[modRecetaIngrediente]    Script Date: 08/06/2022 03:32:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[modRecetaIngrediente] 
	@id_receta char(4),
	@id_ingrediente char(4),
	@cantidad varchar(20)
as
begin
	begin try
		update recetaIngredientes set cantidad=@cantidad where id_receta=@id_receta and id_ingrediente=@id_ingrediente
		select @@ROWCOUNT as 'result'
	end try
	begin catch
		select 0 as 'result'
	end catch
end;
GO
/****** Object:  StoredProcedure [dbo].[saveCategoria]    Script Date: 08/06/2022 03:32:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[saveCategoria] 
	@nombre varchar(25)
as
begin
	begin try
		if (select count(*) from categoria where nombre=@nombre)=0
		begin
			insert into categoria(nombre) values(@nombre)
			select 1 as 'result', @@IDENTITY as 'id'
		end else
		begin
			select 0 as 'result'
		end

	end try
	begin catch
		select 0 as 'result'
	end catch
end;
GO
/****** Object:  StoredProcedure [dbo].[saveChef]    Script Date: 08/06/2022 03:32:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[saveChef] 
	@nombre varchar(20), 
	@apellido_p varchar(20), 
	@apellido_m varchar(20), 
	@contrasenia varchar(15),
	@id_chef char(4)
as
begin
	begin try
		insert into chef(nombre, apellido_p, apellido_m, contrasenia, id_chef) values(@nombre, @apellido_p, @apellido_m, @contrasenia, @id_chef)
		select 1 as 'result'
	end try
	begin catch
		select 0 as 'result'
	end catch
end;
GO
/****** Object:  StoredProcedure [dbo].[saveIngrediente]    Script Date: 08/06/2022 03:32:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[saveIngrediente] 
	@id_ingrediente char(4),
	@nombre varchar(20),
	@id_categoria int
as
begin
	begin try
		if (select count(*) from ingrediente where nombre=@nombre and id_categoria=@id_categoria)=0
		begin
			insert into ingrediente(id_ingrediente,nombre,id_categoria) values(@id_ingrediente, @nombre, @id_categoria)
			select 1 as 'result'
		end else
		begin
			select 0 as 'result'
		end

	end try
	begin catch
		select 0 as 'result'
	end catch
end;
GO
/****** Object:  StoredProcedure [dbo].[saveReceta]    Script Date: 08/06/2022 03:32:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[saveReceta] 
	@id_receta char(4),
	@id_autor char(4),
	@nombre varchar(20),
	@preparacion varchar(500)
as
begin
	begin try

		insert into receta(id_receta,nombre,id_autor,preparacion) values(@id_receta,@nombre,@id_autor,@preparacion)
		select 1 as 'result'
	end try
	begin catch
		select 0 as 'result'
	end catch
end;
GO
/****** Object:  StoredProcedure [dbo].[saveRecetaIngrediente]    Script Date: 08/06/2022 03:32:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[saveRecetaIngrediente] 
	@id_receta char(4),
	@id_ingrediente char(4),
	@cantidad varchar(20)
as
begin
	begin try

		insert into recetaIngredientes(id_receta,cantidad,id_ingrediente) values(@id_receta,@cantidad,@id_ingrediente)
		select 1 as 'result'
	end try
	begin catch
		select 0 as 'result'
	end catch
end;
GO
USE [master]
GO
ALTER DATABASE [recetas] SET  READ_WRITE 
GO
