package pl.wrryy.system;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.wrryy.entity.Priority;
import pl.wrryy.repository.PriorityRepository;

public class PriorityConverter implements Converter<String, Priority> {
    @Autowired
    private PriorityRepository priorityRepository;

    @Override
    public Priority convert(String source) {
        Priority priority = priorityRepository.findOne(Integer.parseInt(source));
        return priority ;
    }
}

