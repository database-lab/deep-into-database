# Third normal form normalization

Candidate keys are *name*, *email*.

## Violet dependencies
- Organization_Name -> User, Repositories
- Name, Repositorie_Name -> Files
- Name, Repositorie_Name, File_Name -> type, content

## Cannonical Cover
- Name -> Email, Repositories, Organizations, Followers, Followings, Stars, Forks
- Email -> Name, Repositories, Organizations, Followers, Followings, Stars, Forks
- Organization_Name -> User, Repositories

## 3NF Decompose
- R1 = (Name, Email, Repositories, Organizations, Followers, Followings, Stars, Forks) with Key Name 
- R2 = (Organization_Name, User, Repositories) with Key Organization_Name