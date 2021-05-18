## SQL Triggers
A trigger is a piece of code executed automatically in response to a specific event occurred on a table in the database.

A trigger is always associated with a particular table. 
If the table is deleted, all the associated triggers are also deleted automatically.

A trigger is invoked either before or after the following event:

    INSERT – when a new row is inserted
    UPDATE – when an existing row is updated
    DELETE – when a row is deleted.
   
When you issue an INSERT, UPDATE, or DELETE statement, the relational database management system (RDBMS) fires the corresponding trigger.

In some RDMBS, a trigger is also invoked in the result of 
executing a statement that calls the 
INSERT, UPDATE, or DELETE statement. 
For example, MySQL has the LOAD DATA INFILE, 
which reads rows from a text file and inserts into a table at a
very high speed, invokes the BEFORE INSERT and AFTER INSERT triggers.
 
On the other hand, 
a statement may delete rows in a table but does not invoke the 
associated triggers. For example, TRUNCATE TABLE statement 
removes all rows in the table but does not invoke 
the BEFORE DELETE and AFTER DELETE triggers.


### Trigger creation statement syntax
To create a trigger, you use the following statement:
```sql
    CREATE TRIGGER trigger_name [BEFORE|AFTER] event
    ON table_name trigger_type
    BEGIN
      -- trigger_logic
    END;
```

Let’s examine the syntax in more detail:
<ul>
    <li>
        First, specify the name of the trigger after the CREATE TRIGGER clause.
    </li>
    <li>
        Next, use either BEFORE or AFTER keyword to determine when to the trigger should occur in response to a specific event e.g., INSERT, UPDATE, or DELETE.
    </li>
    <li>
        Then, specify the name of the table to which the trigger binds.
    </li>
    <li>
        After, specify the type of trigger using either FOR EACH ROW or FOR EACH STATEMENT. We will discuss more on this in the next section.
    </li>
    <li>
        Finally, put the logic of the trigger in the BEGIN ... END block.
    </li>
</ul>

 Besides using the code in the BEGIN END block, you can execute a stored procedure as follows:
 ```sql
    CREATE TRIGGER trigger_name 
    [BEFORE|AFTER] event
    ON table_name trigger_type
    EXECUTE stored_procedure_name;
```

### Row level trigger vs. statement level trigger
There are two types of triggers: row and statement level triggers.
A row level trigger executes each time a row is affected by an 
UPDATE statement. 
If the UPDATE statement affects 10 rows, 
the row level trigger would execute 10 times, each time per row. 
If the UPDATE statement does not affect any row, 
the row level trigger is not executed at all.

Different from the row level trigger, 
a statement level trigger is called once regardless of 
how many rows affect by the UPDATE statement. 
Note that if the UPDATE statement did not affect any rows, 
the trigger will still be executed.

When creating a trigger, 
you can specify whether a trigger is row or statement level 
by using the FOR EACH ROW or FOR EACH STATEMENT respectively.

### SQL trigger usages
You typically use the triggers in the following scenarios:
<ul>
    <li>
        Log table modifications. 
        Some tables have sensitive data such as customer email, 
        employee salary, etc.,
        that you want to log all the changes. In this case, 
        you can create the UPDATE trigger to insert the changes 
        into a separate table.
    </li>
    <li>
        Enforce complex integrity of data. 
        In this scenario, you may define triggers to validate 
        the data and reformat the data if necessary. 
        For example, you can transform the data before insert or 
        update using a BEFORE INSERT or BEFORE UPDATE trigger.
    </li>
</ul>

Check out examples of trigger.