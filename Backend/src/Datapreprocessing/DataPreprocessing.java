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
    private List<Long> idList = new LinkedList<>();
    private HashMap<Integer, LinkedList<String>> hashes = new HashMap<>();
    private HashMap<Long, HashMap<Integer, LinkedList<String>>> courseChoices = new HashMap<>();
    public String[] courseNames = {"German_Choices", "English_Choices", "Spanish_Choices", "French_Choices", "Art_Choices", "Music_Choices", "DSP_Choices", "PoWi_Choices", "History_Choices", "Ethics_Choices", "Religion_ev_Choices", "Religion_kath_Choices", "Math_Choices", "Physics_Choices", "Chemistry_Choices", "Biology_Choices", "Computer_Science_Choices"};

    public static void main(String[] args) {

    }

    /*private void readObjects() {
        try {
//            Variable to check if JSON file is at the end
            boolean atEnd = false;
            int loopCount = 0;
            JSONObject jsonObject = (JSONObject) jsonParser.parse(new FileReader("Backend/src/JSON/sample.json"));
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
    }*/

    private void readObjects() {

    }

}
