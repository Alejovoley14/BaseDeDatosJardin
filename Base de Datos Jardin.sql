create database jardinDeInfantes;

/*drop database jardinDeInfantes*/

use jardinDeInfantes;

/*Creacion de tablas de la BD*/

create table Jardin(
					digirep int,
					nombre varchar(20),
                    domicilio varchar(20),
                    primary key (digirep)
                    );
                    
create table TipoPersona(tipo varchar(20),
						primary key (tipo)
                        );

create table Persona(
					dni int,
                    nombreCompleto varchar(20),
                    fechaNacimiento date,
                    tipo varchar(20),
                    primary key(dni),
                    foreign key(tipo) references TipoPersona(tipo)
                    );
                    
create table Tutor(	
					dni int,
					primary key(dni),
                    foreign key(dni) references Persona(dni)
                    );
                    
create table Niño(	dni int,
                    tutor int,
					primary key(dni),
                    foreign key(dni) references Persona(dni),
                    foreign key(tutor) references Tutor(dni)
					);

create table Tiene(
					digirep int,
					dni int,
					primary key(digirep,dni),
					foreign key(digirep) references Jardin(digirep),
					foreign key(dni) references Persona(dni)
				);

create table Especialidad(
							codigo int,
                            descripcion varchar(20),
                            primary key (codigo)
                            );
create table Docente(  
					dni int,
                    fechaRecibido date,
                    matricula int,
                    especialidad int,
					primary key(dni),
                    foreign key(dni) references Persona(dni),
                    foreign key(especialidad) references Especialidad(codigo)
                    );

create table Observacion(
						codigo int,
                        fecha date,
                        descripcion varchar(20),
						primary key (codigo)
                        );

create table RealizanObservacion(
								dniNiño int,
                                dniDocente int,
                                codigoObservacion int,
								primary key(codigoObservacion,dniDocente),
                                foreign key(dniNiño) references Niño(dni),
                                foreign key(dniDocente) references Docente(dni),
                                foreign key(codigoObservacion) references Observacion(codigo)
                                );
                                
create table Sala(
					codigo int,
                    color varchar(10),
                    nombre varchar(20),
                    ubicacion varchar(20),
                    digirepJardin int,
                    primary key(codigo),
                    foreign key (digirepJardin) references Jardin(digirep)
                    );
                    
create table TipoRincon(
						tipo varchar(20),
                        primary key(tipo)
                        );
                        
create table Rincon(
					codigo int,
                    nombre varchar(20),
                    ubicacion varchar(20),
                    codigoSala int,
                    cantidadMaxNiños int,
                    tipo varchar(20),
                    primary key(codigo,codigoSala),
                    foreign key(codigoSala) references Sala(codigo),
                    foreign key(tipo) references TipoRincon(tipo)
                    );
                    
create table UsanSala(
					dniNiño int,
                    dniDocente int,
                    codigoSala int,
                    fecha date,
                    primary key(dniNiño,codigoSala),
                    foreign key (dniNiño) references Niño(dni),
                    foreign key (dniDocente) references Docente(dni),
                    foreign key (codigoSala) references Sala(codigo)
                    );
                    
create table UtilizanRincon(
							codigoRincon int,
                            codigoSala int,
                            dniNiño int,
                            horas float,
                            fecha date,
                            primary key(codigoRincon,codigoSala,dniNiño),
                            foreign key(codigoRincon) references Rincon(codigo),
                            foreign key(codigoSala) references Sala(codigo),
                            foreign key(dniNiño) references Niño(dni)
                            );
                            
create table Construccion(
							codigoRincon int,
                            codigoSala int,
                            primary key(codigoRincon,codigoSala),
                            foreign key(codigoRincon) references Rincon(codigo),
                            foreign key(codigoSala) references Sala(codigo)
                            );

create table Dramatico(
							codigoRincon int,
                            codigoSala int,
                            primary key(codigoRincon,codigoSala),
                            foreign key(codigoRincon) references Rincon(codigo),
                            foreign key(codigoSala) references Sala(codigo)
                            );
                            
create table Arte(
							codigoRincon int,
                            codigoSala int,
                            primary key(codigoRincon,codigoSala),
                            foreign key(codigoRincon) references Rincon(codigo),
                            foreign key(codigoSala) references Sala(codigo)
                            );
                            
create table Biblioteca(
							codigoRincon int,
                            codigoSala int,
                            primary key(codigoRincon,codigoSala),
                            foreign key(codigoRincon) references Rincon(codigo),
                            foreign key(codigoSala) references Sala(codigo)
                            );
                            
create table Descanso(
							codigoRincon int,
                            codigoSala int,
                            primary key(codigoRincon,codigoSala),
                            foreign key(codigoRincon) references Rincon(codigo),
                            foreign key(codigoSala) references Sala(codigo)
                            );
                            
create table TipoJuguete(
						tipo varchar(20),
                        primary key(tipo)
                        );

create table TipoElemento(
						tipo varchar(30),
                        primary key(tipo)
                        );
                        
 
create table TipoMaterial(
						tipo varchar(20),
                        primary key(tipo)
                        );
                       
create table Material(codigo int,
                      tipo varchar(20),
					  primary key (codigo),
                      foreign key(tipo) references TipoMaterial(tipo)
                    );
                    
create table TipoElementosDeDescanso(
									tipo varchar(20),
                                    primary key(tipo)
                                    );
				
create table Juguete (
						codigoMaterial int,
                        duracion int,
                        nombre varchar(20),
                        tipo varchar (30),
                        codigoRincon int,
                        codigoSala int,
                        primary key(codigoMaterial),
                        foreign key (codigoRincon) references Rincon(codigo),
                        foreign key (codigoSala) references Rincon(codigoSala),
                        foreign key(codigoMaterial) references Material(codigo),
                        foreign key(tipo) references TipoJuguete(tipo)
                        );
                        
create table Elemento (
						codigoMaterial int,
                        tipo varchar (30),
                        primary key(codigoMaterial),
                        foreign key(codigoMaterial) references Material(codigo),
                        foreign key(tipo) references TipoElemento(tipo)
                        );
 
 create table Tematica(
						nombre varchar(20),
                        primary key(nombre)
                        );
                        
create table Disfraz(
					codigoMaterial int,
                    talle int,
                    tematica varchar(20),
					codigoRincon int,
					codigoSala int,
                    cantidadMax int,
                    primary key(codigoMaterial),
                    foreign key(codigoMaterial) references Juguete (codigoMaterial),
                    foreign key (tematica) references Tematica (nombre),
                    foreign key(codigoRincon) references Dramatico(codigoRincon),
                    foreign key(codigoSala) references Dramatico(codigoSala)
                    );
                    
 create table TipoBloque(
						nombre varchar(20),
                        primary key(nombre)
                        );
                        
create table Bloque(
					codigoMaterial int,
                    tipo varchar(20),
                    codigoRincon int,
                    codigoSala int,
                    cantidadMax int,
                    primary key(codigoMaterial),
                    foreign key(codigoMaterial) references Juguete (codigoMaterial),
                    foreign key (tipo) references TipoBloque (nombre),
					foreign key(codigoRincon) references Construccion(codigoRincon),
                    foreign key(codigoSala) references Construccion(codigoSala)
                    );
                    
 create table MaterialAutito(
						nombre varchar(20),
                        primary key(nombre)
                        );
                        
create table Autito(
					codigoMaterial int,
                    material varchar(20),
					codigoRincon int,
                    codigoSala int,
                    cantidadMax int,
                    primary key(codigoMaterial),
                    foreign key(codigoMaterial) references Juguete (codigoMaterial),
                    foreign key (material) references MaterialAutito (nombre),
					foreign key(codigoRincon) references Construccion(codigoRincon),
                    foreign key(codigoSala) references Construccion(codigoSala)
                    );
                    
 create table EstiloMuñeca(
						nombre varchar(20),
                        primary key(nombre)
                        );
                        
create table Muñeca(
					codigoMaterial int,
                    estilo varchar(20),
					codigoRincon int,
                    codigoSala int,
                    cantidadMax int,
                    primary key(codigoMaterial),
                    foreign key(codigoMaterial) references Juguete (codigoMaterial),
                    foreign key (estilo) references EstiloMuñeca (nombre),
                    foreign key(codigoRincon) references Dramatico(codigoRincon),
                    foreign key(codigoSala) references Dramatico(codigoSala)
                    );
                    
                    
create table ElementosDeDescanso( 
								codigoMaterial int,
								codigoRincon int,
								codigoSala int,
                                cantidadMax int,
                                tipo varchar (30),
                                primary key (codigoMaterial),
                                foreign key(codigoMaterial) references Elemento(codigoMaterial),
								foreign key(codigoRincon) references Descanso(codigoRincon),
								foreign key(codigoSala) references Descanso(codigoSala),
                                foreign key(tipo) references TipoElementosDeDescanso(tipo)
                                );
                            
create table Manta(
					codigoMaterial int,
                    primary key(codigoMaterial),
                    foreign key(codigoMaterial) references ElementosDeDescanso(codigoMaterial)
                    );
                    
create table Almohada(
					codigoMaterial int,
                    primary key(codigoMaterial),
                    foreign key(codigoMaterial) references ElementosDeDescanso(codigoMaterial)
                    );
                    
create table Colchoneta(
					codigoMaterial int,
                    primary key(codigoMaterial),
                    foreign key(codigoMaterial) references ElementosDeDescanso(codigoMaterial)
                    );
                    
create table Peluche(
					codigoMaterial int,
                    primary key(codigoMaterial),
                    foreign key(codigoMaterial) references ElementosDeDescanso(codigoMaterial)
                    );
                    
create table Libro(
					codigoMaterial int,
                    tipo varchar(20),
                    tema varchar(20),
                    material varchar(20),
                    codigoRincon int,
                    codigoSala int,
                    cantidadMax int,
                    primary key(codigoMaterial),
                    foreign key(codigoMaterial) references Elemento(codigoMaterial),
					foreign key(codigoRincon) references Biblioteca(codigoRincon),
                    foreign key(codigoSala) references Biblioteca(codigoSala)
                    );
                    
create table Util(
					codigoMaterial int,
                    tipo varchar(20),
                    color varchar(10),
                    codigoRincon int,
                    codigoSala int,
                    cantidadMax int,
                    primary key(codigoMaterial),
                    foreign key(codigoMaterial) references Elemento(codigoMaterial),
					foreign key(codigoRincon) references Arte(codigoRincon),
                    foreign key(codigoSala) references Arte(codigoSala)
                    );
                    
/* Insercion de Datos */

insert into Jardin values 	(89,'nombre1','domicilio1'),
							(65,'nombre2','domicilio2'),
                            (23,'nombre3','domicilio3'),
                            (48,'nombre4','domicilio4');

insert into TipoPersona values ('Niño'),('Tutor'),('Docente');

insert into Persona values (1,'nombre1','2015-08-03','Niño'),
						   (2,'nombre2','2015-08-04','Niño'),
                           (3,'nombre3','2015-08-05','Niño'),
                           (4,'nombre4','2015-08-06','Niño'),
                           (5,'nombre5','2015-08-07','Niño'),
                           (6,'nombre6','2015-08-08','Niño'),
                           (7,'nombre7','1970-08-03','Tutor'),
                           (8,'nombre8','1970-08-04','Tutor'),
                           (9,'nombre9','1970-08-05','Tutor'),
                           (10,'nombre10','1970-08-06','Tutor'),
                           (11,'nombre11','1970-08-07','Tutor'),
                           (12,'nombre12','1970-08-08','Tutor'),
                           (13,'nombre13','1980-08-09','Docente'),
                           (14,'nombre14','1980-08-10','Docente'),
                           (15,'nombre15','1980-08-11','Docente'),
                           (16,'nombre16','1980-08-12','Docente'),
                           (17,'nombre17','1980-08-13','Docente'),
                           (18,'nombre18','1980-08-14','Docente'),
                           (19,'nombre19','1980-08-15','Docente'),
                           (20,'nombre20','2015-08-21','Niño'),
                           (21,'nombre21','1970-08-22','Tutor');

insert into Tiene values (89,1),
						 (89,2),
						 (89,3),
						 (89,4),
						 (89,5),
						 (89,6),
						 (89,7),
						 (89,8),
						 (89,9),
						 (89,10),
						 (89,11),
						 (89,12),
						 (89,13),
						 (89,14),
                         (89,15),
                         (89,16),
                         (89,17),
                         (89,18),
                         (89,19),
                         (89,20),
                         (89,21);
                         
insert into Tutor values (7),
						 (8),
						 (9),
						 (10),
						 (11),
						 (12),
                         (21);

insert into Niño values (1,7),
						(2,8),
						(3,9),
						(4,10),
						(5,11),
						(6,12),
                        (20,21);

insert into Especialidad values (1,'Titular'),
								(2,'Suplente'),
								(3,'Auxiliar'),
								(4,'Musica'),
								(5,'Ingles'),
								(6,'Ed.Fisica'),
								(7,'Computacion');

insert into Docente values  (13,'2005-01-01',1,1),
							(14,'2005-01-02',2,2),
							(15,'2005-01-03',3,3),
							(16,'2005-01-04',4,4),
							(17,'2005-01-05',5,5),
							(18,'2005-01-06',6,6),
							(19,'2005-01-07',7,7);
                            
insert into Observacion values (1,'2010-05-01','positiva'),
							  (2,'2010-05-02','positiva'),
							  (3,'2010-05-03','positiva'),
							  (4,'2010-05-04','negativa'),
							  (5,'2010-05-05','negativa'),
							  (6,'2010-05-06','negativa'),
                              (7,'2010-05-06','negativa');
                              
insert into RealizanObservacion values (1,13,1),
									  (2,14,2),
									  (3,15,3),
									  (4,16,4),
									  (5,17,5),
									  (6,18,6),
									  (20,19,7);
                                      
insert into Sala values (1,'rojo','nombre1','primero',89),
						(2,'verde','nombre2','segundo',89),
						(3,'amarilla','nombre3','tercero',89),
						(4,'azul','nombre4','cuarto',89),
						(5,'rosa','nombre5','quinto',89),
						(6,'celeste','nombre6','sexto',89),
						(7,'violeta','nombre7','septimo',89),
						(8,null,'Computacion','octavo',89),
                        (9,null,'Ingles','noveno',89),
                        (10,null,'Musica','decimo',89),
                        (11,null,'Ed.Fisica','decimoprimero',89);

insert into UsanSala values (1,13,1,'2015-10-11'),
							(2,14,2,'2015-10-11'),
							(3,15,3,'2015-10-11'),
							(4,16,4,'2015-10-11'),
							(5,17,5,'2015-10-11'),
							(6,18,6,'2015-10-11'),
							(20,19,7,'2015-10-11'),
							(1,19,8,'2015-10-11'),
							(2,17,9,'2015-10-11'),
							(3,16,10,'2015-10-11'),
							(4,18,11,'2015-10-11');

insert into tipoRincon values ('Construccion'),
							  ('Dramatico'),
                              ('Arte'),
                              ('Biblioteca'),
                              ('Descanso');
                              
insert into Rincon values   (1,'rincon1','primero',1,20,'Construccion'),
							(2,'rincon2','segundo',1,20,'Arte'),
							(3,'rincon3','tercero',1,20,'Descanso'),
							(4,'rincon4','cuarto',1,20,'Dramatico'),
							(5,'rincon5','quinto',1,20,'Biblioteca'),
							
							(6,'rincon6','primero',2,20,'Dramatico'),
							(7,'rincon7','segundo',2,20,'Biblioteca'),
							(8,'rincon8','tercero',2,20,'Construccion'),
							(9,'rincon9','cuarto',2,20,'Arte'),
							(10,'rincon10','quinto',2,20,'Descanso'),
							
							(11,'rincon6','primero',3,20,'Dramatico'),
							(12,'rincon7','segundo',3,20,'Biblioteca'),
							(13,'rincon8','tercero',3,20,'Construccion'),
							(14,'rincon9','cuarto',3,20,'Arte'),
							(15,'rincon10','quinto',3,20,'Descanso'),
							
							(16,'rincon6','primero',4,20,'Dramatico'),
							(17,'rincon7','segundo',4,20,'Biblioteca'),
							(18,'rincon8','tercero',4,20,'Construccion'),
							(19,'rincon9','cuarto',4,20,'Arte'),
							(20,'rincon10','quinto',4,20,'Descanso'),
							
							(21,'rincon6','primero',5,20,'Dramatico'),
							(22,'rincon7','segundo',5,20,'Biblioteca'),
							(23,'rincon8','tercero',5,20,'Construccion'),
							(24,'rincon9','cuarto',5,20,'Arte'),
							(25,'rincon10','quinto',5,20,'Descanso');

insert into UtilizanRincon values   (1,1,1,0.3,'2016-05-05'),
									(2,1,1,0.6,'2016-05-06'),
									(3,1,1,0.2,'2016-05-07'),
									(4,1,1,0.5,'2016-05-08'),
									(5,1,1,0.2,'2016-05-09'),

									(1,1,3,0.4,'2016-05-06'),
									(2,1,3,0.5,'2016-05-06'),
									(3,1,3,0.6,'2016-05-06'),


									(1,2,2,0.3,'2016-05-05'),
									(9,2,2,0.5,'2016-05-05'),
									(3,2,2,0.4,'2016-05-05'),
									(4,2,2,0.2,'2016-05-05'),
									(5,2,2,0.3,'2016-05-05'),

									(1,4,4,0.4,'2016-05-05'),
									(14,4,4,0.5,'2016-05-05'),
									(3,4,4,0.9,'2016-05-05'),
									(4,4,4,1.5,'2016-05-05'),

									(1,1,5,2,'2016-05-05'),
									(2,1,5,1.2,'2016-05-05'),

									(2,3,6,2,'2016-08-05'),
									(3,3,6,3,'2016-08-05'),
									(4,3,6,0.5,'2016-08-05');			

insert into Construccion values (1,1),
								(8,2),
                                (13,3),
                                (18,4),
                                (23,5);

insert into Dramatico values (4,1),
							 (6,2),
                             (11,3),
                             (16,4),
                             (21,5);
							
insert into Biblioteca values (5,1),
							  (7,2),
                              (12,3),
                              (17,4),
                              (22,5);
                              
insert into Arte values (2,1),
						(9,2),
                        (14,3),
                        (19,4),
                        (24,5);
                        
insert into Descanso values (3,1),
							(10,2),
                            (15,3),
                            (20,4),
                            (25,5);

insert into TipoMaterial values ('Juguete'),
								('Elemento'); 

insert into Material values (1,'Juguete'),
							(2,'Juguete'),
							(3,'Juguete'),
                            
							(4,'Juguete'),
							(5,'Juguete'),
							(6,'Juguete'),
                            
							(7,'Juguete'),
							(8,'Juguete'),
							(9,'Juguete'),
                            
							(10,'Juguete'),
                            (11,'Juguete'),
                            (12,'Juguete'),
                            
							(13,'Elemento'),
							(14,'Elemento'),
							(15,'Elemento'),
							(16,'Elemento'),
                            
							(17,'Elemento'),
							(18,'Elemento'),
							(19,'Elemento'),
							(20,'Elemento'),
                            
							(21,'Elemento'),
							(22,'Elemento'),
                            (23,'Elemento'),
                            (24,'Elemento'),
                            
                            (25,'Elemento'),
                            (26,'Elemento'),
                            (27,'Elemento'),
                            (28,'Elemento'),
                            
                            (29,'Elemento'),
                            (30,'Elemento'),
                            (31,'Elemento'),
                            (32,'Elemento'),
                            
                            (33,'Elemento'),
                            (34,'Elemento'),
                            (35,'Elemento'),
                            (36,'Elemento'),
                            (37,'Elemento'),
                            
                            (38,'Elemento'),
                            (39,'Elemento'),
                            (40,'Elemento'),
                            (41,'Elemento'),
                            (42,'Elemento');
                            
insert into TipoJuguete values  ('Disfraz'),
								('Bloque'),
								('Autito'),
								('Muñeca');

insert into Juguete values  (1,10,'juguete1','Disfraz',4,1),
							(2,10,'juguete2','Disfraz',6,2),
                            (3,10,'juguete3','Disfraz',11,3),
                            (4,10,'juguete4','Disfraz',16,4),
                            (5,10,'juguete5','Disfraz',21,5),
                            
							(6,5,'juguete6','Bloque',1,1),
							(7,5,'juguete7','Bloque',8,2),
                            (8,5,'juguete8','Bloque',13,3),
                            (9,5,'juguete9','Bloque',18,4),
                            (10,5,'juguete10','Bloque',23,5),
                            
							(11,12,'juguete11','Autito',1,1),
                            (12,12,'juguete12','Autito',8,2),
                            (13,12,'juguete13','Autito',13,3),
                            (14,12,'juguete14','Autito',18,4),
                            (15,12,'juguete15','Autito',23,5),
                            
                            (16,13,'juguete16','Muñeca',4,1),
                            (17,13,'juguete17','Muñeca',6,2),
                            (18,13,'juguete18','Muñeca',11,3),
                            (19,13,'juguete19','Muñeca',16,4),
                            (20,13,'juguete20','Muñeca',21,5);       

insert into Tematica  values  ('tematica1'),
							  ('tematica2'),
							  ('tematica3'),
							  ('tematica4'),
							  ('tematica5');

insert into Disfraz values  (1,2,'tematica1',4,1,15),
							(2,3,'tematica2',6,2,15),
							(3,1,'tematica3',11,3,15),
							(4,2,'tematica4',16,4,15),
							(5,3,'tematica5',21,5,15);

insert into TipoBloque values   ('bloque1'),
								('bloque2'),
								('bloque3'),
								('bloque4'),
								('bloque5');

insert into Bloque values   (6,'bloque1',1,1,20),
							(7,'bloque2',8,2,20),
							(8,'bloque3',13,3,20),
							(9,'bloque4',18,4,20),
							(10,'bloque5',23,5,20);
                        
insert into MaterialAutito values   ('autito1'),
									('autito2'),
									('autito3'),
									('autito4'),
									('autito5');

insert into Autito values   (11,'autito1',1,1,20),
							(12,'autito2',8,2,20),
							(13,'autito3',13,3,20),
							(14,'autito4',18,4,20),
							(15,'autito5',23,5,20);
                            
 insert into EstiloMuñeca values ('estilo1'),
								 ('estilo2'),
								 ('estilo3'),
								 ('estilo4'),
								 ('estilo5');

insert into Muñeca values   (16,'estilo1',4,1,20),
							(17,'estilo2',6,2,20),
							(18,'estilo3',11,3,20),
							(19,'estilo4',16,4,20),
							(20,'estilo5',21,5,20);

insert into TipoElemento values ('Elementos de descanso'),
								('Libro'),
								('Util');   
                                
insert into Elemento values (13,'Elementos de descanso'),
							(14,'Elementos de descanso'),
							(15,'Elementos de descanso'),
                            (16,'Elementos de descanso'),
							(17,'Elementos de descanso'),
                            
							(18,'Elementos de descanso'),
							(19,'Elementos de descanso'),
                            (20,'Elementos de descanso'),
							(21,'Elementos de descanso'),
							(22,'Elementos de descanso'),
                            
							(23,'Elementos de descanso'),
                            (24,'Elementos de descanso'),
							(25,'Elementos de descanso'),
							(26,'Elementos de descanso'),
							(27,'Elementos de descanso'),
                            
                            (28,'Elementos de descanso'),
                            (29,'Elementos de descanso'),
							(30,'Elementos de descanso'),
							(31,'Elementos de descanso'),
                            (32,'Elementos de descanso'),
                            
                            (33,'Libro'),
                            (34,'Libro'),
                            (35,'Libro'),
                            (36,'Libro'),
                            (37,'Libro'),
                            
                            (38,'Util'),
                            (39,'Util'),
                            (40,'Util'),
                            (41,'Util'),
                            (42,'Util');
                            

insert into TipoElementosDeDescanso values  ('Manta'),
											('Almohada'),
											('Colchoneta'),
											('Peluche');
                                            
insert into ElementosDeDescanso values   (13,3,1,15,'Manta'),
										(14,10,2,15,'Manta'),
										(15,15,3,15,'Manta'),
										(16,20,4,15,'Manta'),
										(17,25,5,15,'Manta'),
                                        
                                        (18,3,1,15,'Almohada'),
										(19,10,2,15,'Almohada'),
										(20,15,3,15,'Almohada'),
										(21,20,4,15,'Almohada'),
										(22,25,5,15,'Almohada'),
                                        
										(23,3,1,15,'Colchoneta'),
										(24,10,2,15,'Colchoneta'),
										(25,15,3,15,'Colchoneta'),
										(26,20,4,15,'Colchoneta'),
										(27,25,5,15,'Colchoneta'),
                                        
										(28,3,1,15,'Peluche'),
										(29,10,2,15,'Peluche'),
										(30,15,3,15,'Peluche'),
										(31,20,4,15,'Peluche'),
										(32,25,5,15,'Peluche');
                                        
insert into Manta values (13),
						 (14),
						 (15),
						 (16),
						 (17);	

insert into Almohada values (18),
							(19),
							(20),
							(21),
							(22);

insert into Colchoneta values (23),
							  (24),
							  (25),
							  (26),
							  (27);
                              
insert into Peluche values  (28),
							(29),
							(30),
							(31),
							(32);


insert into Libro values (33,'fantasia','tema1','material1',5,1,20),
						 (34,'accion','tema2','material2',7,2,20),
						 (35,'historia','tema3','material3',12,3,20),
						 (36,'infantil','tema4','material4',17,4,20),
						 (37,'drama','tema5','material5',22,5,20);
                         
insert into Util values (38,'lapicera','rojo',2,1,20),
						(39,'lapiz','violeta',9,2,20),
						(40,'goma','negra',14,3,20),
						(41,'hoja','balnca',19,4,20),
						(42,'fibra','azul',24,5,20);
                        
/* Consultas */

/*I- ¿Cuáles son los rincones más populares, por tipo en el último año? */ 

select max(X.cantidad) as Cantidad,X.tipo,X.nombre
from 
				(select count(ur.codigoRincon) as cantidad,r.nombre as nombre,r.tipo as tipo
				from UtilizanRincon  ur inner join Rincon r on r.codigo=ur.codigorincon
				where year(ur.fecha)=2016
				group by r.nombre,r.tipo) as X
group by X.tipo;

/*II- ¿Qué juguetes alcanzan su duración máxima antes del segundo trimestre? */

select distinct(j.tipo)
from
(select count(ur.codigoRincon) as cantidad,codigoRincon
from utilizanRincon ur
group by codigoRincon) as X inner join Juguete j on j.codigoRincon=X.codigoRincon inner join utilizanRincon ur on ur.codigoRincon=X.codigoRincon
where X.cantidad>=j.duracion and month(ur.fecha)<=6;

/*III- Reporte de asignación de docentes a salas */

select p.nombreCompleto as NombreDocente,us.codigoSala as Sala
from UsanSala us inner join Persona p on us.dniDocente=p.dni;

/*IV- Lista de inscripción de niños a salas en orden alfabético */

select p.nombreCompleto as NombreNiño,us.codigoSala as Sala
from UsanSala us inner join Persona p on us.dniNiño=p.dni
order by p.nombreCompleto ASC;

/*V- ¿Quiénes son los niños que juegan en todos los rincones a lo largo de un mes? */

select dniNiño,p.nombreCompleto
from UtilizanRincon ur inner join Persona p on p.dni=ur.dniNiño
where month(ur.fecha)=5
group by ur.dniNiño
having count(ur.dniNiño) = (select count(tipo) from TipoRincon);
 
/*select distinct(ur.dniNiño)
from
(select distinct(ur.dniNiño) as Niño,X.sala as Sala,X.cantidadRincones as CantidadRincones
from
		(select count(distinct(ur.codigoRincon)) as cantidadRincones,ur.codigoSala as sala
		from UtilizanRincon ur
		group by ur.codigoSala) as X inner join utilizanrincon ur on ur.codigoSala=X.sala) as Y 
        inner join UtilizanRincon ur on ur.codigoSala=Y.Sala
group by ur.dniNiño
having count(ur.dniNiño)=(select distinct(HelpMe.CantidadRincones)
							from HelpMe inner join UtilizanRincon ur on ur.codigoSala=HelpMe.sala);*/
 
/*select *
 from HelpMe;
 create view HelpMe as
 (select distinct(X.sala) as Sala,X.cantidadRincones as CantidadRincones
from
		(select count(distinct(ur.codigoRincon)) as cantidadRincones,ur.codigoSala as sala
		from UtilizanRincon ur
		group by ur.codigoSala) as X inner join utilizanrincon ur on ur.codigoSala=X.sala);
	
select ur.dniNiño
from UtilizanRincon ur inner join HelpMe h on h.Niño=ur.dniNiño;*/
 
 /*CON DIVISION NO ENCUENTRO LA FORMA select dniNiño
 from UtilizanRincon ur1
 where not exists
				 (select distinct(tr.tipo)
				 from TipoRincon tr inner join Rincon r on r.tipo=tr.tipo
				 where not exists
								(select *
								from utilizanrincon ur
								where ur.codigoRincon=r.codigo and ur.codigoSala=r.codigoSala and ur.dniNiño=ur1.dniNiño));*/

/*VI- De acuerdo al modelo propuesto, ¿puede suceder que haya niños que no jugaron
nunca en algún rincón? Justifique */

/* Si, ya que un niño debe estar designado a una sala en la relacion "UsanSala" (para que tenga coherencia la base de datos), y si no es cargado en la relacion "UtilizanRincon", 
significa que el niño no utiliza ningun rincon, pero tiene una sala designada. */

select us.dniNiño as DNI, us.CodigoSala as Sala
from UsanSala as us 
where not  dniNiño in ( select ur.dniNiño 
						from UtilizanRincon as ur);

/*VII- Obtener las tasas de uso en un trimestre, de cada tipo de rincón, por sala */

select avg(horas) as TasaDeUso, ur.codigoSala as Sala,r.tipo as TipoDeRincon
from utilizanRincon ur inner join Rincon r on r.codigo=ur.codigoRincon
where month(fecha)>=5 and month(fecha)<8
group by r.tipo,ur.codigoSala
order by ur.codigoSala;

/*VIII- Obtener las tasas de uso en un trimestre, de cada tipo de juguete, por sala. */

select avg(horas) as TasaDeUso, ur.codigoSala as Sala,j.tipo as TipoDeRincon
from utilizanRincon ur inner join Juguete j on ur.codigoRincon=j.codigoRincon
where month(fecha)>=5 and month(fecha)<8
group by ur.codigoSala,j.tipo
order by ur.codigoSala;