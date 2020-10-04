create table "table_course-room_allocation"
(
    ID        INT auto_increment,
    COURSE_ID INT default 0 not null,
    ROOM_ID   INT default 0 not null,
    constraint "TABLE_COURSE-ROOM_ALLOCATION_PK"
        primary key (ID)
);

create table TABLE_ROOMS
(
    ID          INT auto_increment,
    ROOM_NUMBER INT default 0 not null,
    constraint TABLE_ROOMS_PK
        primary key (ID),
    constraint "TABLE_ROOMS_TABLE_COURSE-ROOM_ALLOCATION_COURSE_ID_FK"
        foreign key (ID) references "table_course-room_allocation" (COURSE_ID)
);

create unique index TABLE_ROOMS_ID_UINDEX
    on TABLE_ROOMS (ID);

create unique index TABLE_ROOMS_ROOM_NUMBER_UINDEX
    on TABLE_ROOMS (ROOM_NUMBER);

create unique index "TABLE_COURSE-ROOM_ALLOCATION_ID_UINDEX"
    on "table_course-room_allocation" (ID);

create table "table_course-teacher_allocation"
(
    ID         INT auto_increment,
    TEACHER_ID INT default 0 not null,
    COURSE_ID  INT default 0 not null,
    constraint "TABLE_COURSE-TEACHER_ALLOCATION_PK"
        primary key (ID)
);

create table TABLE_TEACHER
(
    ID   INT auto_increment,
    NAME VARCHAR default NULL,
    constraint TABLE_TEACHER_PK
        primary key (ID),
    constraint "TABLE_TEACHER_TABLE_COURSE-TEACHER_ALLOCATION_TEACHER_ID_FK"
        foreign key (ID) references "table_course-teacher_allocation" (TEACHER_ID)
);

create unique index TABLE_TEACHER_ID_UINDEX
    on TABLE_TEACHER (ID);

create unique index "TABLE_COURSE-TEACHER_ALLOCATION_ID_UINDEX"
    on "table_course-teacher_allocation" (ID);

create table "table_student-selection_allocation"
(
    ID           INT auto_increment,
    STUDENT_ID   INT default 0 not null,
    SELECTION_ID INT default 0 not null
);

create table TABLE_SELECTION
(
    ID          INT auto_increment,
    COURSE_ID   INT default 0 not null,
    N_SELECTION INT default 0 not null,
    constraint TABLE_SELECTION_PK
        primary key (ID),
    constraint "TABLE_SELECTION_TABLE_STUDENT-SELECTION_ALLOCATION_SELECTION_ID_FK"
        foreign key (ID) references "table_student-selection_allocation" (SELECTION_ID),
    constraint "TABLE_SELECTION_TABLE_STUDENT-SELECTION_ALLOCATION_SELECTION_ID_FK_2"
        foreign key (ID) references "table_student-selection_allocation" (SELECTION_ID)
);

create unique index TABLE_SELECTION_ID_UINDEX
    on TABLE_SELECTION (ID);

create unique index "TABLE_STUDENT-SELECTION_ALLOCATION_ID_UINDEX"
    on "table_student-selection_allocation" (ID);

create table "table_student-course_allocation"
(
    ID         INT auto_increment,
    COURSE_ID  INT default 0 not null,
    STUDENT_ID INT default 0 not null,
    constraint "TABLE_STUDENT-COURSE_ALLOCATION_PK"
        primary key (ID)
);

create table TABLE_STUDENTS
(
    ID   INT auto_increment,
    NAME VARCHAR default NULL,
    constraint TABLE_STUDENTS_PK
        primary key (ID),
    constraint "TABLE_STUDENTS_TABLE_STUDENT-COURSE_ALLOCATION_STUDENT_ID_FK"
        foreign key (ID) references "table_student-course_allocation" (STUDENT_ID),
    constraint "TABLE_STUDENTS_TABLE_STUDENT-SELECTION_ALLOCATION_STUDENT_ID_FK"
        foreign key (ID) references "table_student-selection_allocation" (STUDENT_ID),
    constraint "TABLE_STUDENTS_TABLE_STUDENT-SELECTION_ALLOCATION_STUDENT_ID_FK_2"
        foreign key (ID) references "table_student-selection_allocation" (STUDENT_ID)
);

create unique index TABLE_STUDENTS_ID_UINDEX
    on TABLE_STUDENTS (ID);

create table TABLE_COURSES
(
    ID   INT auto_increment,
    NAME VARCHAR default NULL,
    constraint TABLE_COURSES_PK
        primary key (ID),
    constraint "TABLE_COURSES_TABLE_COURSE-ROOM_ALLOCATION_COURSE_ID_FK"
        foreign key (ID) references "table_course-room_allocation" (COURSE_ID),
    constraint "TABLE_COURSES_TABLE_COURSE-TEACHER_ALLOCATION_COURSE_ID_FK"
        foreign key (ID) references "table_course-teacher_allocation" (COURSE_ID),
    constraint TABLE_COURSES_TABLE_SELECTION_COURSE_ID_FK
        foreign key (ID) references TABLE_SELECTION (COURSE_ID),
    constraint TABLE_COURSES_TABLE_SELECTION_COURSE_ID_FK_2
        foreign key (ID) references TABLE_SELECTION (COURSE_ID),
    constraint "TABLE_COURSES_TABLE_STUDENT-COURSE_ALLOCATION_COURSE_ID_FK"
        foreign key (ID) references "table_student-course_allocation" (COURSE_ID)
);

create unique index TABLE_COURSES_ID_UINDEX
    on TABLE_COURSES (ID);

create unique index "TABLE_STUDENT-COURSE_ALLOCATION_ID_UINDEX"
    on "table_student-course_allocation" (ID);


