package com.example.todo_list.repository;

import com.example.todo_list.model.Task;

import java.math.BigDecimal;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository 
public interface TaskRepository extends JpaRepository<Task, Long> {

    @Query("SELECT COALESCE(SUM(t.valor), 0) FROM Task t")
    BigDecimal somarValorTotal();

}
