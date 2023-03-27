create table if not exists clienti(
	numero_cliente serial not null primary key,
	nome character varying not null, 
	cognome character varying not null,
	data_nascita date not null,
	regione_residenza character varying not null
);

create table if not exists fornitori(
	numero_fornitore serial primary key,
	denominazione character varying not null,
	regione_residenza character varying not null
);

create table if not exists fatture(
	numero_fattura serial not null primary key,
	tipologia character varying,
	importo decimal not null,
	iva character varying not null default '20%',
	id_cliente int8 not null,
	constraint fatture_clienti_FK foreign key(id_cliente) references clienti(numero_Cliente)
	on delete cascade on update cascade,
	data_fattura date not null,
	numero_fornitore int8 not null,
	constraint fatture_fornitori_FK foreign key(numero_fornitore) references fornitori(numero_fornitore)
	on delete cascade on update cascade
);

create table if not exists prodotti(
	id_prodotto serial not null primary key,
	descrizione character varying,
	in_produzione boolean not null default false,
	in_commercio boolean not null default false,
	data_attivazione date not null,
	data_disattivazione date not null
);

insert into clienti (nome, cognome, data_nascita, regione_residenza) 
	values ('Mario', 'Rossi', '1967/11/03' 'Marche'),
		   ('Francesco', 'Merola', '2001/03/25', 'Toscana'),
		   ('Antonio', 'Gialli', '1990/01/21', 'Emilia-Romagna');
		   
insert into fornitori (denominazione, regione_residenza)
	values ('Epicode s.r.l', 'Lazio'),
		   ('Ferrari s.p.a', 'Emilia-Romagna'),
		   ('Marelli', 'Lombardia');
		   
insert into fatture(tipologia, importo, iva, id_cliente, data_fattura, numero_fornitore)
	values ('A', '150', '10%', 2, '2023/03/10', 1),
	values ('C', '3200', '5%' 2, '2023/01/21', 2),
	values ('B', '530', 10%, 2, '2023/02/11, 3);
			

insert into prodotti(descrizione, in_produzione, in_commercio, data_attivazione, data_disattivazione)
			values('giocattolo', 'true', 'true', '2005/05/03', '2010/02/01'),
				  ('veicolo', 'false', 'false', '2018/03/12', '2021/12/01'),
				  ('televisore', 'false', 'true', '2020/09/03', '2022/03/27'),	