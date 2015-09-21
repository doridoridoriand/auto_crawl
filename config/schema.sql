create table `crawled_origin_pages` (
  `id`        bigint(20)    unsigned not null,
  `page_id`   bigint(20)    unsigned not null,
  `top_url`   varchar(768)  not null,
  `page_type` varchar(256)  not null,
  `url`       varchar(768)  not null,
  `html`      varchar(2048) not null,
  primary key(`id`)
) engine=InnoDB default charset=utf8;

create table `target_web_sites` (
  `id`  bigint(20)   unsigned not null,
  `url` varchar(768) not null,
  primary key(`id`)
) engine=InnoDB default charset=utf8;

create table `target_links` (
  `id`        bigint(40)   unsigned not null,
  `top_url`   varchar(768) not null,
  `url`       varchar(768) not null,
  `page_type` varchar(256),
  primary key(`id`)
) engine=InnoDB default charset=utf8;
