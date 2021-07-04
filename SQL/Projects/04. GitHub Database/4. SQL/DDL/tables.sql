/* Creating a database name githubdb */
create database 'GITHUBDB';

/* This is the accounts table */
create table 'account' (
    Name varchar(20),
    Email varchar(20),
    PRIMARY KEY (Name)
);

/* A single repository */
create table 'repository' (
    Id int,
    Name varchar(20),
    PRIMARY KEY (Id)
);

/* Private repository which is a weak entity */
create table 'private_repository' (
    Id int,
    RepoId int,
    PRIMARY KEY (Id),
    FOREIGN KEY (RepoId) references 'repository'(Id)
);

/* A single file */
create table 'file' (
    Id int,
    Name varchar(20) not null,
    Type varchar(5),
    Content varchar(200),
    PRIMARY KEY (Id)
);

/* Organization table */
create table 'organization' (
    Name varchar(20) PRIMARY KEY
);

/* Relation of user and repos */
create table 'user_repo' (
    User_Name varchar(20),
    Repo_ID int,
    PRIMARY KEY (User_Name, Repo_ID)
);

/* Accessing repo files relation */
create table 'repo_file' (
    Id int PRIMARY KEY ,
    User_Name varchar(20),
    Repo_Name varchar(20),
    FOREIGN KEY (User_Name, Repo_Name) references 'user_repo'(User_Name, Repo_Name)
);

/* Create followers table */
create table 'followers' (
    Name varchar(20),
    Follower varchar(20),
    PRIMARY KEY (Name, Follower),
    FOREIGN KEY (Name) references 'account'(Name),
    FOREIGN KEY (Follower) references 'account'(Name)
);

/* Create followings table */
create table 'followings' (
    Name varchar(20),
    Follower varchar(20),
    PRIMARY KEY (Name, Follower),
    FOREIGN KEY (Name) references 'account'(Name),
    FOREIGN KEY (Follower) references 'account'(Name)
);

/* Create stars table */
create table 'stars' (
    Name varchar(20),
    Id int,
    PRIMARY KEY (Name, Id),
    FOREIGN KEY (Name) references 'account'(Name),
    FOREIGN KEY (Id) references 'repository'(Id)
);

/* Create forks table */
create table 'forks' (
    Name varchar(20),
    Id int,
    PRIMARY KEY (Name, Id),
    FOREIGN KEY (Name) references 'account'(Name),
    FOREIGN KEY (Id) references 'repository'(Id)
);

/* Create user organization users table */
create table 'organization_users' (
    U_Name varchar(20),
    O_Name varchar(20),
    PRIMARY KEY (U_Name, O_Name),
    FOREIGN KEY (U_Name) references 'account'(Name),
    FOREIGN KEY (O_Name) references 'organization'(Name)
);

/* Create user organization repos table */
create table 'organization_users' (
    O_Name varchar(20),
    Id int,
    PRIMARY KEY (Id, O_Name),
    FOREIGN KEY (Id) references 'repository'(Id),
    FOREIGN KEY (O_Name) references 'organization'(Name)
);