package Datapreprocessing;

import java.util.HashMap;
import java.util.LinkedList;

public class Student {

    private final HashMap<Integer, LinkedList<Long>> courseChoices = new HashMap<>();

    public Student() {
        for (int i = 0; i < new DataPreprocessing().courseNames.length; i++) {
            courseChoices.put(i, null);
        }
    }

    public void addChoice(int index, Long courseID) {
        LinkedList<Long> linkedList = courseChoices.get(index);
        if (linkedList == null) {
            linkedList = new LinkedList<>();
        }
        linkedList.add(courseID);
        courseChoices.put(index, linkedList);
        System.out.println(courseChoices.toString());
    }

    public LinkedList<Long> getSelectionList(int index) {
        return courseChoices.get(index);
    }
}
