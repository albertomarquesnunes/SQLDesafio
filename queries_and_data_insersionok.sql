use ecommerce;
show tables;

insert into clients (Pname,Minit,Lname,CPF,Address,Born)
	values("Maria","M","Silva",123456789,"Rua Silva de Prata 29, Carngola- Cidade das flores","1968-11-02"),
		  ("Matheus","O","Pimentel",987654321,"Rua Alemeda 289, Centro -Cidade das flores","2000-12-03"),
          ("Ricardo","F","Silva",45678913,"Rua Alemeda vinha 1009, Centro -Cidade das flores","1972-08-08"),
          ("Julia","S","Franca",789123456,"Rua Lareijas 861, Centro -Cidade das flores","1931-12-05"),
          ("Roberta","G","Assis",98745631,"Av. Koller Alemeda 19, Centro -Cidade das flores","1951-12-22"),
          ("Isabela","M","Cruz",654789123,"Rua Alemeda das flores 28, Centro -Cidade das flores","1943-12-26");

insert into product (Pname,classification_kids, category, description,  evaluation, size,value) values
			("Fone de ouvido",false,"Eletronicos","Serve para telefones celulares e notebooks","4",null,500),
            ("Barbie Elsa",true,"Brinquedos","Ultimo lançamento da Barbie","3",null,1200),
            ("Body Carters",true,"Roupas","Ultimo Lançamento","5",null,15000),
            ("Microfone Vedo - Youtuber",false,"Eletronicos","Alta sensibilidade, baixo ruido","4",null,200),
            ("Sofá retrátil",false,"Moveis","Conforto para seu lar","3","3x57x80",6000),
            ("Farinha de arroz",false,"Alimentos","Ultra-fina","2",null,50),
            ("Fire Stick Amazon",false,"Eletronicos","Com Alexa incluida","3",null,500);
            
            
insert into orders (idOrderClient, orderStatus,orderDescription, sendValue, paymentCach) values
			(1,default, "compra via aplicativo",null,1),
            (2,"Enviado", "compra via aplicativo",50,0),
            (3,"Enviado",null,null,1),
            (4,"Entregue", "compra via web site",150,10);
            
            
insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus) values
						(1,1,2,null),
						(2,1,1,null),
                        (3,2,1,null);
                        
insert into productStorage (storageLocation,quantity) values
						("Rio de Janeiro",1000),
                        ("Rio de Janeiro",500),
                        ("São Paulo",10),
                        ("São Paulo",100),
                        ("São Paulo",10),
                        ("Brasilia",60);
                        
                        
insert into storageLocarion (idLproduct, idLstorage, location) values
					(1,2,"RJ"),
                    (2,6,"GO");
                    
insert into supplier (SocialName, CNPJ, contact,email,Address) values
				("Almeida e filhos",123456789123456,"21975484","eu@eu.com","Rua Alemeda vinha 1009, Centro -Cidade das flores"),
                ("Eletronicos Silva",854519649134457,"21975484","tu@tu.com","Rua Alemeda vinha 1010, Centro -Santos"),
                ("Eletronicos Valma",934567893934695,"21975484","ele@ele.com","Rua Alemeda vinha 11, Centro -Cidade");
                
insert into productsupplier (idPsSupplier, idPsProduct, quantity) values
				(1,1,500),
                (1,2,400),
                (3,4,633),
                (3,3,5),
                (2,5,10);
                
insert into seller (SocialName, AbstName, CNPJ, CPF, location, contact, email) values
				("Tech eletronics",null,123456789456321,null,"Rio de Janeiro",219946287,"nos@nos.pt"),
                ("Botique Durgas",null,null,123456783,"Rio de Janeiro",219567795,"mn.sell@sapo.pt"),
                ("Kids World",null,456789123654485,null,"São Paulo",1198657484,"prime@prime.com,br");

insert into productSeller(idPseller, idPproduct, productQuantity) values
				(1,6,80),
                (2,7,10);
                
 insert into deliver(idOrder, deliverDate, deliverAddress)  values
				(3,"2024-11-02","Rua Lareijas 861, Centro -Cidade das flores"),
                (4,"2024-12-02","Rua Alemeda das flores 28, Centro -Cidade das flores");
                
                
  insert into payments(idclient,typePayment,limitAvailable,paymentDate) values
					(2,"Pix",12000,"2024-11-02"),
                    (3,"Pix",10000,"2024-11-02"),
                    (4,"Pix",15000,"2024-11-02");

                
                        
                        
	
            