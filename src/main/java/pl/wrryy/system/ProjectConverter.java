package pl.wrryy.system;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.wrryy.entity.Project;
import pl.wrryy.repository.ProjectRepository;

public class ProjectConverter implements Converter<String, Project> {
    @Autowired
    private ProjectRepository projectRepository;

    @Override
    public Project convert(String source) {
        Project priority = projectRepository.findOne(Integer.parseInt(source));
        return priority ;
    }
}

