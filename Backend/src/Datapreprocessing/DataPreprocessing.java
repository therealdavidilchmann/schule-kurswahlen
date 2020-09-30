package Datapreprocessing;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

public class DataPreprocessing {

    private final JSONParser jsonParser = new JSONParser();
    List<Long> idList = new LinkedList<>();
    HashMap<Integer, LinkedList<String>> hashes = new HashMap<>();
    HashMap<Long, HashMap<Integer, LinkedList<String>>> courseChoices = new HashMap<>();

    public static void main(String[] args) {
        new DataPreprocessing().readObjects();
    }

    private void readObjects() {
        try {
            boolean atEnd = false;
            int loopCount = 0;
            JSONObject jsonObject = (JSONObject) jsonParser.parse(new FileReader("Backend/src/Datapreprocessing/sample.json"));
            while (!atEnd) {
                int courseCount = 0;
                LinkedList<String> tempList = new LinkedList<>();
                JSONArray jsonArray = (JSONArray) jsonObject.get("Math_Choices");
                idList.add((Long) jsonObject.get("ID"));
                for (Object obj : jsonArray) {
                    System.out.println((String) obj);
                    tempList.add((String) obj);
                }
                hashes.put(courseCount, tempList);
                courseChoices.put(idList.get(loopCount), hashes);
                courseCount++;
                tempList.clear();
                jsonArray = (JSONArray) jsonObject.get("Computer_Science_Choices");
                for (Object obj : jsonArray) {
                    System.out.println((String) obj);
                    tempList.add((String) obj);
                }
                hashes.put(courseCount, tempList);
                if ((boolean) jsonObject.get("END")) {
                    atEnd = true;
                }
            }
        } catch (ParseException | IOException e) {
            e.printStackTrace();
        }
    }

    private void writeToDatabase() {
    }

}
