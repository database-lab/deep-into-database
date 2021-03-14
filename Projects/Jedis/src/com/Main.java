package com;

import redis.clients.jedis.Jedis;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Scanner;

public class Main
{
    // The csv data file we use to create the base database
    private static Path initialData = Path.of("NYSE_20210301.csv");
    // Our redis client in java
    private static Jedis jedis = new Jedis();

    /**
     * Creating a new set of key, value
     * @param key
     * @param value
     * @return results of creation
     */
    public static Boolean create(String key, String value)
    {
        try {
            if ( jedis.get(key) != null )
                throw new Exception();
            jedis.set(key, value);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    /**
     * Searching for a value with its key
     * @param key
     * @return results of searching
     */
    public static Boolean fetch(String key)
    {
        try {
            String value = jedis.get(key);
            if ( value != null )
                System.out.println(value);
            return value != null;
        } catch (Exception e) {
            return false;
        }
    }

    /**
     * Updating a value with its key
     * @param key
     * @param value
     * @return results of updating
     */
    public static Boolean update(String key, String value)
    {
        try {
            if ( jedis.get(key) == null )
                throw new Exception();
            jedis.set(key, value);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    /**
     * Deleting a key, value set
     * @param key
     * @return results of deletion
     */
    public static Boolean delete(String key)
    {
        try {
            return  jedis.del(key) == 1;
        } catch (Exception e) {
            return false;
        }
    }

    /**
     * The program loop method
     *
     */
    public static void execute()
    {
        Scanner scanner = new Scanner(System.in);
        String commandLine;
        String[] parts;
        while (true)
        {
            commandLine = scanner.nextLine();
            parts = commandLine.split(" ");
            switch (parts[0])
            {
                case "create":
                    System.out.println( create(parts[1], parts[2]) );
                    break;
                case "fetch":
                    System.out.println( fetch(parts[1]) );
                    break;
                case "update":
                    System.out.println( update(parts[1], parts[2]) );
                    break;
                case "delete":
                    System.out.println( delete(parts[1]) );
                    break;
                case "exit":
                    return;
                default:
                    System.out.println("Error : Wrong input");
            }
        }
    }

    public static void main(String[] args)
    {
        // First connection to redis server
        try {
            System.out.println(jedis.ping("Connection OK 200"));
            jedis.flushAll();
        } catch (Exception e) {
            System.out.println("Error : Something went wrong during connection to Redis Server");
            return;
        }

        // Importing the csv file
        try {
            String data = new String(Files.readAllBytes(initialData));
            String[] rows = data.split("\n");
            for (String row : rows)
            {
                String[] parts = row.split(",");
                jedis.set(parts[0], parts[1]);
            }
        } catch (IOException e) {
            System.out.println(e.getMessage());
            return;
        }

        // Program starts
        execute();

        // Closing the redis client
        jedis.close();
    }
}
