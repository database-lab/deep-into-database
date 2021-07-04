/* Deleting a user */
DELETE FROM 'account' WHERE Name = "input" or Email = "input";

/* Deleting a repo */
DELETE FROM 'repository' WHERE Id = ( SELECT Repo_id FROM 'user_repo' where User_name = "input");

/* Deleting a file */
DELETE FROM 'file' WHERE Id = ( SELECT Id FROM 'repo_file' WHERE User_name = "input" and Repo_Name = "input );