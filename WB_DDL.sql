create table piece
	(piece_ID	varchar(7),
	 title		varchar(20) not null,
	 composer	varchar(20) not null,
	 arranger	varchar(20),
	 publisher	varchar(20),
	 primary key (piece_ID),
	 foreign key (piece_ID) references instr_piece_assignment (piece_ID)
	 on delete cascade on update cascade,
	 foreign key (piece_ID) references piece_key (piece_ID)
	 on delete cascade on update cascade,
	 foreign key (piece_ID) references piece_genre (piece_ID)
	 on delete cascade on update cascade
	);

create table instrument
	(instrument_name	varchar(15),
	 category			varchar(15),
	 primary key (instrument_name),
	 foreign key (instrument_name) references instr_piece_assignment (instrument_name)
	 on delete cascade on update cascade
	);

create table instr_piece_assignment
	(piece_ID			varchar(7),
	 instrument_name	varchar(15),
	 primary key (piece_ID, instrument_name),
	 foreign key (piece_ID) references piece (piece_ID)
	 	on delete cascade,
	 foreign key (instrument_name) references instrument (instrument_name)
	);

create table piece_key
	(piece_ID	varchar(7),
	 key  		varchar(13), 
	 primary key (piece_ID, key),
	 foreign key (piece_ID) references piece (piece_ID)
	);

create table piece_genre
	(piece_ID	varchar(7),
	 genre 		varchar(15),
	 primary key (piece_ID, genre),
	 foreign key (piece_ID) references piece (piece_ID)
	);



