package pl.wrryy.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.wrryy.entity.Project;

import java.util.List;

@Repository
public interface ProjectRepository extends JpaRepository<Project, Integer>{
    public List<Project> findTop5ByOrderByCreatedDesc();
    public List<Project> findAllByOrderByCreatedDesc();


}
