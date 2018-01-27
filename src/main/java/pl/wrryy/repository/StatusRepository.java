package pl.wrryy.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import pl.wrryy.entity.Status;
import pl.wrryy.entity.Task;
import pl.wrryy.entity.User;

import java.util.List;

@Repository
public interface StatusRepository extends JpaRepository<Status, Integer>{
}
