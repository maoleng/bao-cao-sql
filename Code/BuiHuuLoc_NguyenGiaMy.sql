CREATE DATABASE bao_cao_sql;
USE bao_cao_sql;


create table information( 
	id int identity PRIMARY KEY,
	birthday nvarchar(50),
	religion nvarchar(250),
	phone nvarchar(250),
	address nvarchar(250),
	gender nvarchar(250),
	identify_card nvarchar(250),
	ethnic nvarchar(250),
	birthplace nvarchar(250),
	area nvarchar(250),
);

create table student( 
	id int identity PRIMARY KEY,
	name nvarchar(250),
	student_card_id nvarchar(50),
	password nvarchar(250),
	role int,
	information_id int not null,
	foreign key (information_id) references information(id),
);
create table teacher( 
	id int identity PRIMARY KEY,
	name nvarchar(250),
	teacher_card_id nvarchar(50),
	password nvarchar(250),
	role int,
	information_id int not null,
	foreign key (information_id) references information(id),
);
create table form( 
	id int identity PRIMARY KEY,
	title nvarchar(250),
	content text,
	created_at datetime,
	student_id int not null,
	foreign key (student_id) references student(id),
	teacher_id int null,
	foreign key (teacher_id) references teacher(id),
	parent_id int null,
	foreign key (parent_id) references form(id),
);
create table files( 
	id int identity PRIMARY KEY,
	source nvarchar(50),
	size float(53),
	created_at datetime,
	form_id int not null,
	foreign key (form_id) references form(id),
);
create table room_detail( 
	id int identity PRIMARY KEY,
	max int,
	description nvarchar(250),
	price_per_month float,
);
create table building( 
	id int identity PRIMARY KEY,
	name nvarchar(50),
);
create table floor( 
	id int identity PRIMARY KEY,
	name nvarchar(50),
	building_id int not null,
	foreign key (building_id) references building(id),
);
create table room( 
	id int identity PRIMARY KEY,
	name nvarchar(50),
	status int,
	amount int,
	floor_id int not null,
	foreign key (floor_id) references floor(id),
	room_detail_id int not null,
	foreign key (room_detail_id) references room_detail(id),
);
create table contract( 
	id int identity PRIMARY KEY,
	season int,
	start_date datetime,
	end_date datetime,
	is_accept bit,
	register_at datetime,
	student_id int not null,
	foreign key (student_id) references student(id),
	room_id int not null,
	foreign key (room_id) references room(id),
);
create table bill( 
	id int identity PRIMARY KEY,
	price float,
	pay_start_time datetime,
	pay_end_time datetime,
	is_paid bit,
	contract_id int not null,
	foreign key (contract_id) references contract(id),
);
create table period( 
	id int identity PRIMARY KEY,
	period int,
	started_at time,
);
create table schedule( 
	id int identity PRIMARY KEY,
	date date,
	period_id int not null,
	foreign key (period_id) references period(id),
);
create table student_schedule( 
	student_id int not null,
	foreign key (student_id) references student(id),
	schedule_id int not null,
	foreign key (schedule_id) references schedule(id),
	is_check_in bit,
    primary key (student_id, schedule_id),
);


--=================================
INSERT INTO information (birthday, gender, birthplace, ethnic, religion, phone, identify_card, address, area) VALUES ('1977-06-17', 0, N'17292 Ole Centers Apt. 603\nArmandobury\, IN 49617-3956', N'Bru Vân Kiều', N'Phật giáo', N'+1-321-770-5289', N'5328998552527748', N'905 Alexie Knoll\nNorth Claudia\, TX 05850-0223', 'KV2');
INSERT INTO information (birthday, gender, birthplace, ethnic, religion, phone, identify_card, address, area) VALUES ('1993-10-21', 1, N'67484 Cormier Lock\nPort Augustuschester\, SC 04394-4246', N'Si La', N'Không', N'341-503-3816', N'343967118733993', N'404 Hirthe Island\nSouth Stella\, ND 24158', 'KV2');
INSERT INTO information (birthday, gender, birthplace, ethnic, religion, phone, identify_card, address, area) VALUES ('2009-08-22', 0, N'43162 Paris Streets Suite 093\nBrianbury\, WY 67717', N'Brâu', N'Phật giáo', N'917.205.9112', N'4716828215107336', N'541 Melany Shore\nNew Rita\, KY 24753', 'KV3');
INSERT INTO information (birthday, gender, birthplace, ethnic, religion, phone, identify_card, address, area) VALUES ('1983-06-02', 0, N'44087 Luna Hills Suite 808\nGrahamville\, LA 65820-5300', N'Xơ Đăng', N'Không', N'681.498.9946', N'4024007105140270', N'33610 Kirsten Harbor\nSaigechester\, RI 61173-0633', 'KV2');
INSERT INTO information (birthday, gender, birthplace, ethnic, religion, phone, identify_card, address, area) VALUES ('2011-04-30', 0, N'483 Conn Rest\nHaliemouth\, IL 75845', N'Ê đê', N'Phật giáo', N'+1-564-744-1411', N'6011371411782146', N'46900 Dominic Inlet Apt. 717\nPort Bernicemouth\, RI 53683-1102', 'KV3');
INSERT INTO information (birthday, gender, birthplace, ethnic, religion, phone, identify_card, address, area) VALUES ('2006-12-20', 0, N'512 Felicity Ferry Apt. 434\nNew Letitiaport\, MS 77702', N'Kháng', N'Phật giáo', N'+14587511752', N'3589277070854150', N'286 Thiel Village Suite 131\nWest Napoleonport\, SD 06773', 'KV1');
INSERT INTO information (birthday, gender, birthplace, ethnic, religion, phone, identify_card, address, area) VALUES ('1996-09-14', 0, N'5909 Bartell Greens Apt. 879\nNew Xanderburgh\, PA 15292-4643', N'Chơ ro', N'Phật giáo', N'(724) 835-5621', N'2221232193705728', N'87158 Schimmel Trace Apt. 711\nBatztown\, SC 36702', 'KV3');
INSERT INTO information (birthday, gender, birthplace, ethnic, religion, phone, identify_card, address, area) VALUES ('2010-06-26', 0, N'2633 Marvin Burg\nKirlinton\, MO 92813-4826', N'Sán Chay', N'Phật giáo', N'+1.986.673.2298', N'2620332605296550', N'67333 Prohaska Square\nKelsimouth\, HI 11880-1645', 'KV3');
INSERT INTO information (birthday, gender, birthplace, ethnic, religion, phone, identify_card, address, area) VALUES ('1980-10-29', 1, N'5355 Tyra Centers Apt. 669\nEast Toreyhaven\, GA 48899-1838', N'Ngái', N'Phật giáo', N'1-707-307-8924', N'3528406822968968', N'7596 Earline Mews\nVicenteburgh\, NE 78665', 'KV2');
INSERT INTO information (birthday, gender, birthplace, ethnic, religion, phone, identify_card, address, area) VALUES ('1983-04-22', 1, N'12977 Gwendolyn Ports Apt. 168\nSouth Reggie\, NJ 95268-2117', N'Khơ me', N'Phật giáo', N'+1 (319) 873-1806', N'5161423868172816', N'367 Buckridge Views Suite 468\nClemmieberg\, WA 47008-9954', 'KV1');
INSERT INTO information (birthday, gender, birthplace, ethnic, religion, phone, identify_card, address, area) VALUES ('1987-08-09', 1, N'79143 Myron Pines Suite 936\nPort Victor\, NH 77233-3647', N'Xinh mun', N'Không', N'+1-325-763-7289', N'2305442686549124', N'42733 Omer Tunnel\nWest Kenyonville\, NV 66000', 'KV2');
INSERT INTO information (birthday, gender, birthplace, ethnic, religion, phone, identify_card, address, area) VALUES ('2013-12-25', 1, N'89056 Mante Spurs Apt. 372\nMaxineshire\, AR 76456-0494', N'Xơ Đăng', N'Không', N'1-646-723-0561', N'6011418569004235', N'12784 Schinner Brooks Suite 120\nKonopelskihaven\, MA 35377', 'KV3');
INSERT INTO information (birthday, gender, birthplace, ethnic, religion, phone, identify_card, address, area) VALUES ('2010-01-02', 0, N'5472 Camille Pike\nNew Irmafort\, DE 67818-0317', N'Lào', N'Không', N'(262) 987-1260', N'2509010367316586', N'92672 Bins Walks\nSouth Elroyburgh\, MD 89392-0530', 'KV2');
INSERT INTO information (birthday, gender, birthplace, ethnic, religion, phone, identify_card, address, area) VALUES ('1972-01-27', 1, N'98669 Dean Oval Apt. 173\nConnellyland\, CO 86818', N'Bru Vân Kiều', N'Phật giáo', N'+1-251-788-1475', N'370074320440560', N'97715 Dameon Plain\nNorth Francescafurt\, ND 80526', 'KV3');
INSERT INTO information (birthday, gender, birthplace, ethnic, religion, phone, identify_card, address, area) VALUES ('1982-06-24', 0, N'46054 Schamberger Points\nFraneckibury\, OH 91537-4122', N'Lô Lô', N'Phật giáo', N'(781) 616-6759', N'4332748027573', N'2248 Hansen Landing Apt. 821\nRayshire\, OH 12895', 'KV1');
INSERT INTO information (birthday, gender, birthplace, ethnic, religion, phone, identify_card, address, area) VALUES ('2011-03-20', 1, N'2199 Hugh Squares\nMichellemouth\, CA 22291-1489', N'Co', N'Không', N'+15519162958', N'2583540354544393', N'919 Everett Via Apt. 691\nNew Jakobton\, ID 67973', 'KV3');
INSERT INTO information (birthday, gender, birthplace, ethnic, religion, phone, identify_card, address, area) VALUES ('1971-09-25', 0, N'6653 Kassulke Well\nLake Laneyville\, NC 48221', N'Tà ôi', N'Không', N'1-772-900-1542', N'371713083256726', N'507 Welch Unions Suite 379\nWest Darylfurt\, HI 00592', 'KV3');
INSERT INTO information (birthday, gender, birthplace, ethnic, religion, phone, identify_card, address, area) VALUES ('1987-02-19', 0, N'246 Katrine Harbor\nCadeside\, VT 64608', N'Dao', N'Không', N'+1 (630) 773-1715', N'5162816501452025', N'8582 Heller Isle Apt. 319\nTrantowfurt\, CA 35554', 'KV2');
INSERT INTO information (birthday, gender, birthplace, ethnic, religion, phone, identify_card, address, area) VALUES ('1971-08-24', 1, N'868 Emmitt View Apt. 149\nNorth Kayville\, AZ 04522', N'Tày', N'Phật giáo', N'+1.737.210.9980', N'4916109506046584', N'842 Kessler Street\nNorth Marcus\, WY 31430', 'KV3');
INSERT INTO information (birthday, gender, birthplace, ethnic, religion, phone, identify_card, address, area) VALUES ('1991-04-05', 0, N'5626 Dante Views Suite 785\nNew Marco\, MN 74473-9407', N'Thái', N'Phật giáo', N'864.948.0271', N'4556322392639256', N'43345 Powlowski Lodge Suite 447\nEast Ilenemouth\, AR 34086-6878', 'KV3');

INSERT INTO student (name, student_card_id, password, role, information_id) VALUES ('Raymond Yost I', 'A17H8492', '$2y$10$xl9U7eqCieBjSdGh/hn44.fHGrvUifZVybb.vshzd.joKRujyK2KC', 0, 1);
INSERT INTO student (name, student_card_id, password, role, information_id) VALUES ('Frederique Robel',  '217H3000', '$2y$10$xl9U7eqCieBjSdGh/hn44.fHGrvUifZVybb.vshzd.joKRujyK2KC', 0, 2);
INSERT INTO student (name, student_card_id, password, role, information_id) VALUES ('Gerry Morissette',  'A2008558', '$2y$10$xl9U7eqCieBjSdGh/hn44.fHGrvUifZVybb.vshzd.joKRujyK2KC', 0, 3);
INSERT INTO student (name, student_card_id, password, role, information_id) VALUES ('Bella Bosco IV', '62203974', '$2y$10$xl9U7eqCieBjSdGh/hn44.fHGrvUifZVybb.vshzd.joKRujyK2KC', 0, 4);
INSERT INTO student (name, student_card_id, password, role, information_id) VALUES ('Mabelle Cummerata',  '91702838', '$2y$10$xl9U7eqCieBjSdGh/hn44.fHGrvUifZVybb.vshzd.joKRujyK2KC', 0, 5);
INSERT INTO student (name, student_card_id, password, role, information_id) VALUES ('Caroline Brekke',  '120H2478', '$2y$10$xl9U7eqCieBjSdGh/hn44.fHGrvUifZVybb.vshzd.joKRujyK2KC', 1, 6);
INSERT INTO student (name, student_card_id, password, role, information_id) VALUES ('Shanny Smitham',  '42101964', '$2y$10$xl9U7eqCieBjSdGh/hn44.fHGrvUifZVybb.vshzd.joKRujyK2KC', 0, 7);
INSERT INTO student (name, student_card_id, password, role, information_id) VALUES ('Dudley Carroll',  'C16H8053', '$2y$10$xl9U7eqCieBjSdGh/hn44.fHGrvUifZVybb.vshzd.joKRujyK2KC', 0, 8);
INSERT INTO student (name, student_card_id, password, role, information_id) VALUES ('Geoffrey Medhurst',  '016H1831', '$2y$10$xl9U7eqCieBjSdGh/hn44.fHGrvUifZVybb.vshzd.joKRujyK2KC', 1, 9);
INSERT INTO student (name, student_card_id, password, role, information_id) VALUES ('Rashad Rau III', 'C21F5721', '$2y$10$xl9U7eqCieBjSdGh/hn44.fHGrvUifZVybb.vshzd.joKRujyK2KC', 0, 10);

INSERT INTO teacher (name, teacher_card_id, password, role, information_id) VALUES ('Norma Koepp', '732T4925', '$2y$10$xl9U7eqCieBjSdGh/hn44.fHGrvUifZVybb.vshzd.joKRujyK2KC', 0, 11);
INSERT INTO teacher (name, teacher_card_id, password, role, information_id) VALUES ('Eliane Moore',  '732T0005', '$2y$10$xl9U7eqCieBjSdGh/hn44.fHGrvUifZVybb.vshzd.joKRujyK2KC', 0, 12);
INSERT INTO teacher (name, teacher_card_id, password, role, information_id) VALUES ('Prof. Samir Lakin',  '732T5585', '$2y$10$xl9U7eqCieBjSdGh/hn44.fHGrvUifZVybb.vshzd.joKRujyK2KC', 1, 13);
INSERT INTO teacher (name, teacher_card_id, password, role, information_id) VALUES ('Art Schuster PhD', '732T9745', '$2y$10$xl9U7eqCieBjSdGh/hn44.fHGrvUifZVybb.vshzd.joKRujyK2KC', 0, 14);
INSERT INTO teacher (name, teacher_card_id, password, role, information_id) VALUES ('Sabryna Schowalter',  '732T8385', '$2y$10$xl9U7eqCieBjSdGh/hn44.fHGrvUifZVybb.vshzd.joKRujyK2KC', 0, 15);
INSERT INTO teacher (name, teacher_card_id, password, role, information_id) VALUES ('Lucie Schmidt V',  '732T4785', '$2y$10$xl9U7eqCieBjSdGh/hn44.fHGrvUifZVybb.vshzd.joKRujyK2KC', 1, 16);
INSERT INTO teacher (name, teacher_card_id, password, role, information_id) VALUES ('Dr. Giuseppe Armstrong',  '732T9645', '$2y$10$xl9U7eqCieBjSdGh/hn44.fHGrvUifZVybb.vshzd.joKRujyK2KC', 1, 17);
INSERT INTO teacher (name, teacher_card_id, password, role, information_id) VALUES ('Marilie Ondricka',  '732T0535', '$2y$10$xl9U7eqCieBjSdGh/hn44.fHGrvUifZVybb.vshzd.joKRujyK2KC', 1, 18);
INSERT INTO teacher (name, teacher_card_id, password, role, information_id) VALUES ('Dr. Simone Lynch',  '732T8315', '$2y$10$xl9U7eqCieBjSdGh/hn44.fHGrvUifZVybb.vshzd.joKRujyK2KC', 1, 19);
INSERT INTO teacher (name, teacher_card_id, password, role, information_id) VALUES ('Mr. Enid Kohler', '732T7215', '$2y$10$xl9U7eqCieBjSdGh/hn44.fHGrvUifZVybb.vshzd.joKRujyK2KC', 1, 20);

INSERT INTO form (title, content, student_id, teacher_id, parent_id, created_at) VALUES ('Harum et omnis quibusdam maxime qui doloribus et.', 'Beatae sunt qui id molestias eligendi praesentium ad. Et aut quod quo voluptatum voluptatem omnis praesentium. Est dolores nihil molestiae modi amet.', 1, NULL, NULL, '2022-08-03 04:31:54');
INSERT INTO form (title, content, student_id, teacher_id, parent_id, created_at) VALUES ('Ex unde quia illo et alias.', 'Ducimus illo architecto reiciendis possimus et voluptate. Dolores qui a in necessitatibus debitis.', 1, 5, 1, '2022-01-23 11:38:01');
INSERT INTO form (title, content, student_id, teacher_id, parent_id, created_at) VALUES ('Debitis nulla minima facilis modi deserunt nobis.', 'Illum pariatur ut animi saepe illum dicta vitae illum. Vitae temporibus aut tempora saepe aut iste culpa placeat. Et ut quaerat voluptate quisquam iure.', 2, 7, 1, '2022-01-03 03:20:44');
INSERT INTO form (title, content, student_id, teacher_id, parent_id, created_at) VALUES ('Vero enim consequatur accusamus non illum reiciendis.', 'Iure omnis iste quia delectus iste et provident. Quas repellendus ipsa dolorem et laborum enim ipsa. Tempore sint qui rerum dignissimos accusantium qui omnis sit.', 2, NULL, NULL, '2022-11-28 22:44:26');
INSERT INTO form (title, content, student_id, teacher_id, parent_id, created_at) VALUES ('Recusandae rem dolor nihil perspiciatis nesciunt.', 'Veniam sit voluptatem quasi quaerat. Sit adipisci non quasi corporis consequuntur dolor. Dignissimos voluptas aut et pariatur. Non consequuntur optio provident.', 2, NULL, NULL, '2021-05-21 13:47:08');
INSERT INTO form (title, content, student_id, teacher_id, parent_id, created_at) VALUES ('Minima quo ut ea illum sunt sit et.', 'Sed officiis porro sed aspernatur. Quia soluta laborum cumque cupiditate eius quis ipsam. Quibusdam et quo velit dolorem eos.', 1, NULL, NULL, '2022-10-19 22:36:45');
INSERT INTO form (title, content, student_id, teacher_id, parent_id, created_at) VALUES ('Nam deserunt enim et omnis nisi temporibus.', 'Id nihil qui nesciunt sunt commodi. Dolores quia voluptatum at nam eligendi. Consequuntur eos assumenda dolores ex qui et et. Voluptatem illum laboriosam vitae.', 1, NULL, NULL, '2022-07-07 17:05:54');
INSERT INTO form (title, content, student_id, teacher_id, parent_id, created_at) VALUES ('Aut aperiam autem autem nam necessitatibus dolore quaerat.', 'Aut cumque explicabo repudiandae perspiciatis. Eaque quae ut magni. Asperiores dolores sit ullam consequatur voluptas.', 3, NULL, NULL, '2022-01-23 05:53:01');
INSERT INTO form (title, content, student_id, teacher_id, parent_id, created_at) VALUES ('Quia voluptatem et praesentium eius quia.', 'Tenetur debitis ut deleniti amet consequatur provident consequuntur. Voluptates et et tempore temporibus.', 5, NULL, NULL, '2022-05-24 13:24:50');
INSERT INTO form (title, content, student_id, teacher_id, parent_id, created_at) VALUES ('Ipsam iusto atque et voluptatem.', 'Accusamus aut soluta accusantium corporis earum est. Nam tempore explicabo quidem perspiciatis voluptatem ipsum sed eveniet. Nam in sit architecto ut veniam veritatis quis.', 1, NULL, NULL, '2022-06-25 20:56:27');



INSERT INTO files (source, size, form_id, created_at) VALUES ('https://picsum.photos/id/567/640/480', 29553, 1, '2022-08-16 14:21:05');
INSERT INTO files (source, size, form_id, created_at) VALUES ('https://picsum.photos/id/56/640/480', 16850, 1, '2022-08-16 14:21:05');
INSERT INTO files (source, size, form_id, created_at) VALUES ('https://picsum.photos/id/215/640/480', 19723, 2, '2022-08-16 14:21:05');
INSERT INTO files (source, size, form_id, created_at) VALUES ('https://picsum.photos/id/640/640/480', 44322, 2, '2022-08-16 14:21:05');
INSERT INTO files (source, size, form_id, created_at) VALUES ('https://picsum.photos/id/309/640/480', 96721, 3, '2022-08-16 14:21:05');
INSERT INTO files (source, size, form_id, created_at) VALUES ('https://picsum.photos/id/102/640/480', 35690, 6, '2022-08-16 14:21:05');
INSERT INTO files (source, size, form_id, created_at) VALUES ('https://picsum.photos/id/92/640/480', 78030, 7, '2022-08-16 14:21:05');
INSERT INTO files (source, size, form_id, created_at) VALUES ('https://picsum.photos/id/421/640/480', 17895, 8, '2022-08-16 14:21:05');
INSERT INTO files (source, size, form_id, created_at) VALUES ('https://picsum.photos/id/544/640/480', 78480, 8, '2022-08-16 14:21:05');
INSERT INTO files (source, size, form_id, created_at) VALUES ('https://picsum.photos/id/576/640/480', 54720, 9, '2022-08-16 14:21:05');

INSERT INTO building (name) VALUES ('H');
INSERT INTO building (name) VALUES ('I');
INSERT INTO building (name) VALUES ('K');
INSERT INTO building (name) VALUES ('L');
INSERT INTO building (name) VALUES ('M');

INSERT INTO floor (name, building_id) VALUES ('1', 1);
INSERT INTO floor (name, building_id) VALUES ('2', 1);
INSERT INTO floor (name, building_id) VALUES ('3', 1);
INSERT INTO floor (name, building_id) VALUES ('1', 2);
INSERT INTO floor (name, building_id) VALUES ('2', 2);
INSERT INTO floor (name, building_id) VALUES ('3', 2);
INSERT INTO floor (name, building_id) VALUES ('1', 3);
INSERT INTO floor (name, building_id) VALUES ('2', 3);
INSERT INTO floor (name, building_id) VALUES ('3', 3);
INSERT INTO floor (name, building_id) VALUES ('1', 4);
INSERT INTO floor (name, building_id) VALUES ('2', 4);
INSERT INTO floor (name, building_id) VALUES ('3', 4);

INSERT INTO room_detail (max, price_per_month, description) VALUES (8, '250000', N'Phòng 8 người');
INSERT INTO room_detail (max, price_per_month, description) VALUES (6, '650000', N'Phòng 6 người');
INSERT INTO room_detail (max, price_per_month, description) VALUES (4, '3000000', N'Phòng 4 người');
INSERT INTO room_detail (max, price_per_month, description) VALUES (2, '5000000', N'Phòng 2 người');
INSERT INTO room_detail (max, price_per_month, description) VALUES (1, '8000000', N'Phòng 1 người');

INSERT INTO room (name, room_detail_id, amount, status, floor_id) VALUES ('H0101', 1, 1, 1, 1);
INSERT INTO room (name, room_detail_id, amount, status, floor_id) VALUES ('H0102', 3, 1, 0, 1);
INSERT INTO room (name, room_detail_id, amount, status, floor_id) VALUES ('H0203', 3, 1, 0, 2);
INSERT INTO room (name, room_detail_id, amount, status, floor_id) VALUES ('H0204', 3, 1, 0, 2);
INSERT INTO room (name, room_detail_id, amount, status, floor_id) VALUES ('H0305', 1, 1, 1, 3);
INSERT INTO room (name, room_detail_id, amount, status, floor_id) VALUES ('I0106', 1, 1, 0, 4);
INSERT INTO room (name, room_detail_id, amount, status, floor_id) VALUES ('I0207', 1, 1, 1, 5);
INSERT INTO room (name, room_detail_id, amount, status, floor_id) VALUES ('I0308', 2, 1, 1, 6);
INSERT INTO room (name, room_detail_id, amount, status, floor_id) VALUES ('K0109', 3, 1, 1, 7);
INSERT INTO room (name, room_detail_id, amount, status, floor_id) VALUES ('K0201', 4, 1, 0, 8);

-- season1: 1; season2: 2; summer season: 3; both 2 season: 4
INSERT INTO contract (student_id, room_id, start_date, end_date, season, is_accept, register_at) VALUES (1, 1, '2022-01-15 19:20:07', '2022-06-15 19:20:07', 2, 1, '2022-08-17 12:32:46');
INSERT INTO contract (student_id, room_id, start_date, end_date, season, is_accept, register_at) VALUES (2, 2, '2022-01-15 19:20:07', '2022-06-15 19:20:07', 2, 1, '2022-08-17 01:11:24');
INSERT INTO contract (student_id, room_id, start_date, end_date, season, is_accept, register_at) VALUES (3, 3, '2022-01-15 19:20:07', '2022-06-15 19:20:07', 2, 0, '2022-08-17 01:11:27');
INSERT INTO contract (student_id, room_id, start_date, end_date, season, is_accept, register_at) VALUES (4, 4, '2022-08-15 19:20:07', '2023-06-15 19:20:07', 4, 0, '2022-08-17 03:09:09');
INSERT INTO contract (student_id, room_id, start_date, end_date, season, is_accept, register_at) VALUES (5, 5, '2022-06-15 19:20:07', '2022-08-15 19:20:07', 3, 1, '2022-08-17 03:09:26');
INSERT INTO contract (student_id, room_id, start_date, end_date, season, is_accept, register_at) VALUES (6, 6, '2022-01-15 19:20:07', '2022-06-15 19:20:07', 2, 1, '2022-08-17 21:40:37');
INSERT INTO contract (student_id, room_id, start_date, end_date, season, is_accept, register_at) VALUES (7, 7, '2022-08-15 19:20:07', '2023-01-15 19:20:07', 1, 1, '2022-08-17 09:00:53');
INSERT INTO contract (student_id, room_id, start_date, end_date, season, is_accept, register_at) VALUES (8, 8, '2022-01-15 19:20:07', '2022-06-15 19:20:07', 2, 0, '2022-08-17 09:01:05');
INSERT INTO contract (student_id, room_id, start_date, end_date, season, is_accept, register_at) VALUES (9, 9, '2022-01-15 19:20:07', '2022-06-15 19:20:07', 2, 1, '2022-08-19 01:41:45');
INSERT INTO contract (student_id, room_id, start_date, end_date, season, is_accept, register_at) VALUES (10, 10, '2022-06-15 19:20:07', '2022-08-15 19:20:07', 3, 1, '2022-08-19 01:42:14');

INSERT INTO bill (price, is_paid, pay_start_time, pay_end_time, contract_id) VALUES ('750000', 0, '2022-08-16 19:20:49', '2022-08-23 19:20:49', 1);
INSERT INTO bill (price, is_paid, pay_start_time, pay_end_time, contract_id) VALUES ('9000000', 0, '2022-08-16 19:20:49', '2022-08-23 19:20:49', 2);
INSERT INTO bill (price, is_paid, pay_start_time, pay_end_time, contract_id) VALUES ('6000000', 0, '2022-08-16 19:20:49', '2022-08-23 19:20:49', 3);
INSERT INTO bill (price, is_paid, pay_start_time, pay_end_time, contract_id) VALUES ('10000000', 0, '2022-08-16 19:20:49', '2022-08-23 19:20:49', 4);
INSERT INTO bill (price, is_paid, pay_start_time, pay_end_time, contract_id) VALUES ('15000000', 0, '2022-08-16 19:20:49', '2022-08-23 19:20:49', 5);
INSERT INTO bill (price, is_paid, pay_start_time, pay_end_time, contract_id) VALUES ('6000000', 0, '2022-08-16 19:20:49', '2022-08-23 19:20:49', 6);
INSERT INTO bill (price, is_paid, pay_start_time, pay_end_time, contract_id) VALUES ('500000', 0, '2022-08-16 19:20:49', '2022-08-23 19:20:49', 7);
INSERT INTO bill (price, is_paid, pay_start_time, pay_end_time, contract_id) VALUES ('10000000', 0, '2022-08-16 19:20:49', '2022-08-23 19:20:49', 8);
INSERT INTO bill (price, is_paid, pay_start_time, pay_end_time, contract_id) VALUES ('10000000', 0, '2022-08-16 19:20:49', '2022-08-23 19:20:49', 9);
INSERT INTO bill (price, is_paid, pay_start_time, pay_end_time, contract_id) VALUES ('1300000', 0, '2022-08-16 19:20:49', '2022-08-23 19:20:49', 10);

INSERT INTO period (period, started_at) VALUES (1, '06:00:00');
INSERT INTO period (period, started_at) VALUES (2, '07:30:00');
INSERT INTO period (period, started_at) VALUES (3, '08:30:00');
INSERT INTO period (period, started_at) VALUES (4, '10:00:00');
INSERT INTO period (period, started_at) VALUES (5, '12:00:00');
INSERT INTO period (period, started_at) VALUES (6, '13:30:00');
INSERT INTO period (period, started_at) VALUES (7, '15:00:00');
INSERT INTO period (period, started_at) VALUES (8, '16:30:00');
INSERT INTO period (period, started_at) VALUES (9, '18:00:00');
INSERT INTO period (period, started_at) VALUES (10, '19:30:00');
INSERT INTO period (period, started_at) VALUES (11, '21:00:00');

INSERT INTO schedule (date, period_id) VALUES ('2022-08-15', 1);
INSERT INTO schedule (date, period_id) VALUES ('2022-08-15', 2);
INSERT INTO schedule (date, period_id) VALUES ('2022-08-15', 3);
INSERT INTO schedule (date, period_id) VALUES ('2022-08-15', 4);
INSERT INTO schedule (date, period_id) VALUES ('2022-08-15', 5);
INSERT INTO schedule (date, period_id) VALUES ('2022-08-15', 6);
INSERT INTO schedule (date, period_id) VALUES ('2022-08-15', 7);
INSERT INTO schedule (date, period_id) VALUES ('2022-08-15', 8);
INSERT INTO schedule (date, period_id) VALUES ('2022-08-15', 9);
INSERT INTO schedule (date, period_id) VALUES ('2022-08-15', 10);
INSERT INTO schedule (date, period_id) VALUES ('2022-08-15', 11);
INSERT INTO schedule (date, period_id) VALUES ('2022-08-16', 1);
INSERT INTO schedule (date, period_id) VALUES ('2022-08-16', 2);
INSERT INTO schedule (date, period_id) VALUES ('2022-08-16', 3);
INSERT INTO schedule (date, period_id) VALUES ('2022-08-16', 4);
INSERT INTO schedule (date, period_id) VALUES ('2022-08-16', 5);
INSERT INTO schedule (date, period_id) VALUES ('2022-08-16', 6);
INSERT INTO schedule (date, period_id) VALUES ('2022-08-16', 7);
INSERT INTO schedule (date, period_id) VALUES ('2022-08-16', 8);
INSERT INTO schedule (date, period_id) VALUES ('2022-08-16', 9);
INSERT INTO schedule (date, period_id) VALUES ('2022-08-16', 10);
INSERT INTO schedule (date, period_id) VALUES ('2022-08-16', 11);

INSERT INTO student_schedule (student_id, schedule_id, is_check_in) VALUES (6, 1, 0);
INSERT INTO student_schedule (student_id, schedule_id, is_check_in) VALUES (6, 3, 1);
INSERT INTO student_schedule (student_id, schedule_id, is_check_in) VALUES (6, 5, 1);
INSERT INTO student_schedule (student_id, schedule_id, is_check_in) VALUES (9, 7, 1);
INSERT INTO student_schedule (student_id, schedule_id, is_check_in) VALUES (9, 9, 0);
INSERT INTO student_schedule (student_id, schedule_id, is_check_in) VALUES (9, 10, 0);
INSERT INTO student_schedule (student_id, schedule_id, is_check_in) VALUES (9, 11, 1);
INSERT INTO student_schedule (student_id, schedule_id, is_check_in) VALUES (6, 14, 1);
INSERT INTO student_schedule (student_id, schedule_id, is_check_in) VALUES (6, 17, 1);
INSERT INTO student_schedule (student_id, schedule_id, is_check_in) VALUES (6, 20, 0);


SELECT * FROM student WHERE student_card_id = 'A17H8492';
SELECT name, student_card_id FROM student;
SELECT name AS 'ten', student_card_id AS 'mssv' FROM student;
SELECT name FROM student UNION SELECT name from teacher;
SELECT * FROM student WHERE role = 0 AND name = 'Shanny Smitham';
SELECT * FROM student WHERE id NOT IN (SELECT id FROM student WHERE role = 1);
SELECT student.*, form.* FROM student, form;
SELECT * FROM teacher JOIN form ON teacher.id = form.teacher_id;
SELECT * FROM student LEFT JOIN contract ON student.id = contract.student_id;
SELECT * FROM room RIGHT JOIN floor ON floor.id = room.floor_id;
