# Forth normal form

Based on the BCNF decomposition we have :

- R1 = (Name, Email, Repositories, Organizations, Followers, Followings, Stars, Forks)
- R2 = (Email, Name, Repositories, Organizations, Followers, Followings, Stars, Forks)
- R3 = (Organization_Name, User, Repositories)
- R4 = (Name, Repositorie_Name, Files)
- R5 = (Name, Repositorie_Name, File_Name, type, content)

## Putting multivalues into tables of their own
- R1 = (Name, Email)
- R2 = (Name, Email, Repositories)
- R3 = (Name, Email, Organizations)
- R4 = (Name, Email, Followers)
- R5 = (Name, Email, Followings)
- R6 = (Name, Email, Stars)
- R7 = (Name, Email, Forks)
- R8 = (Organization_Name)
- R9 = (Organization_Name, User)
- R10 = (Organization_Name, Repositories)
- R12 = (Name, Repositorie_Name, Files)
- R13 = (Name, Repositorie_Name, File_Name, type, content)

And that is it for our normalization.