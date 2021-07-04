# Functional Dependencies

<ol>
	<li>
		Name -> Email, Repositories, Organizations, Followers, Followings, Stars, Forks
	</li>
	<li>
		Email -> Name, Repositories, Organizations, Followers, Followings, Stars, Forks
	</li>
	<li>
		Organization_Name -> User, Repositories
	</li>
	<li>
		Name, Repositorie_Name -> Files
	</li>
	<li>
		Name, Repositorie_Name, File_Name -> type, content
	</li>
</ol>

## Candidate key
If we want to find all of the items in our database we need to have
*email* or *name* for user. From that we can find all of the attributes in our main relation.

Sofar we have *email* and *name*.

Because repository does not give all information about user we cannot
use it as a key, and also organization cannot give use all users so they are not valid candidate keys.

Any other attributes is neigher a part of email or name, or it does not gives us all attributes.

So candidate keys are:
- Email
- Name
