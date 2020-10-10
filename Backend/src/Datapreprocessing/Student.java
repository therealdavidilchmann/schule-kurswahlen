package Datapreprocessing;

import java.util.HashMap;
import java.util.LinkedList;

public class Student {

//    courseChoices (courseID, (1st, 2nd, 3rd, nth choice))
    private final HashMap<Integer, LinkedList<Long>> courseChoices = new HashMap<>();

    public Student() {
//        creates courseIDs
        for (int i = 0; i < new DataPreprocessing().courseNames.length; i++) {
            courseChoices.put(i, null);
        }
    }

    public void addChoice(int index, Long courseID) {
        LinkedList<Long> linkedList = courseChoices.get(index);
//        if choice list is empty, then create list
        if (linkedList == null) {
            linkedList = new LinkedList<>();
        }
//        adds nth choice to list
        linkedList.add(courseID);
//        updates courseChoice
//        index = courseID
        courseChoices.put(index, linkedList);
    }

//    returns list with all courseChoices
    public LinkedList<Long> getChoiceList(int index) {
        return courseChoices.get(index);
    }
}
