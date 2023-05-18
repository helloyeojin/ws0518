package com.myadmin.lecture;

import com.myadmin.dto.Lecture;
import com.myadmin.service.LectureService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
public class UpdateTest {

    @Autowired
    LectureService service;

    @Test
    void contextLoads() {
        Lecture obj = new Lecture(100000, "title0", "teacher0", "topic0", "target0",
                "asd",3, 1, 200000, "img0");
        try {
            service.modify(obj);
            service.get();
            log.info("======================================");
            log.info("수정완료");
            log.info("======================================");
        } catch (Exception e) {
            log.info("lecture update test error");
            e.printStackTrace();
        }
    }
}
