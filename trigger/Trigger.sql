use master;
go

drop database Lojainfo2
go

create database Lojainfo2 
go 

use Lojainfo2
GO

create table tb_clientes(
       id int,
       nome nvarchar(100),
       telefone nvarchar(100),
       email nvarchar(100),
)
GO

create table tb_clientes_cp(
       id int,
       nome nvarchar(100),
       telefone nvarchar(100),
       email nvarchar(100),
       Data date,
)
GO

CREATE TRIGGER trgAfterInsertCliente on tb_clientes_cp
FOR INSERT
AS
begin
declare @id int;
declare @nome varchar(100);
declare @telefone varchar(100);
declare @email varchar(100);

declare @audit_action varchar(100);

select @id=i.id from inserted i;
select @nome=i.nome from inserted i;
select @telefone=i.telefone from inserted i;
select @email=i.email from inserted i;

set @audit_action='Registro Inserido';

insert into tb_clientes_cp(id,nome,telefone,email, Data)
values (@id,@nome,@telefone,@email,getdate());

PRINT 'Fim da execucao da trigger after insert cliente'
end
Go

insert into tb_clientes (id,nome,telefone,email) VALUES (1, 'RAQUEL', 25896325,'raquel@hotmail.com');
go

select * from tb_clientes;