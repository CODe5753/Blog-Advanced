CREATE TABLE `user` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `email` varchar(255),
  `created_at` timestamp,
  `modified_at` timestamp
);

CREATE TABLE `post` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `user_id` int,
  `title` varchar(255),
  `content` varchar(255),
  `comment_enabled` boolean COMMENT '댓글 활성화 여부',
  `created_at` timestamp,
  `modified_at` timestamp
);

CREATE TABLE `comment` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `user_id` int,
  `post_id` int,
  `content` varchar(3000),
  `group_id` int,
  `parent_comment_id` int COMMENT '부모 댓글 id이며 depth를 구분하기 위함',
  `enabled` boolean COMMENT '댓글 표시 여부(삭제기능)',
  `created_at` timestamp,
  `modified_at` timestamp
);

CREATE TABLE `like_post` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `user_id` int,
  `post_id` int,
  `created_at` timestamp,
  `modified_at` timestamp
);

CREATE TABLE `like_comment` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `user_id` int,
  `comment_id` int,
  `created_at` timestamp,
  `modified_at` timestamp
);

CREATE TABLE `hit` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `post_id` int,
  `count` int,
  `created_at` timestamp,
  `modified_at` timestamp
);

CREATE TABLE `hit_session` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `user_id` int,
  `post_id` int,
  `created_at` timestamp,
  `modified_at` timestamp
);

ALTER TABLE `user` COMMENT = '# 유저 테이블
- 유저의 회원 정보 관리';

ALTER TABLE `post` COMMENT = '# 게시글 테이블';

ALTER TABLE `comment` COMMENT = '# 댓글 테이블
> 현재는 2depth 까지만 지원';

ALTER TABLE `like_post` COMMENT = '# 게시물 좋아요 테이블';

ALTER TABLE `like_comment` COMMENT = '# 댓글 좋아요 테이블';

ALTER TABLE `hit` COMMENT = '# 조회수 테이블
- 각 게시물별 조회수 갯수를 카운팅 함';

ALTER TABLE `hit_session` COMMENT = '# 조회수 세션 테이블
- 각 유저당 특정 게시물에 유효한 조회수를 카운팅 하기 위해 생성된 테이블
> 현재 버전에서는 비로그인 유저는 카운팅 되지 않음';

ALTER TABLE `post` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `comment` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `comment` ADD FOREIGN KEY (`post_id`) REFERENCES `post` (`id`);

ALTER TABLE `comment` ADD FOREIGN KEY (`parent_comment_id`) REFERENCES `comment` (`id`);

ALTER TABLE `like_post` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `like_post` ADD FOREIGN KEY (`post_id`) REFERENCES `post` (`id`);

ALTER TABLE `like_comment` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `like_comment` ADD FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`);

ALTER TABLE `hit` ADD FOREIGN KEY (`post_id`) REFERENCES `post` (`id`);

CREATE TABLE `user_hit_session` (
  `user_id` int NOT NULL,
  `hit_session_user_id` int NOT NULL,
  PRIMARY KEY (`user_id`, `hit_session_user_id`)
);

ALTER TABLE `user_hit_session` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `user_hit_session` ADD FOREIGN KEY (`hit_session_user_id`) REFERENCES `hit_session` (`user_id`);


CREATE TABLE `post_hit_session` (
  `post_id` int NOT NULL,
  `hit_session_post_id` int NOT NULL,
  PRIMARY KEY (`post_id`, `hit_session_post_id`)
);

ALTER TABLE `post_hit_session` ADD FOREIGN KEY (`post_id`) REFERENCES `post` (`id`);

ALTER TABLE `post_hit_session` ADD FOREIGN KEY (`hit_session_post_id`) REFERENCES `hit_session` (`post_id`);

