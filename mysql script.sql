-- criacao do banco de dados para o ecommerce
 drop database ecommerce;
create database ecommerce;
use ecommerce;
-- criar tabela cliente
CREATE TABLE clients (
  `idClient` INT AUTO_INCREMENT PRIMARY KEY,
  `Pname` VARCHAR(45) NOT NULL,
  `Minit` CHAR(3) NULL,
  `Lname` VARCHAR(20) NULL,
  `CPF` CHAR(11) NOT NULL,
  `Address` VARCHAR(255) NULL,
  `Born` DATE NOT NULL,
  constraint unique_cpf_client unique (CPF)
  );
 alter table clients auto_increment=1;

-- criar tabela produto

CREATE TABLE product (
  idProduct INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Pname varchar(45) not null,
  classification_kids bool default false,
  category enum("Eletronicos","Roupas","Brinquedos","Alimentos","Moveis"),
  description varchar(65) not null,
  value float default 0,
  evaluation float default 0,
  size VARCHAR(10)
  );
  alter table product auto_increment=1;

  
  -- criar tabela pedido
CREATE TABLE  orders (
  idOrder INT AUTO_INCREMENT PRIMARY KEY,
  idOrderClient int,
  orderStatus ENUM("Em andamento", "Processando", "Enviado", "Entregue") DEFAULT 'Em andamento',
  orderDescription VARCHAR(255) ,
  sendValue FLOAT default 0,
  paymentCach bool default false,
  idPayment int,
  constraint fk_orders_client foreign key (idOrderClient) references clients(idClient) on update cascade
  
);
 alter table orders auto_increment=1;
 
   -- criar tabela pagamentos
  -- teminar de implementar a tabela e crie a conexao com as tabelas necessarias, alem disso reflita essa modificacao no diagrama de esquema relacional
  -- criar constraints relacionadas ao pagamento  
create table payments(
  idPayment int not null auto_increment ,
  idclient int not null,
  typePayment enum("Boleto","Cartao","Dois Cartoes","Pix"),
  limitAvailable float,
  paymentDate date,
 PRIMARY KEY (idPayment, idclient)
  );
   alter table payments auto_increment=1;
  -- alter table orders add constraint fk_orders_payment foreign key(idPayment) references payments(idPayment);
  
 
-- criar tabela estoque
  CREATE TABLE productStorage (
	idProdStorage INT AUTO_INCREMENT primary key,
    storageLocation VARCHAR(255),
    quantity int default 0
    );
  alter table productStorage auto_increment=1;
  
-- criar tabela fornecedor  
CREATE TABLE supplier (
  idSupplier INT AUTO_INCREMENT PRIMARY KEY,
  socialName VARCHAR(255) NOT NULL,
  CNPJ CHAR(15) NOT NULL,
  Address VARCHAR(255),
  contact char(11) not null,
  email varchar(45) not null,
  constraint unique_supplier unique(CNPJ)
  );
  alter table supplier auto_increment=1;

-- criar tabela vendedor
CREATE TABLE seller (
  idSeller INT AUTO_INCREMENT PRIMARY KEY,
  socialName VARCHAR(255) NOT NULL,
  abstName varchar(255),
  CNPJ CHAR(15),
  CPF char(9),
  location VARCHAR(45),
  contact char(11) not null,
  email varchar(45) not null,
  constraint unique_cnpj_seller unique(CNPJ),
  constraint unique_cpf_seller unique(CPF)
  );
alter table seller auto_increment=1;
-- tabela relacionamento produto-vendedor

create table productSeller(
	idPseller int,
    idPproduct int,
    productQuantity int default 1,
    primary key(idPseller,idPproduct),
    constraint fk_product_seller foreign key(idPseller) references seller(idSeller),
    constraint fk_product_product foreign key(idPproduct) references product(idProduct)
); 

CREATE TABLE productOrder (
  idPOproduct INT ,
  idPOorder INT ,
  poQuantity int default 1,
  poStatus ENUM("disponivel", "Sem Estoque") NULL DEFAULT 'disponivel',
  PRIMARY KEY (idPOproduct, idPOorder),
  CONSTRAINT fk_productorder_seller FOREIGN KEY (idPOproduct)  REFERENCES product (idProduct),
  CONSTRAINT fk_productorder_product FOREIGN KEY (idPOorder)   REFERENCES orders (idOrder)
  );


CREATE TABLE storageLocarion(
	idLproduct int,
    idLstorage int,
    location varchar(255) not null,
    primary key(idLproduct ,idLstorage),
    constraint fk_storage_location_product foreign key(idLproduct) references product(idProduct),
    constraint fk_storage_location_storage foreign key(idLstorage) references productStorage(idProdStorage)
);

CREATE TABLE productSupplier (
  idPsSupplier INT ,
  idPsProduct INT ,
  quantity int not null,
  PRIMARY KEY (idPsSupplier,  idPsProduct),
  CONSTRAINT fk_product_supplier_supplier FOREIGN KEY (idPsSupplier)  REFERENCES supplier (idSupplier),
  CONSTRAINT fk_product_supplier_product FOREIGN KEY (idPsProduct)   REFERENCES product (idProduct)
  );
  
  

CREATE TABLE deliver (
    idDeliver INT PRIMARY KEY AUTO_INCREMENT,
    idOrder INT,
    deliverDate DATE NOT NULL,
    deliverAddress varchar(60) NOT NULL,
	constraint fk_deliver_order foreign key (idOrder) REFERENCES orders(idOrder)
);
  
  
-- use information_schema;
 -- show tables;
 -- desc referential_constraints;
 -- select * from referential_constraints where constraint_schema = "ecommerce";
