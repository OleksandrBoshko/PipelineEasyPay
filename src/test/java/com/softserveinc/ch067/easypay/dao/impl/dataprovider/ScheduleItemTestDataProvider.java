package com.softserveinc.ch067.easypay.dao.impl.dataprovider;

import java.util.ArrayList;

public class ScheduleItemTestDataProvider {

    private Object[] parametersForIsExist() {
        return new Object[]{
                new Object[]{1L, new ArrayList<Long>() {{
                    add(1L);
                    add(2L);
                }}, true},
                new Object[]{6L, new ArrayList<Long>() {{
                    add(3L);
                    add(4L);
                }}, false},
        };
    }

}
