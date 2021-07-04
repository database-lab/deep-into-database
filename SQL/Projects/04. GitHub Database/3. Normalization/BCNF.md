# BCNF Normalize

Candidate keys are *name*, *email*.

## Dependencies Violation
- Organization_Name -> User, Repositories

## Relations
- R1 = (Name, Email, Repositories, Organizations, Followers, Followings, Stars, Forks)
- R2 = (Email, Name, Repositories, Organizations, Followers, Followings, Stars, Forks)
- R3 = (Organization_Name, User, Repositories)
- R4 = (Name, Repositorie_Name, Files)
- R5 = (Name, Repositorie_Name, File_Name, type, content)
