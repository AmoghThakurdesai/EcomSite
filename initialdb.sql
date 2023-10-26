#
# TABLE STRUCTURE FOR: cart
#

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `sz` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `cart_user` (`user_id`),
  CONSTRAINT `cart_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: category
#

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(200) DEFAULT NULL,
  `cat_description` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `category` (`cat_id`, `cat_name`, `cat_description`) VALUES (1, 'qui', 'Error tempora id tenetur. Incidunt qui vero ipsum minima. Et aut consectetur provident ad sint qui. Rerum corporis at neque nihil. Quasi ut saepe earum enim.');
INSERT INTO `category` (`cat_id`, `cat_name`, `cat_description`) VALUES (2, 'ipsum', 'Ipsam ullam inventore sunt. Voluptates nulla et voluptatum. Et voluptatem ut et animi aut aut facere exercitationem. Rerum voluptatem libero itaque praesentium delectus dolorem ipsam quam.');
INSERT INTO `category` (`cat_id`, `cat_name`, `cat_description`) VALUES (3, 'dolorum', 'Corrupti esse reiciendis quae ipsum eos. Dolorem est voluptatum ut enim vitae. Quo libero optio saepe quo. Et ea nisi laboriosam.');
INSERT INTO `category` (`cat_id`, `cat_name`, `cat_description`) VALUES (4, 'omnis', 'Sint ad odio quas pariatur quia voluptatum. Ipsum molestiae voluptatem eaque corrupti impedit tempora.');
INSERT INTO `category` (`cat_id`, `cat_name`, `cat_description`) VALUES (5, 'excepturi', 'Assumenda blanditiis sequi officiis exercitationem reiciendis. Ad quis excepturi similique sed error doloremque ut consequatur. Totam officiis laudantium numquam quod aut vero culpa consequuntur.');
INSERT INTO `category` (`cat_id`, `cat_name`, `cat_description`) VALUES (6, 'voluptas', 'Saepe vitae facilis autem magni expedita sunt. Dolor sunt labore quo pariatur qui. Dolor ut assumenda cum aut. Eum cumque dolorum enim ad et rerum. Qui quibusdam et laudantium.');
INSERT INTO `category` (`cat_id`, `cat_name`, `cat_description`) VALUES (7, 'dolores', 'Quis quia molestias enim est. Provident nihil animi voluptas laboriosam occaecati nisi est. Voluptatem et quod id vel modi fuga commodi.');
INSERT INTO `category` (`cat_id`, `cat_name`, `cat_description`) VALUES (8, 'enim', 'Quis aut velit unde beatae ut odit ullam. Et eos accusamus iusto voluptatem rerum adipisci rem. Provident enim aut voluptatem amet dignissimos reiciendis.');
INSERT INTO `category` (`cat_id`, `cat_name`, `cat_description`) VALUES (9, 'libero', 'Non nisi vitae sequi. Necessitatibus aliquam in eos unde. Voluptas autem iste vel quia et. Omnis nihil est perspiciatis omnis quam et. Ratione temporibus laboriosam ullam qui.');
INSERT INTO `category` (`cat_id`, `cat_name`, `cat_description`) VALUES (10, 'non', 'Quia non dolor recusandae. Qui magnam facere aliquam voluptatibus odit et eos. Deserunt exercitationem iure accusantium error quasi et quod. Repellendus ut omnis debitis omnis. Iusto vel est sunt consequatur perspiciatis.');


#
# TABLE STRUCTURE FOR: custom_product
#

DROP TABLE IF EXISTS `custom_product`;

CREATE TABLE `custom_product` (
  `custom_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(512) DEFAULT NULL,
  `img_id` int(11) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`custom_product_id`),
  KEY `user` (`user_id`),
  KEY `product` (`product_id`),
  KEY `uploaded_image` (`img_id`),
  CONSTRAINT `product` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `uploaded_image` FOREIGN KEY (`img_id`) REFERENCES `user_upload` (`img_id`),
  CONSTRAINT `user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: ordertable
#

DROP TABLE IF EXISTS `ordertable`;

CREATE TABLE `ordertable` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `contact` int(11) DEFAULT NULL,
  `zipcode` int(11) DEFAULT NULL,
  `state_name` varchar(200) DEFAULT NULL,
  `city_name` varchar(200) DEFAULT NULL,
  `address_details` varchar(500) DEFAULT NULL,
  `order_name` varchar(100) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `cart_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `cart` (`cart_id`),
  KEY `order_product` (`product_id`),
  CONSTRAINT `cart` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`),
  CONSTRAINT `order_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: product
#

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_id` int(11) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_description` varchar(2000) DEFAULT NULL,
  `img1` varchar(2000) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `img2` varchar(2000) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `img3` varchar(2000) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `category` (`cat_id`),
  CONSTRAINT `category` FOREIGN KEY (`cat_id`) REFERENCES `category` (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `product` (`product_id`, `cat_id`, `product_name`, `product_description`, `img1`, `img2`, `img3`, `price`, `color`, `brand`) VALUES (1, 1, 'magnam', 'Repellendus excepturi quia sequi nobis velit ipsam porro. Tempora aliquam quisquam repellendus nam consequuntur dolorum mollitia veritatis. Aspernatur et qui consequatur tempore velit. Tempore fugit sapiente nesciunt ut.', NULL, NULL, NULL, 1361, NULL, NULL);
INSERT INTO `product` (`product_id`, `cat_id`, `product_name`, `product_description`, `img1`, `img2`, `img3`, `price`, `color`, `brand`) VALUES (2, 2, 'pariatur', 'Dolor deserunt dicta reprehenderit suscipit rerum ut neque. Qui minima pariatur eius tempora enim corporis. Praesentium ut beatae pariatur nihil. Et doloribus quis qui molestiae velit ut ab.', NULL, NULL, NULL, 7, NULL, NULL);
INSERT INTO `product` (`product_id`, `cat_id`, `product_name`, `product_description`, `img1`, `img2`, `img3`, `price`, `color`, `brand`) VALUES (3, 3, 'deleniti', 'Veritatis omnis sunt vitae earum laudantium nobis suscipit. Laudantium beatae et dolorum voluptas.', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `product` (`product_id`, `cat_id`, `product_name`, `product_description`, `img1`, `img2`, `img3`, `price`, `color`, `brand`) VALUES (4, 4, 'voluptatum', 'Quaerat dolor alias reiciendis repellendus odio ut. Accusamus dignissimos eveniet veniam repellat sint odio. Voluptatem error voluptas blanditiis voluptatem. Quae libero recusandae dicta velit mollitia quod.', NULL, NULL, NULL, 2132479, NULL, NULL);
INSERT INTO `product` (`product_id`, `cat_id`, `product_name`, `product_description`, `img1`, `img2`, `img3`, `price`, `color`, `brand`) VALUES (5, 5, 'deserunt', 'Enim alias esse culpa ex. Ab vitae numquam sequi voluptas. Repellat mollitia est tenetur aliquam et quia dicta. Et et consectetur nesciunt sit non minus quod quaerat.', NULL, NULL, NULL, 1281, NULL, NULL);
INSERT INTO `product` (`product_id`, `cat_id`, `product_name`, `product_description`, `img1`, `img2`, `img3`, `price`, `color`, `brand`) VALUES (6, 6, 'ut', 'Aut est incidunt nihil suscipit sunt quaerat. Consequatur est et reiciendis. Itaque cum magnam itaque saepe deserunt. Qui adipisci rerum odio ut aut et cum.', NULL, NULL, NULL, 1153587, NULL, NULL);
INSERT INTO `product` (`product_id`, `cat_id`, `product_name`, `product_description`, `img1`, `img2`, `img3`, `price`, `color`, `brand`) VALUES (7, 7, 'et', 'Laboriosam voluptates molestiae unde. Repellat deleniti sunt voluptas rerum at. Omnis praesentium expedita consequuntur voluptas dolor recusandae ea voluptas.', NULL, NULL, NULL, 4146, NULL, NULL);
INSERT INTO `product` (`product_id`, `cat_id`, `product_name`, `product_description`, `img1`, `img2`, `img3`, `price`, `color`, `brand`) VALUES (8, 8, 'rerum', 'Culpa quos expedita quo tempore aliquid mollitia maxime. Voluptas quod quidem non qui. Aut aut ut nam accusantium accusamus placeat.', NULL, NULL, NULL, 4958964, NULL, NULL);
INSERT INTO `product` (`product_id`, `cat_id`, `product_name`, `product_description`, `img1`, `img2`, `img3`, `price`, `color`, `brand`) VALUES (9, 9, 'sed', 'Totam voluptatem minus ipsa omnis necessitatibus atque ullam. Aut consequatur vero sint non aut sit quis.', NULL, NULL, NULL, 202066, NULL, NULL);
INSERT INTO `product` (`product_id`, `cat_id`, `product_name`, `product_description`, `img1`, `img2`, `img3`, `price`, `color`, `brand`) VALUES (10, 10, 'eos', 'Voluptas quia quisquam dolorum. Ad quidem in et. Nemo ea totam ullam cupiditate.', NULL, NULL, NULL, 2, NULL, NULL);


#
# TABLE STRUCTURE FOR: user
#

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(200) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `pass` varchar(20) DEFAULT NULL,
  `contact` int(11) DEFAULT NULL,
  `rol` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (1, 'norn@example.com', 'scottie.marquardt', NULL, 1, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (2, 'jgutkowski@example.org', 'minerva.flatley', NULL, 465545, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (3, 'sydnee08@example.org', 'laverne.white', NULL, 1, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (4, 'bkeeling@example.org', 'tromp.herminia', NULL, 25536, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (5, 'anderson.jaqueline@example.com', 'dee53', NULL, 89, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (6, 'glover.hadley@example.org', 'zoey45', NULL, 276, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (7, 'zkovacek@example.com', 'nicolas.benedict', NULL, 870640, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (8, 'dayana.hand@example.org', 'chelsea29', NULL, 0, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (9, 'cheyenne.ankunding@example.net', 'marian.miller', NULL, 72, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (10, 'fkertzmann@example.org', 'brenna.fisher', NULL, 309, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (11, 'santa54@example.org', 'araceli.tromp', NULL, 994, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (12, 'bbayer@example.net', 'buck16', NULL, 939, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (13, 'murray.candace@example.org', 'marcos.cartwright', NULL, 0, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (14, 'anderson.walsh@example.net', 'lelia76', NULL, 1, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (15, 'jasmin.kassulke@example.net', 'wtromp', NULL, 65, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (16, 'reuben72@example.net', 'bwisoky', NULL, 1, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (17, 'fanny27@example.org', 'rogers.conroy', NULL, 400, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (18, 'clinton18@example.com', 'dmoen', NULL, 95, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (19, 'cale18@example.org', 'patience.prosacco', NULL, 2147483647, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (20, 'aditya.goyette@example.org', 'pledner', NULL, 2147483647, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (21, 'bahringer.tanya@example.org', 'jamarcus.heller', NULL, 2147483647, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (22, 'braun.bulah@example.com', 'alysha97', NULL, 742, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (23, 'dconsidine@example.org', 'awaelchi', NULL, 2147483647, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (24, 'earlene06@example.com', 'erenner', NULL, 0, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (25, 'steve29@example.com', 'shemar95', NULL, 1, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (26, 'zemlak.lonny@example.com', 'jessyca66', NULL, 2147483647, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (27, 'nrohan@example.org', 'lilliana.gibson', NULL, 0, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (28, 'o\'keefe.della@example.org', 'tbeier', NULL, 871021, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (29, 'loy.kuhlman@example.com', 'wfadel', NULL, 0, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (30, 'pkub@example.net', 'erdman.watson', NULL, 37, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (31, 'sbode@example.org', 'murray.steuber', NULL, 1, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (32, 'ehermiston@example.org', 'beatty.francisco', NULL, 755, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (33, 'lucas.mueller@example.org', 'nathan38', NULL, 2147483647, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (34, 'rippin.rosamond@example.net', 'chadrick36', NULL, 2147483647, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (35, 'rempel.isaac@example.net', 'gusikowski.jayson', NULL, 408272, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (36, 'vivianne44@example.org', 'mcdermott.seth', NULL, 1, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (37, 'beahan.alvina@example.com', 'hgoodwin', NULL, 440753, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (38, 'hcollins@example.org', 'larkin.jean', NULL, 256, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (39, 'sibyl.gaylord@example.com', 'eparisian', NULL, 0, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (40, 'smitham.dora@example.net', 'clovis.schiller', NULL, 436353, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (41, 'darrin.hane@example.com', 'bernadette00', NULL, 50, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (42, 'annie58@example.com', 'kuvalis.ben', NULL, 739, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (43, 'von.hermann@example.org', 'dashawn20', NULL, 415034, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (44, 'lillian.kovacek@example.org', 'lkozey', NULL, 2147483647, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (45, 'shane.hills@example.net', 'ryan.jazmyne', NULL, 495636, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (46, 'aconnelly@example.com', 'medhurst.sheridan', NULL, 109474, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (47, 'merdman@example.org', 'asia.bergnaum', NULL, 458788, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (48, 'brianne.leffler@example.com', 'reinger.melyssa', NULL, 464874, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (49, 'nelle.gerhold@example.net', 'anderson.bernie', NULL, 606849, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (50, 'sbruen@example.org', 'ojohnston', NULL, 685238, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (51, 'emmet.hudson@example.com', 'bonita10', NULL, 2059293882, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (52, 'braun.gabrielle@example.net', 'randall67', NULL, 820, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (53, 'robyn.auer@example.org', 'meghan.turner', NULL, 1, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (54, 'brannon37@example.org', 'bode.hortense', NULL, 790, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (55, 'macejkovic.scarlett@example.net', 'jessie.botsford', NULL, 1, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (56, 'berenice.feeney@example.net', 'esperanza.hessel', NULL, 0, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (57, 'walsh.boris@example.org', 'khane', NULL, 197150, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (58, 'fgraham@example.org', 'cruickshank.treva', NULL, 829, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (59, 'aracely49@example.com', 'kkilback', NULL, 1, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (60, 'mckayla65@example.org', 'madison57', NULL, 0, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (61, 'rodriguez.christophe@example.net', 'eulah85', NULL, 0, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (62, 'jaleel56@example.net', 'keshawn.trantow', NULL, 624, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (63, 'rboyer@example.net', 'hayes.alfred', NULL, 2147483647, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (64, 'rodriguez.kelvin@example.com', 'iwhite', NULL, 2147483647, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (65, 'bartell.brooklyn@example.com', 'nickolas87', NULL, 231921, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (66, 'trevor98@example.com', 'rkuhic', NULL, 2147483647, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (67, 'tcrooks@example.org', 'zetta.jacobi', NULL, 206658, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (68, 'bergstrom.roma@example.net', 'clay.daniel', NULL, 2147483647, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (69, 'fsenger@example.net', 'bradley.mraz', NULL, 1, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (70, 'ogrady@example.org', 'kris.rosanna', NULL, 820, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (71, 'vonrueden.christa@example.net', 'tracey.wilderman', NULL, 262742, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (72, 'jay.skiles@example.net', 'alfonzo10', NULL, 49, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (73, 'gleichner.russ@example.net', 'labadie.brittany', NULL, 478604380, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (74, 'windler.maida@example.com', 'pinkie.lockman', NULL, 1, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (75, 'mkemmer@example.org', 'nwilkinson', NULL, 0, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (76, 'grayce06@example.com', 'ashleigh56', NULL, 0, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (77, 'fay.napoleon@example.net', 'cathryn.bode', NULL, 17129, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (78, 'liza.davis@example.com', 'zbashirian', NULL, 1, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (79, 'fahey.chanel@example.net', 'zboehm', NULL, 2147483647, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (80, 'arielle.rice@example.org', 'darby45', NULL, 2147483647, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (81, 'graham.margie@example.org', 'maurice91', NULL, 1, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (82, 'liana.ferry@example.net', 'casper.roosevelt', NULL, 0, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (83, 'beatty.keegan@example.org', 'rziemann', NULL, 162040, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (84, 'camren96@example.org', 'marietta41', NULL, 603726, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (85, 'phansen@example.net', 'keshaun.bashirian', NULL, 95, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (86, 'general28@example.org', 'gleichner.raoul', NULL, 562004, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (87, 'qnicolas@example.com', 'kailee56', NULL, 2147483647, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (88, 'adare@example.org', 'hmarvin', NULL, 871521, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (89, 'lambert.denesik@example.org', 'eschamberger', NULL, 1730374434, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (90, 'jgraham@example.net', 'jschuppe', NULL, 2147483647, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (91, 'marianna.zemlak@example.net', 'thompson.hilton', NULL, 514, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (92, 'haley.leannon@example.net', 'jaida26', NULL, 1, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (93, 'marquardt.brianne@example.com', 'mayer.lazaro', NULL, 1, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (94, 'cgoldner@example.net', 'jerry49', NULL, 1, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (95, 'karlee48@example.org', 'hester84', NULL, 18, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (96, 'thettinger@example.net', 'royal64', NULL, 0, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (97, 'abigayle.schoen@example.net', 'nicholas98', NULL, 781, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (98, 'duane74@example.com', 'marina27', NULL, 1, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (99, 'alfredo.herman@example.org', 'tyra95', NULL, 1, NULL);
INSERT INTO `user` (`user_id`, `email`, `username`, `pass`, `contact`, `rol`) VALUES (100, 'fschuppe@example.com', 'zbode', NULL, 852853, NULL);


#
# TABLE STRUCTURE FOR: user_upload
#

DROP TABLE IF EXISTS `user_upload`;

CREATE TABLE `user_upload` (
  `img_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `img` varchar(2000) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  PRIMARY KEY (`img_id`),
  KEY `image_owner` (`user_id`),
  CONSTRAINT `image_owner` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `user_upload` (`img_id`, `user_id`, `img`) VALUES (1, 1, NULL);
INSERT INTO `user_upload` (`img_id`, `user_id`, `img`) VALUES (2, 2, NULL);
INSERT INTO `user_upload` (`img_id`, `user_id`, `img`) VALUES (3, 3, NULL);
INSERT INTO `user_upload` (`img_id`, `user_id`, `img`) VALUES (4, 4, NULL);
INSERT INTO `user_upload` (`img_id`, `user_id`, `img`) VALUES (5, 5, NULL);
INSERT INTO `user_upload` (`img_id`, `user_id`, `img`) VALUES (6, 6, NULL);
INSERT INTO `user_upload` (`img_id`, `user_id`, `img`) VALUES (7, 7, NULL);
INSERT INTO `user_upload` (`img_id`, `user_id`, `img`) VALUES (8, 8, NULL);
INSERT INTO `user_upload` (`img_id`, `user_id`, `img`) VALUES (9, 9, NULL);
INSERT INTO `user_upload` (`img_id`, `user_id`, `img`) VALUES (10, 10, NULL);

