package com.wellness360.taskmaster.service;

import com.wellness360.taskmaster.model.Task;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class TaskService {

    private final List<Task> tasks = new ArrayList<>();

    public TaskService() {

        tasks.add(new Task(1L,
                "Learn Spring Boot",
                "Complete Spring Boot basics",
                "OPEN"));

        tasks.add(new Task(2L,
                "Learn Docker",
                "Containerize the application",
                "OPEN"));

    }

    public List<Task> getAllTasks() {
        return tasks;
    }

    public Task getTaskById(Long id) {

        for (Task task : tasks) {

            if (task.getId().equals(id)) {
                return task;
            }

        }

        return null;

    }

    public Task addTask(Task task) {

        task.setId((long) (tasks.size() + 1));

        tasks.add(task);

        return task;

    }

    public Task updateTask(Long id, Task updatedTask) {

        for (Task task : tasks) {

            if (task.getId().equals(id)) {

                task.setTitle(updatedTask.getTitle());
                task.setDescription(updatedTask.getDescription());
                task.setStatus(updatedTask.getStatus());

                return task;

            }

        }

        return null;

    }

    public String deleteTask(Long id) {

        tasks.removeIf(task -> task.getId().equals(id));

        return "Task Deleted Successfully";

    }

}