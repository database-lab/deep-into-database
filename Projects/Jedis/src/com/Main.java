package com;

import redis.clients.jedis.Jedis;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Scanner;

public class Main
{

    private static Path initialData = Path.of("NYSE_20210301.csv");
    private static Jedis jedis = new Jedis();

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

    public static Boolean delete(String key)
    {
        try {
            return  jedis.del(key) == 1;
        } catch (Exception e) {
            return false;
        }
    }

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
        try {
            System.out.println(jedis.ping("Connection OK 200"));
            jedis.flushAll();
        } catch (Exception e) {
            System.out.println("Error : Something went wrong during connection to Redis Server");
            return;
        }

        execute();

        try {
            jedis.lpush("CSV_DATA", new String(Files.readAllBytes(initialData)));
        } catch (IOException e) {
            e.printStackTrace();
        }
        jedis.close();
    }
}
