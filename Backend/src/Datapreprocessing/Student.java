package Datapreprocessing;

import java.util.HashMap;
import java.util.LinkedList;

public class Student {

    HashMap<Integer, LinkedList<Integer>> courseChoices = new HashMap<>();

    public Student() {
        for (int i = 0; i < new DataPreprocessing().courseNames.length; i++) {
            courseChoices.put(i, null);
        }
    }

    public void addChoice(int i, int courseID) {
        LinkedList<Integer> linkedList = courseChoices.get(i);
        if (linkedList == null) {
            linkedList = new LinkedList<>();
        }
        linkedList.add(courseID);
        courseChoices.put(i, linkedList);
        System.out.println(courseChoices.toString());
    }

}
