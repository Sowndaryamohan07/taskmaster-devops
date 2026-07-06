package com.wellness360.taskmaster.controller;

import com.wellness360.taskmaster.model.Task;
import com.wellness360.taskmaster.service.TaskService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/tasks")
public class TaskController {

    private final TaskService taskService;

    public TaskController(TaskService taskService) {

        this.taskService = taskService;

    }

    @GetMapping
    public List<Task> getAllTasks() {

        return taskService.getAllTasks();

    }

    @GetMapping("/{id}")
    public Task getTask(@PathVariable Long id) {

        return taskService.getTaskById(id);

    }

    @PostMapping
    public Task addTask(@RequestBody Task task) {

        return taskService.addTask(task);

    }

    @PutMapping("/{id}")
    public Task updateTask(@PathVariable Long id,
                           @RequestBody Task task) {

        return taskService.updateTask(id, task);

    }

    @DeleteMapping("/{id}")
    public String deleteTask(@PathVariable Long id) {

        return taskService.deleteTask(id);

    }

}