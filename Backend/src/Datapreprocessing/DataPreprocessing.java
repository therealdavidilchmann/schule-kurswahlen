package Datapreprocessing;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.io.FileReader;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

public class DataPreprocessing {

    private final JSONParser jsonParser = new JSONParser();
    public String[] courseNames = {"German_Choices", "English_Choices", "Spanish_Choices", "French_Choices", "Art_Choices", "Music_Choices", "DSP_Choices", "PoWi_Choices", "History_Choices", "Ethics_Choices", "Religion_ev_Choices", "Religion_kath_Choices", "Math_Choices", "Physics_Choices", "Chemistry_Choices", "Biology_Choices", "Computer_Science_Choices"};
    private final List<Student> studentList = new LinkedList<>();

    public void readObjects() {
        System.out.println("Reading Student Choices...");
        try {
//            jsonObject = first object
            JSONObject jsonObject = (JSONObject) jsonParser.parse((new FileReader("DIF/exchange_to_backend/sample.json")));
//            amount of times already iterated
            int loopCount = 0;
//            amount of times to iterate
            int maxLoop = Integer.parseInt((String) jsonObject.get("loop_size"));
//            iterate until json file is finished
            while (loopCount < maxLoop){
//                student object: 0, 1, 2, n
                JSONObject student = (JSONObject) jsonObject.get(String.valueOf(loopCount));
                System.out.print("Creating student " + loopCount + "...");
//                create new student
                studentList.add(new Student());
//                iterates through courseIDs
                int courseCount = 0;
                for (String courseName : courseNames) {
//                    creates jsonArray for 1, 2, 3, n choice
                    JSONArray jsonArray = (JSONArray) student.get(courseName);
//                    Iterates through jsonArray
                    for (Object obj : jsonArray) {
//                        adds choices to student class
                        studentList.get(loopCount).addChoice(courseCount, (Long) obj);
                    }
//                    increments courseID
                    courseCount++;
                }
                System.out.println("created student");
//                increments studentID
                loopCount++;
            }
            System.out.println("Reading Student Choices...OK!");
        } catch (ParseException | IOException e) {
            System.out.println("Critical Error: Reading Student Choices...FAIL!");
            e.printStackTrace();
        }
    }

}
