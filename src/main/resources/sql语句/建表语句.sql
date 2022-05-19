-- auto-generated definition
create table books
(
    bookID     int(10) comment '书id',
    bookName   varchar(100) not null comment '书名',
    bookCounts int          not null comment '数量',
    detail     varchar(600) not null comment '描述',
    bookType   varchar(10)  null comment '图书类别',
    Press      varchar(50)  null comment '出版社',
    bookAuthor varchar(100) null comment '书籍作者',
    bookDate   date         null,
    bookPage   int          null comment '书籍页数',
    constraint books_bookName_uindex
        unique (bookName)
);

create index bookID
    on books (bookID);

alter table books
    modify bookID int(10) auto_increment comment '书id';



-- auto-generated definition
create table user
(
    userID       int auto_increment
        primary key,
    userName     varchar(100) not null comment '姓名',
    userPassword varchar(100) not null comment '用户密码',
    userPhone    varchar(100) null,
    userSex      varchar(2)   null,
    userAge      int          null,
    constraint user_userName_uindex
        unique (userName)
)
    comment '用户表';

-- auto-generated definition
create table manager
(
    managerID int auto_increment,
    Name      varchar(200) not null,
    password  varchar(200) not null,
    constraint manager_ID_uindex
        unique (managerID),
    constraint manager_Name_uindex
        unique (Name)
)
    comment '管理员';

alter table manager
    add primary key (managerID);



-- auto-generated definition
create table borrow
(
    bookID int  not null comment '图书ID',
    userID int  not null comment '用户ID',
    time   date not null comment '借阅日期',
    primary key (bookID, userID),
    constraint borrow_ibfk_1
        foreign key (bookID) references books (bookID),
    constraint borrow_ibfk_2
        foreign key (userID) references user (userID)
)
    comment '借阅表';

create index userID
    on borrow (userID);



-- auto-generated definition
create table comments
(
    userID       int          not null,
    bookID       int          not null,
    bookComments varchar(500) null,
    CommentDate  date         null comment '评论日期',
    primary key (userID, bookID),
    constraint comments_ibfk_1
        foreign key (userID) references user (userID),
    constraint comments_ibfk_2
        foreign key (bookID) references books (bookID)
)
    comment '评论表';

create index bookID
    on comments (bookID);




