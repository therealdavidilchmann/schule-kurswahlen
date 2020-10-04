package main;

import Database.JDBC;
import Datapreprocessing.DataPreprocessing;

public class Main {

    private JDBC database;
    private DataPreprocessing dataPreprocessing;

    private Main() {
        database = new JDBC();
    }

    public static void main(String[] args) {
        new Main().start();
    }

    private void start() {
        database.connect();
        initializeDatabase();
        database.closeConnection();
    }

    private void initializeDatabase() {
        database.createStatement("CREATE TABLE ");
    }

}
