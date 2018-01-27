package pl.wrryy.system;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.wrryy.entity.Status;
import pl.wrryy.repository.StatusRepository;

public class StatusConverter implements Converter<String, Status> {
    @Autowired
    private StatusRepository statusRepository;

    @Override
    public Status convert(String source) {
        Status status = statusRepository.findOne(Integer.parseInt(source));
        return status ;
    }
}

