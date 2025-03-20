/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 80400 (8.4.0)
 Source Host           : localhost:3306
 Source Schema         : old-of

 Target Server Type    : MySQL
 Target Server Version : 80400 (8.4.0)
 File Encoding         : 65001

 Date: 10/3/2025 13:14:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id` ASC, `codename` ASC) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add permission', 1, 'add_permission');
INSERT INTO `auth_permission` VALUES (2, 'Can change permission', 1, 'change_permission');
INSERT INTO `auth_permission` VALUES (3, 'Can delete permission', 1, 'delete_permission');
INSERT INTO `auth_permission` VALUES (4, 'Can view permission', 1, 'view_permission');
INSERT INTO `auth_permission` VALUES (5, 'Can add group', 2, 'add_group');
INSERT INTO `auth_permission` VALUES (6, 'Can change group', 2, 'change_group');
INSERT INTO `auth_permission` VALUES (7, 'Can delete group', 2, 'delete_group');
INSERT INTO `auth_permission` VALUES (8, 'Can view group', 2, 'view_group');
INSERT INTO `auth_permission` VALUES (9, 'Can add user', 3, 'add_user');
INSERT INTO `auth_permission` VALUES (10, 'Can change user', 3, 'change_user');
INSERT INTO `auth_permission` VALUES (11, 'Can delete user', 3, 'delete_user');
INSERT INTO `auth_permission` VALUES (12, 'Can view user', 3, 'view_user');
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 4, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 4, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (16, 'Can view content type', 4, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (17, 'Can add session', 5, 'add_session');
INSERT INTO `auth_permission` VALUES (18, 'Can change session', 5, 'change_session');
INSERT INTO `auth_permission` VALUES (19, 'Can delete session', 5, 'delete_session');
INSERT INTO `auth_permission` VALUES (20, 'Can view session', 5, 'view_session');
INSERT INTO `auth_permission` VALUES (21, 'Can add category', 6, 'add_category');
INSERT INTO `auth_permission` VALUES (22, 'Can change category', 6, 'change_category');
INSERT INTO `auth_permission` VALUES (23, 'Can delete category', 6, 'delete_category');
INSERT INTO `auth_permission` VALUES (24, 'Can view category', 6, 'view_category');
INSERT INTO `auth_permission` VALUES (25, 'Can add role', 7, 'add_role');
INSERT INTO `auth_permission` VALUES (26, 'Can change role', 7, 'change_role');
INSERT INTO `auth_permission` VALUES (27, 'Can delete role', 7, 'delete_role');
INSERT INTO `auth_permission` VALUES (28, 'Can view role', 7, 'view_role');
INSERT INTO `auth_permission` VALUES (29, 'Can add order', 8, 'add_order');
INSERT INTO `auth_permission` VALUES (30, 'Can change order', 8, 'change_order');
INSERT INTO `auth_permission` VALUES (31, 'Can delete order', 8, 'delete_order');
INSERT INTO `auth_permission` VALUES (32, 'Can view order', 8, 'view_order');
INSERT INTO `auth_permission` VALUES (33, 'Can add product', 9, 'add_product');
INSERT INTO `auth_permission` VALUES (34, 'Can change product', 9, 'change_product');
INSERT INTO `auth_permission` VALUES (35, 'Can delete product', 9, 'delete_product');
INSERT INTO `auth_permission` VALUES (36, 'Can view product', 9, 'view_product');
INSERT INTO `auth_permission` VALUES (37, 'Can add order detail', 10, 'add_orderdetail');
INSERT INTO `auth_permission` VALUES (38, 'Can change order detail', 10, 'change_orderdetail');
INSERT INTO `auth_permission` VALUES (39, 'Can delete order detail', 10, 'delete_orderdetail');
INSERT INTO `auth_permission` VALUES (40, 'Can view order detail', 10, 'view_orderdetail');
INSERT INTO `auth_permission` VALUES (41, 'Can add history', 11, 'add_history');
INSERT INTO `auth_permission` VALUES (42, 'Can change history', 11, 'change_history');
INSERT INTO `auth_permission` VALUES (43, 'Can delete history', 11, 'delete_history');
INSERT INTO `auth_permission` VALUES (44, 'Can view history', 11, 'view_history');
INSERT INTO `auth_permission` VALUES (45, 'Can add favorite', 12, 'add_favorite');
INSERT INTO `auth_permission` VALUES (46, 'Can change favorite', 12, 'change_favorite');
INSERT INTO `auth_permission` VALUES (47, 'Can delete favorite', 12, 'delete_favorite');
INSERT INTO `auth_permission` VALUES (48, 'Can view favorite', 12, 'view_favorite');
INSERT INTO `auth_permission` VALUES (49, 'Can add cart', 13, 'add_cart');
INSERT INTO `auth_permission` VALUES (50, 'Can change cart', 13, 'change_cart');
INSERT INTO `auth_permission` VALUES (51, 'Can delete cart', 13, 'delete_cart');
INSERT INTO `auth_permission` VALUES (52, 'Can view cart', 13, 'view_cart');
INSERT INTO `auth_permission` VALUES (53, 'Can add sub category', 14, 'add_subcategory');
INSERT INTO `auth_permission` VALUES (54, 'Can change sub category', 14, 'change_subcategory');
INSERT INTO `auth_permission` VALUES (55, 'Can delete sub category', 14, 'delete_subcategory');
INSERT INTO `auth_permission` VALUES (56, 'Can view sub category', 14, 'view_subcategory');
INSERT INTO `auth_permission` VALUES (57, 'Can add user info', 15, 'add_userinfo');
INSERT INTO `auth_permission` VALUES (58, 'Can change user info', 15, 'change_userinfo');
INSERT INTO `auth_permission` VALUES (59, 'Can delete user info', 15, 'delete_userinfo');
INSERT INTO `auth_permission` VALUES (60, 'Can view user info', 15, 'view_userinfo');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$870000$HQ5z1yY0ifCHuIgNulWBbw$Z5GPlg05kWnCKqXgWeGfQHA7lMjBCzbsWG0fG3O7qlo=', NULL, 1, 'root', '', '', 'root@root.com', 1, 1, '2024-12-29 03:55:53.183042');
INSERT INTO `auth_user` VALUES (2, 'pbkdf2_sha256$870000$aUOuRHNVWd9iv2sW85mGCx$JCDeyTDTGYJ+/5ODggc1z7/oW/zYW7fZBBuFwTRdP04=', '2024-12-29 04:25:18.982163', 0, '商家-1', '', '', 'test@163.com', 0, 1, '2024-12-29 03:55:53.574287');
INSERT INTO `auth_user` VALUES (3, 'pbkdf2_sha256$870000$HgTCPVJOAl5LfjUQxYCvmo$XUlrMuf54N3TSoMzLiAVh7qqcJJGRzcgTU67oRL6KaY=', NULL, 0, '商家-2', '', '', 'test@163.com', 0, 1, '2024-12-29 03:55:53.940272');
INSERT INTO `auth_user` VALUES (4, 'pbkdf2_sha256$870000$4drCgWhHYLY1DF1OCD4u7R$eJpejF9BZIfyQAqqUtpBYuFm+hjSV/WwpLFQMkOh7BQ=', NULL, 0, '用户-1', '', '', 'test@163.com', 0, 1, '2024-12-29 03:55:54.294371');
INSERT INTO `auth_user` VALUES (5, 'pbkdf2_sha256$870000$6IOVMWj5Rue2D7Vy1HoFYR$vOT4gHY36mvOrPOBy7lp1/vnbtlByJoqrHqg3SR2/Ho=', NULL, 0, '用户-2', '', '', 'test@163.com', 0, 1, '2024-12-29 03:55:54.652944');
INSERT INTO `auth_user` VALUES (6, 'pbkdf2_sha256$870000$poYl2fbBJsHHQzKbamqyRX$bwC9DyWB4pM+G2rJnhWeG/IZmIl91yOJa46g8iZJMxc=', NULL, 0, '用户-3', '', '', 'test@163.com', 0, 1, '2024-12-29 03:55:55.016835');
INSERT INTO `auth_user` VALUES (7, 'pbkdf2_sha256$870000$weux6fiWPgR8A0y2D70MRb$qQ7VyQBa7/4hSYsLzyWBg0tbqU8zFxQJMAsT9ARdYjw=', '2024-12-29 03:58:38.134607', 0, 'myf', '', '', 'myf@email.com', 0, 1, '2024-12-29 03:56:51.099232');
INSERT INTO `auth_user` VALUES (8, 'pbkdf2_sha256$870000$yD7nuffbFj6V0UrAuPvsdt$MdCPgOwVDFCeCFYKPcv0gJXB+JLf1WYocd0zATtTAZc=', '2024-12-29 04:24:30.518315', 0, 'myf1', '', '', 'myf1@email.com', 0, 1, '2024-12-29 04:00:28.315091');
INSERT INTO `auth_user` VALUES (9, 'pbkdf2_sha256$870000$fGEJiiStXrsCzZTCEaqjJV$qU9BLWyyPUIAV4BtoRqabHNXeQzv/bFqRi6mCWsxYAw=', '2024-12-29 04:17:29.022337', 0, 'seller1', '', '', 'seller@email.com', 0, 1, '2024-12-29 04:17:28.296337');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id` ASC, `group_id` ASC) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id` ASC) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `added_at` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cart_user_id_1361a739_fk_auth_user_id`(`user_id` ASC) USING BTREE,
  INDEX `cart_product_id_508e72da_fk_product_id`(`product_id` ASC) USING BTREE,
  CONSTRAINT `cart_product_id_508e72da_fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `cart_user_id_1361a739_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (1, 1, '2024-12-29 03:57:39.116719', 7, 8);
INSERT INTO `cart` VALUES (3, 1, '2024-12-29 03:58:04.084442', 7, 3);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `view_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '新鲜果蔬', '2024-12-29 03:55:53.558247');
INSERT INTO `category` VALUES (2, '有机谷物', '2024-12-29 03:55:53.561267');
INSERT INTO `category` VALUES (3, '有机肉类', '2024-12-29 03:55:53.563300');

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label` ASC, `model` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (2, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (1, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (13, 'models', 'cart');
INSERT INTO `django_content_type` VALUES (6, 'models', 'category');
INSERT INTO `django_content_type` VALUES (12, 'models', 'favorite');
INSERT INTO `django_content_type` VALUES (11, 'models', 'history');
INSERT INTO `django_content_type` VALUES (8, 'models', 'order');
INSERT INTO `django_content_type` VALUES (10, 'models', 'orderdetail');
INSERT INTO `django_content_type` VALUES (9, 'models', 'product');
INSERT INTO `django_content_type` VALUES (7, 'models', 'role');
INSERT INTO `django_content_type` VALUES (14, 'models', 'subcategory');
INSERT INTO `django_content_type` VALUES (15, 'models', 'userinfo');
INSERT INTO `django_content_type` VALUES (5, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2024-12-29 03:55:52.068240');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2024-12-29 03:55:52.100018');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2024-12-29 03:55:52.379076');
INSERT INTO `django_migrations` VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2024-12-29 03:55:52.411450');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0003_alter_user_email_max_length', '2024-12-29 03:55:52.425292');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0004_alter_user_username_opts', '2024-12-29 03:55:52.429442');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0005_alter_user_last_login_null', '2024-12-29 03:55:52.458482');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0006_require_contenttypes_0002', '2024-12-29 03:55:52.460524');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2024-12-29 03:55:52.464571');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0008_alter_user_username_max_length', '2024-12-29 03:55:52.499376');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2024-12-29 03:55:52.533862');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0010_alter_group_name_max_length', '2024-12-29 03:55:52.550444');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0011_update_proxy_permissions', '2024-12-29 03:55:52.555602');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0012_alter_user_first_name_max_length', '2024-12-29 03:55:52.588597');
INSERT INTO `django_migrations` VALUES (15, 'models', '0001_initial', '2024-12-29 03:55:53.126245');
INSERT INTO `django_migrations` VALUES (16, 'models', '0002_insert_default_roles', '2024-12-29 03:55:53.139431');
INSERT INTO `django_migrations` VALUES (17, 'models', '0003_create_superuser', '2024-12-29 03:55:53.549391');
INSERT INTO `django_migrations` VALUES (18, 'models', '0004_create_default_category', '2024-12-29 03:55:53.565310');
INSERT INTO `django_migrations` VALUES (19, 'models', '0005_create_test_data_user', '2024-12-29 03:55:55.375201');
INSERT INTO `django_migrations` VALUES (20, 'models', '0006_create_test_data_product', '2024-12-29 03:55:55.393824');
INSERT INTO `django_migrations` VALUES (21, 'sessions', '0001_initial', '2024-12-29 03:55:55.411931');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('f80gtc7yqqqsdltdg93ei5suqqi2wyda', '.eJxVjLsOwjAMAP8lM4qclDzKyN5vqOzYkAJKpKadEP-OInWA9e50bzXjvuV5b7LOC6uLsur0ywjTU0oX_MByrzrVsq0L6Z7owzY9VZbX9Wj_Bhlb7ltA5z2w8dYjW0wSWEai6M5BIDIaiQMFEuHg2IthCDCCuUVOA3qjPl_wXzhX:1tRkre:b8ltE_QRLMULZU5pMdSH6ylK-f8aEKXHFMKv3esE9ec', '2025-01-12 04:25:18.984190');
INSERT INTO `django_session` VALUES ('w7hkagwi49kahjg5pydeuyhf73a5eiyu', '.eJxVjDkOwjAUBe_iGll2fmwcSnrOYP0tJIBsKUuFuDuJlALamXnvbTKuy5DXWac8irmYZE6_jJCfWnYhDyz3armWZRrJ7ok97GxvVfR1Pdq_gwHnYVtziiANQBcCQYt8ls55bDCRbjwFcgQBg-e-BY3qOk_RtazSKypDNJ8v4H84VA:1tRkqs:62cpvp4FgT9N0Hmi-XhmjwRrknvNErHTDiIivPcbFQI', '2025-01-12 04:24:30.520345');

-- ----------------------------
-- Table structure for favorite
-- ----------------------------
DROP TABLE IF EXISTS `favorite`;
CREATE TABLE `favorite`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `view_at` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `favorite_user_id_8a5f8d2c_fk_auth_user_id`(`user_id` ASC) USING BTREE,
  INDEX `favorite_product_id_f7399ea1_fk_product_id`(`product_id` ASC) USING BTREE,
  CONSTRAINT `favorite_product_id_f7399ea1_fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `favorite_user_id_8a5f8d2c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of favorite
-- ----------------------------
INSERT INTO `favorite` VALUES (1, '2024-12-29 03:56:58.603264', 7, 4);
INSERT INTO `favorite` VALUES (2, '2024-12-29 03:57:15.168066', 7, 8);
INSERT INTO `favorite` VALUES (3, '2024-12-29 03:57:57.808694', 7, 3);
INSERT INTO `favorite` VALUES (4, '2024-12-29 04:00:41.142742', 8, 4);
INSERT INTO `favorite` VALUES (5, '2024-12-29 04:00:55.034862', 8, 2);
INSERT INTO `favorite` VALUES (6, '2024-12-29 04:01:46.695772', 8, 9);

-- ----------------------------
-- Table structure for history
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `view_at` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `history_user_id_6457e0b2_fk_auth_user_id`(`user_id` ASC) USING BTREE,
  INDEX `history_product_id_c1879def_fk_product_id`(`product_id` ASC) USING BTREE,
  CONSTRAINT `history_product_id_c1879def_fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `history_user_id_6457e0b2_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of history
-- ----------------------------
INSERT INTO `history` VALUES (1, '2024-12-29 03:57:22.831840', 7, 9);
INSERT INTO `history` VALUES (2, '2024-12-29 03:58:44.518364', 7, 12);
INSERT INTO `history` VALUES (3, '2024-12-29 03:59:12.265241', 7, 3);
INSERT INTO `history` VALUES (4, '2024-12-29 03:59:18.547886', 7, 6);
INSERT INTO `history` VALUES (5, '2024-12-29 03:59:30.224240', 7, 1);
INSERT INTO `history` VALUES (6, '2024-12-29 03:59:32.853312', 7, 4);
INSERT INTO `history` VALUES (7, '2024-12-29 03:59:36.904443', 7, 1);
INSERT INTO `history` VALUES (8, '2024-12-29 03:59:39.952669', 7, 1);
INSERT INTO `history` VALUES (9, '2024-12-29 03:59:55.741316', 7, 3);
INSERT INTO `history` VALUES (10, '2024-12-29 03:59:58.922312', 7, 3);
INSERT INTO `history` VALUES (11, '2024-12-29 04:00:30.650709', 8, 9);
INSERT INTO `history` VALUES (12, '2024-12-29 04:00:33.833277', 8, 4);
INSERT INTO `history` VALUES (13, '2024-12-29 04:00:36.939479', 8, 3);
INSERT INTO `history` VALUES (14, '2024-12-29 04:24:45.258506', 8, 1);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `total_price` int NOT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `added_at` datetime(6) NOT NULL,
  `order_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `completed_at` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_user_id_e323497c_fk_auth_user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `order_user_id_e323497c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (1, 50, '已完成', '2024-12-29 04:05:39.318174', '2024-12-29 04:05:39.318174', 'OF1735445139318', '2024-12-29 04:25:56.272694', 8);

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `price` int NOT NULL,
  `sub_total` int NOT NULL,
  `order_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_detail_order_id_b97dfbdf_fk_order_id`(`order_id` ASC) USING BTREE,
  INDEX `order_detail_product_id_009a48e3_fk_product_id`(`product_id` ASC) USING BTREE,
  CONSTRAINT `order_detail_order_id_b97dfbdf_fk_order_id` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_detail_product_id_009a48e3_fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES (1, 1, 30, 30, 1, 3);
INSERT INTO `order_detail` VALUES (2, 1, 20, 20, 1, 4);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `short_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `supplier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `price` int NOT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `origin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `added_at` datetime(6) NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `other_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_by_id` int NOT NULL,
  `sub_category_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_sub_category_id_969ff5f9_fk_sub_category_id`(`sub_category_id` ASC) USING BTREE,
  INDEX `product_created_by_id_0baf418a_fk_auth_user_id`(`created_by_id` ASC) USING BTREE,
  CONSTRAINT `product_created_by_id_0baf418a_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `product_sub_category_id_969ff5f9_fk_sub_category_id` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, '红宝石草莓', '红宝石草莓以其鲜艳的色泽和甜美的口感著称，是加利福尼亚州的特产。', '红宝石草莓，学名 Fragaria × ananassa ‘Ruby’, 属于多年生草本植物，是草莓家族中的一个优质品种。它是由育种学家精心培育出来的，结合了多个草莓品种的优点，旨在提高产量、改善口感和增强抗病能力。', '美国食品公司', 25, 'static/pictures/草莓_1.jpg', '美国加利福尼亚州', '2024-12-29 03:55:55.384651', '2024-12-29 03:55:55.384651', '销售中', '\n                            季节：6月至8月\n                            包装：500克盒装\n                            保质期：冷藏条件下7天\n                            ', 2, 4);
INSERT INTO `product` VALUES (2, '白雪草莓', '白雪草莓以其独特的白色果肉和淡雅的香气闻名，是日本的高端品种。', '白雪草莓，学名 Fragaria × ananassa ‘Snow White’, 属于多年生草本植物，是草莓家族中的一个珍稀品种。它是由育种学家精心培育出来的，结合了多个草莓品种的优点，旨在创造出一个外观独特、口感甘甜的品种。', '日本食品公司', 50, 'static/pictures/草莓_2.jpg', '日本福冈县', '2024-12-29 03:55:55.385657', '2024-12-29 03:55:55.385657', '销售中', '\n                            季节：1月至3月\n                            包装：300克盒装\n                            保质期：冷藏条件下5天\n                        ', 2, 4);
INSERT INTO `product` VALUES (3, '香气草莓', '香气草莓以其浓郁的芳香和酸甜平衡的口感备受喜爱，是意大利的传统水果。', '香气草莓以其浓郁的芳香和酸甜平衡的口感备受喜爱，是意大利的传统水果。', '意大利食品公司', 30, 'static/pictures/草莓_3.jpg', '意大利托斯卡纳', '2024-12-29 03:55:55.386657', '2024-12-29 03:55:55.386657', '销售中', '\n                        季节：1月至3月\n                        包装：300克盒装\n                        保质期：冷藏条件下5天\n                    ', 2, 4);
INSERT INTO `product` VALUES (4, '森林之吻草莓', '森林之吻草莓生长在寒冷的环境中，果实饱满多汁，带有天然的野果香气。', '以其浓郁的芳香和酸甜平衡的口感备受喜爱，是意大利的传统水果。', '加拿大食品公司', 20, 'static/pictures/草莓_4.jpg', '加拿大不列颠哥伦比亚省', '2024-12-29 03:55:55.386657', '2024-12-29 03:55:55.386657', '销售中', '\n                            季节：7月至9月\n                            包装：450克盒装\n                            保质期：冷藏条件下6天\n                ', 2, 4);
INSERT INTO `product` VALUES (5, '阳光草莓', '阳光草莓在澳洲的温暖气候下生长，色泽鲜艳，甜度高，是夏季的理想选择。', '以其浓郁的芳香和酸甜平衡的口感备受喜爱，是意大利的传统水果。', '澳大利亚食品公司', 20, 'static/pictures/草莓_5.jpg', '澳大利亚昆士兰州', '2024-12-29 03:55:55.386657', '2024-12-29 03:55:55.386657', '销售中', '\n                        季节：7月至9月\n                        包装：450克盒装\n                        保质期：冷藏条件下6天\n                        ', 2, 4);
INSERT INTO `product` VALUES (6, '初恋草莓', '初恋草莓以其小巧可爱的外形和清新淡雅的味道受到年轻消费者的喜爱。', '以其浓郁的芳香和酸甜平衡的口感备受喜爱，是意大利的传统水果。', '澳大利亚食品公司', 35, 'static/pictures/草莓_6.jpg', '韩国庆尚北道', '2024-12-29 03:55:55.386657', '2024-12-29 03:55:55.386657', '销售中', '\n                    季节：7月至9月\n                    包装：450克盒装\n                    保质期：冷藏条件下6天\n                    ', 2, 4);
INSERT INTO `product` VALUES (7, '新疆牛肉', '新疆牛肉以其肉质鲜美、肉质细嫩而闻名。得益于新疆广阔的草原和优良的养殖环境，这里的牛肉品质上乘，营养丰富。', '\n                        品种：主要为天山地区的优质黄牛品种。\n                        饲养方式：采用传统的放养方式，牛只在广阔的草原上自由觅食，食用天然的牧草。\n                        屠宰加工：在严格的质量控制下进行屠宰和加工，确保肉品新鲜、卫生。\n                        包装：真空包装，保持肉质新鲜，方便运输和储存。\n                        ', '\n                        公司名称：新疆绿源生鲜有限公司\n                        联系人：张先生\n                        电话：138-1234-5678\n                        邮箱：xjlvzhou@ Freshfood.com\n                        地址：新疆乌鲁木齐市沙依巴克区友好南路123号\n                        ', 220, 'static/pictures/牛肉-1.jpg', '新疆维吾尔自治区，具体来自天山脚下的草原牧场', '2024-12-29 03:55:55.387657', '2024-12-29 03:55:55.387657', '销售中', '\n                            保质期：在冷藏条件下，保质期为7天；在冷冻条件下，保质期为6个月。\n                            存储条件：建议在0-4°C冷藏保存，或在-18°C以下冷冻保存。\n                            配送方式：可选择快递配送或自提。\n                        ', 2, 10);
INSERT INTO `product` VALUES (8, '五常大米', '五常大米是中国国家地理标志产品，以其晶莹剔透、香甜软糯、口感细腻而闻名。得益于五常市独特的黑土地、清澈的拉林河水和充足的日照，五常大米成为国内外市场的畅销品。', '品种：主要为“稻花香2号”，这是五常大米的核心品种，具有浓郁的香味和优良的口感。五常地区拥有肥沃的黑土地，富含矿物质，适合水稻生长。拉林河及其支流为稻田提供纯净的活水灌溉。', '\n                        公司名称：五常金穗农业有限公司\n                        联系人：李女士\n                        电话：400-888-9999\n                        邮箱：wuchangrice@jinshui.com\n                        地址：黑龙江省哈尔滨市五常市安家镇工业园区\n                        ', 128, 'static/pictures/大米-1.jpg', '中国黑龙江省哈尔滨市五常市', '2024-12-29 03:55:55.388658', '2024-12-29 03:55:55.388658', '销售中', '\n                        保质期：未开封情况下，常温保存保质期为6个月；冷藏保存保质期为12个月。\n                        存储条件：建议存放在阴凉、干燥处，避免阳光直射。\n                        包装：采用真空包装，每袋5公斤或10公斤。\n                        认证：通过国家地理标志产品认证、绿色食品认证。\n                        ', 2, 6);
INSERT INTO `product` VALUES (9, '玉米', '玉米是一种常见且广泛种植的粮食作物，以其丰富的营养和多用途的特性深受消费者喜爱。中国东北地区的玉米因气候适宜、土壤肥沃，品质尤为优良。', '\n                        品种：主要为“甜玉米”和“糯玉米”。\n                        甜玉米：口感脆甜，适合生食或加工成罐头、速冻食品。\n                        糯玉米：口感软糯，淀粉含量高，适合蒸煮或加工成玉米制品。\n                        生长环境：\n                        气候：东北地区夏季温暖湿润，秋季日照充足，昼夜温差大，有利于玉米的生长和糖分积累。\n            ', '\n                        公司名称：五常金穗农业有限公司\n                        联系人：李女士\n                        电话：400-888-9999\n                        邮箱：wuchangrice@jinshui.com\n                        地址：黑龙江省哈尔滨市五常市安家镇工业园区\n                        ', 12, 'static/pictures/玉米-1.jpg', '中国东北地区，尤其是吉林省长春市', '2024-12-29 03:55:55.389659', '2024-12-29 03:55:55.389659', '销售中', '\n                        保质期：未开封情况下，常温保存保质期为6个月；冷藏保存保质期为12个月。\n                        存储条件：建议存放在阴凉、干燥处，避免阳光直射。\n                        包装：采用真空包装，每袋5公斤或10公斤。\n                        认证：通过国家地理标志产品认证、绿色食品认证。\n                        ', 2, 8);
INSERT INTO `product` VALUES (10, '有机油菜', '有机油菜是一种无污染、安全、优质的蔬菜，采用有机农业生产体系种植，不使用化学合成的农药、化肥、生长调节剂等物质，符合国际有机农业的生产标准。', '\n                        品种：上海青、芹菜苗等。\n                        生长环境：\n                        土壤：经过认证的有机土壤，富含有机质。\n                        水源：清洁的山泉水或深井水，无污染。\n                        种植方式：采用轮作、绿肥、生物防治等有机农业技术，保持土壤肥力，控制病虫害。\n                        ', '\n                        公司名称：彭州绿源有机农场\n                        联系人：赵女士\n                        电话：138-0000-1111\n                        邮箱：pzhuiyuan@organicfarm.com\n                        地址：四川省成都市彭州市濛阳镇有机农场路88号\n                        ', 15, 'static/pictures/油菜-1.jpg', '中国四川省成都市彭州市', '2024-12-29 03:55:55.390658', '2024-12-29 03:55:55.390658', '销售中', '\n                        保质期：冷藏条件下，保质期为5天。\n                        存储条件：建议存放在0-4°C的冷藏环境中，避免脱水和机械损伤。\n                        认证：获得中国有机产品认证和欧盟有机认证。\n                        ', 2, 2);
INSERT INTO `product` VALUES (11, '有机生菜', '有机生菜是一种健康、安全的蔬菜，采用有机农业生产方式种植，不使用化学合成的农药、化肥和转基因技术，确保产品的自然和纯净。', '\n                        品种：奶油生菜、罗马生菜等。\n                        生长环境：\n                        土壤：经过有机认证的优质土壤，富含有机质。\n                        水源：来自高山的纯净水源，无污染。\n                        种植方式：采用轮作、生物防治和自然肥料等方法，保护生态环境。\n                        ', '\n                        公司名称：昆明绿野有机农场\n                        联系人：刘先生\n                        电话：139-1234-5678\n                        邮箱：kunminglvye@organicfarm.com\n                        地址：云南省昆明市呈贡区洛龙街道办事处花乡路123号\n                        ', 12, 'static/pictures/生菜-1.jpg', '中国云南省昆明市呈贡区。', '2024-12-29 03:55:55.390658', '2024-12-29 03:55:55.390658', '销售中', '\n                        保质期：冷藏条件下，保质期为7天。\n                        存储条件：建议存放在0-4°C的冷藏环境中，避免脱水和挤压。\n                        认证：中国有机产品认证，欧盟有机认证。\n                        ', 2, 2);
INSERT INTO `product` VALUES (12, '石榴', '石榴是一种营养丰富的水果，以其丰富的维生素C和独特的口感而闻名。中国云南省的蒙自石榴因其果粒饱满、汁多味甜而备受消费者喜爱。', '\n                        品种：主要为“突尼斯软籽石榴”，这是蒙自石榴的代表品种。\n                        生长环境：\n                        气候：蒙自地区属于亚热带季风气候，日照充足，全年温暖，非常适合石榴生长。\n                        土壤：火山灰土质，富含矿物质，为石榴提供充足的养分。\n                        水源：地下水资源丰富，灌溉水源清洁无污染。\n             ', '\n                        公司名称：蒙自丰硕果业有限公司\n                        联系人：张先生\n                        电话：138-8888-9999\n                        邮箱：mengzifruits@fengshuo.com\n                        地址：云南省红河哈尼族彝族自治州蒙自市石榴大道88号\n                        ', 180, 'static/pictures/石榴.jpg', '中国云南省蒙自市。', '2024-12-29 03:55:55.391658', '2024-12-29 03:55:55.391658', '销售中', '\n                        保质期：常温下，石榴可以保存1个月；冷藏条件下，可以保存2-3个月。\n                        存储条件：建议存放在阴凉、干燥处，避免阳光直射和高温。\n                        包装：每箱5公斤，使用泡沫箱和保鲜膜包装，确保运输过程中果实的完整性。\n                        认证：通过中国有机产品认证，绿色食品认证。\n                        ', 2, 5);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '商家');
INSERT INTO `role` VALUES (2, '用户');
INSERT INTO `role` VALUES (3, '管理员');

-- ----------------------------
-- Table structure for sub_category
-- ----------------------------
DROP TABLE IF EXISTS `sub_category`;
CREATE TABLE `sub_category`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `view_at` datetime(6) NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sub_category_category_id_f461f657_fk_category_id`(`category_id` ASC) USING BTREE,
  CONSTRAINT `sub_category_category_id_f461f657_fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sub_category
-- ----------------------------
INSERT INTO `sub_category` VALUES (1, '根茎类', '2024-12-29 03:55:53.559253', 1);
INSERT INTO `sub_category` VALUES (2, '叶茎类', '2024-12-29 03:55:53.559253', 1);
INSERT INTO `sub_category` VALUES (3, '瓜果类', '2024-12-29 03:55:53.559253', 1);
INSERT INTO `sub_category` VALUES (4, '浆果类', '2024-12-29 03:55:53.560258', 1);
INSERT INTO `sub_category` VALUES (5, '柑橘类', '2024-12-29 03:55:53.560258', 1);
INSERT INTO `sub_category` VALUES (6, '大米类', '2024-12-29 03:55:53.561267', 2);
INSERT INTO `sub_category` VALUES (7, '小麦及面粉类', '2024-12-29 03:55:53.562295', 2);
INSERT INTO `sub_category` VALUES (8, '杂粮类', '2024-12-29 03:55:53.562295', 2);
INSERT INTO `sub_category` VALUES (9, '燕麦及麦片', '2024-12-29 03:55:53.562295', 2);
INSERT INTO `sub_category` VALUES (10, '牛肉', '2024-12-29 03:55:53.563300', 3);
INSERT INTO `sub_category` VALUES (11, '猪肉', '2024-12-29 03:55:53.564304', 3);
INSERT INTO `sub_category` VALUES (12, '鸡肉', '2024-12-29 03:55:53.564304', 3);

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phone_num` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `avatar_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `role_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_info_role_id_bd91cf06_fk_role_id`(`role_id` ASC) USING BTREE,
  INDEX `user_info_user_id_5aed5314_fk_auth_user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `user_info_role_id_bd91cf06_fk_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_info_user_id_5aed5314_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (1, '', '', '', '', 3, 1);
INSERT INTO `user_info` VALUES (2, '商家-1', '', '', '', 1, 2);
INSERT INTO `user_info` VALUES (3, '商家-2', '', '', '', 1, 3);
INSERT INTO `user_info` VALUES (4, '用户-1', '', '', '', 2, 4);
INSERT INTO `user_info` VALUES (5, '用户-2', '', '', '', 2, 5);
INSERT INTO `user_info` VALUES (6, '用户-3', '', '', '', 2, 6);
INSERT INTO `user_info` VALUES (7, '', '', '', '', 2, 7);
INSERT INTO `user_info` VALUES (8, '', '', '', '', 2, 8);
INSERT INTO `user_info` VALUES (9, '', '', '', '', 1, 9);

SET FOREIGN_KEY_CHECKS = 1;
