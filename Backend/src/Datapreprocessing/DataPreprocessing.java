package Datapreprocessing;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.io.FileReader;
import java.io.IOException;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public class DataPreprocessing {

    private final JSONParser jsonParser = new JSONParser();
    public String[] courseNames = {"German_Choices", "English_Choices", "Spanish_Choices", "French_Choices", "Art_Choices", "Music_Choices", "DSP_Choices", "PoWi_Choices", "History_Choices", "Ethics_Choices", "Religion_ev_Choices", "Religion_kath_Choices", "Math_Choices", "Physics_Choices", "Chemistry_Choices", "Biology_Choices", "Computer_Science_Choices"};
    private final List<Student> studentList = new LinkedList<>();

    public void readObjects() {
        try {
            JSONObject jsonObject = (JSONObject) jsonParser.parse((new FileReader("Backend/src/JSON/sample.json")));
            int loopCount = 0;
            int maxLoop = Integer.parseInt((String) jsonObject.get("loop_size"));
            JSONArray jsonArray;
            while (loopCount < maxLoop){
                JSONObject student = (JSONObject) jsonObject.get(String.valueOf(loopCount));
                studentList.add(new Student());
                int courseCount = 0;
                for (String courseName : courseNames) {
                    jsonArray = (JSONArray) student.get(courseName);
                    for (Object obj : jsonArray) {
                        studentList.get(loopCount).addChoice(courseCount, (Long) obj);
                    }
                    courseCount++;
                }
                loopCount++;
                System.out.println(loopCount);
            }
        } catch (ParseException | IOException e) {
            e.printStackTrace();
        }
    }

}
