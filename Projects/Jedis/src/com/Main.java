package com;

import redis.clients.jedis.Jedis;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

public class Main 
{

    private static Path initialData = Path.of("NYSE_20210301.csv");

    public static void main(String[] args)
    {
        Jedis jedis = new Jedis();
        System.out.println(jedis.ping("Connection OK 200"));

        try {
            jedis.lpush("CSV_DATA", new String(Files.readAllBytes(initialData)));
        } catch (IOException e) {
            e.printStackTrace();
        }
        jedis.close();
    }
}
