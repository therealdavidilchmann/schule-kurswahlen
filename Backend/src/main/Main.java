package main;

import Database.JDBC;
import Datapreprocessing.DataPreprocessing;

public class Main {

    private final JDBC database;
    private final DataPreprocessing dataPreprocessing;

    private Main() {
//        used to create connection to mainDB
        database = new JDBC();
//        used to read student choices
        dataPreprocessing = new DataPreprocessing();
    }

    public static void main(String[] args) {
        new Main().start();
    }

    private void start() {
//        connects to mainDB
        database.connect();
        initializeDatabase();
//        disconnects to mainDB
        database.closeConnection();
    }

    private void initializeDatabase() {
//        reads student choices
        dataPreprocessing.readObjects();
    }

}
