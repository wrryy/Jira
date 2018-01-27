package pl.wrryy.entity;

import java.util.ArrayList;
import java.util.List;

public class Activity {
    private static List<String> activities = new ArrayList<>();

    public static void addActivity(String activity) {
        if (activities.size() >= 25) {
            activities.remove(0);
        }
        activities.add(activity);
        System.out.println(activity );
    }

    public static void removeActivity(String activity) {
        activities.remove(activity);
    }

    public static List<String> getActivities() {
        return activities;
    }
}
