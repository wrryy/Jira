package pl.wrryy.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import pl.wrryy.entity.Task;
import pl.wrryy.entity.User;

import java.util.List;

@Repository
public interface TaskRepository extends JpaRepository<Task, Integer>{
    public List<Task> findAllByOrderByCreatedDesc();
    @Query(nativeQuery = true, value = "Select * from task where project_id=:id")
    public List<Task> findAllByProjectId(@Param("id") int id);
}
