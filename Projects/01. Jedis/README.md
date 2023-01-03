# Jedis

<p>
  This project is a java client for useing <b><a href="https://redis.io/">Redis</a> database</b> on windows.
</p>

## Install
<p>
   First you need to instull Redis virtual server on your windows.<br />
   You can check Redis repository for source codes <a href="https://github.com/redis/redis">here</a>.<br />
   To simply download Redis virtual server and run it on your windows, <a href="https://riptutorial.com/redis/example/29962/installing-and-running-redis-server-on-windows">check here</a>.<br />
   For linux version or mac , <a href="https://redis.io/download">check here</a>.
</p>

## Java Client
<p>
  You can download any <a href="https://redis.io/clients#java">java library for working with Redis</a>.<br />
  In this project we use the Jedis library.<br />
  Just add the <b>.jar</b> file to your project and start the program.
</p>

## How to use
<p>
  In this program we simply test the four base methods of Redis database.<br />
  <ul>
    <li>Create</li>
    <li>Update</li>
    <li>Fetch</li>
    <li>Remove</li>
  </ul>
  
  ```mysql
  create <key> <value>
  ```
  
  ```mysql
  update <key> <value>
  ```
  
  ```mysql
  fetch <key>
  ```
  
  ```mysql
  delete <key> 
  ```
</p>

## CSV file
<p>
  For setting the initializing data into the database, this program can read set of keys and values from a <i><b>.csv</b></i> file and place them into database.
</p>
