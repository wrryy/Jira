package pl.wrryy.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import pl.wrryy.entity.Priority;
import pl.wrryy.entity.Project;
import pl.wrryy.entity.User;

import java.util.List;

@Repository
public interface PriorityRepository extends JpaRepository<Priority, Integer>{
}
