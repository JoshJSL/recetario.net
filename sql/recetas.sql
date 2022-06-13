drop database recetas
use aviones
create database recetas
use recetas

create table chef(
	id_chef char(4) primary key not null,
	nombre varchar(20) not null,
	apellido_p varchar(20) not null,
	apellido_m varchar(20) not null,
	contrasenia varchar(15) not null
	)

create table categoria(
	id_categoria int primary key not null identity(1,1),
	nombre varchar(25) not null
	)

create table ingrediente(
	id_ingrediente char(4) primary key not null,
	nombre varchar(20) not null,
	id_categoria int not null,
	constraint fk_categoriaIngrediente foreign key (id_categoria) references categoria(id_categoria)
)

create table receta(
	id_receta char(4) not null primary key,
	id_autor char(4) not null,
	nombre varchar(20) not null,
	preparacion varchar(500) not null,
	constraint fk_chefReceta foreign key (id_autor) references chef(id_chef)
)

create table recetaIngredientes(
	id_receta char(4) not null,
	id_ingrediente char(4) not null,
	cantidad varchar(20) not null,
	primary key(id_receta,id_ingrediente),
	constraint fk_recetaIngrediente foreign key (id_receta) references receta(id_receta),
	constraint fk_ingredienteReceta foreign key (id_ingrediente) references ingrediente(id_ingrediente)
)



insert into chef values('C001', 'Joshua', 'Soria', 'L�scares','1234')
insert into chef values('C002', 'Brenda Lisbeth', 'Jim�nez', 'Cortes','1709')

insert into categoria(nombre) values( 'Fruta')
insert into categoria (nombre) values( 'Cereal')
insert into categoria (nombre) values( 'Leguminosa')
insert into categoria (nombre) values('Verdura');
insert into categoria (nombre) values('Origen animal');

insert into ingrediente values('I001','Frijol',3)
insert into ingrediente values('I002','Lenteja',3)
insert into ingrediente values('I003','Maiz',2)
insert into ingrediente values('I004','Arroz',2)
insert into ingrediente values('I005','Morita',1)
insert into ingrediente values('I006','Mango',1)
insert into ingrediente values('I007','Fresa',1)

insert into receta values('R001','C001', 'Arroz con frijoles','Cocine el arroz, cocine los frijoles, mezclar en el plato')
insert into recetaIngredientes values('R001','I001', '2 tazas')
insert into recetaIngredientes values('R001','I004', '2 tazas')

select * from receta r
	inner join recetaIngredientes ri on r.id_receta = ri.id_receta
	inner join ingrediente i on i.id_ingrediente = ri.id_ingrediente
	inner join categoria ct on ct.id_categoria = i.id_categoria
	inner join chef c on c.id_chef = r.id_autor


create procedure saveChef
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

create procedure modChef
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

--exec modChef 'Joshua','Soria','Lascares','1234567','C001'

create procedure deleteChef
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

--exec deleteChef 'C003'

---------------------------
create procedure saveCategoria
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

--exec saveCategoria 'Verduradsas'

create procedure modCategoria
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

--exec modCategoria 'Verdura',44

create procedure deleteCategoria
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

--exec deleteCategoria 55
-----------------------------

create procedure saveIngrediente
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


--exec saveIngrediente 'I009','Berenjdfena', 4

create procedure modIngrediente
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

--exec modIngrediente 'I008','Berenjejena',44

create procedure deleteIngrediente
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

--exec deleteIngrediente 'I009'
-----------------------------

create procedure saveReceta
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

--exec saveReceta 'R002','C002','Arroz con frijol','Cocine el arroz, cocine los frijoles, mezclar en el plato'

create procedure modReceta
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

--exec modReceta 'R001','C002','Arroz con frijol','Cocine el arroz, cocine los frijoles, mezclar en el plato'

create procedure deleteReceta
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

--exec deleteReceta 'R002'
-------------------------
create procedure saveRecetaIngrediente
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

--exec saveRecetaIngrediente 'R001','I002','2 tazas'

create procedure modRecetaIngrediente
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

--exec modRecetaIngrediente 'R009','I000','15 tazas'

create procedure deleteRecetaIngrediente
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

--exec deleteRecetaIngrediente 'R001','I002'

--select * from recetaIngredientes


--select TOP 1 id_receta from receta order by id_receta DESC

--select * from chef
