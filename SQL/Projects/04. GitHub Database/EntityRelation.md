# Entity Relation model

Designing the first schema of the project, which are the relations and entities.

## Entities
<ul>
	<li>
		User => name repositories organizations stars forks followers followings
	</li>
	<li>
		Account => email password
	</li>
	<li>
		Repository => name owner files organizations
	</li>
	<li>
		Private Repositry => weack entity
	</li>
	<li>
		Organization => user repositories name
	</li>
	<li>
		File => name type content
	</li>
</ul>

## Relations
<ul>
	<li>
		User and Account => one to one / total
	</li>
	<li>
		User and repository => one to one / total ( Users can have no repository but each repository must have a user )
	</li>
	<li>
		User modifies repositories
	</li>
	<li>
		User and followers => many to many / partial
	</li>
	<li>
		User and followings => many to many / partial
	</li>
	<li>
		User a part of organization => many to many / partial ( Each organization must have at least one user, but user be a part of no organizations )
	</li>
	<li>
		Organization has repositories => one to many ( Each organization can have many repositories but each repository can be for just one organization )
	</li>
	<li>
		Repository has files => one to many ( Each repository can have many files but each file can be for just one repository )
	</li>
	<li>
		User gives star to repository => one to many ( Each repository can have many stars but user only gives one star to a repository )
	</li>
	<li>
		User forks a repository => one to many ( Each repository can have many forks, but user can fork a repository just once )
	</li>
</ul>