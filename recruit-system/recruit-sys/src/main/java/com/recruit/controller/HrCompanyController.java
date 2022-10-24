package com.recruit.controller;

import com.recruit.model.CompanyDO;
import com.recruit.service.HrCompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.recruit.model.HrCompanyDO;
import com.recruit.vo.CreatedVO;
import javax.validation.constraints.Positive;

/**
* @author Eval
* @since 2022-04-05
*/
@RestController
@RequestMapping("/recruit/hr-company")
public class HrCompanyController {

    @Autowired
    private HrCompanyService hrCompanyService;

    @PostMapping("")
    public CreatedVO create(@RequestParam @Positive(message = "{id.positive}") Integer hrID, @RequestParam @Positive(message = "{id.positive}") Integer companyID) {
        hrCompanyService.create(hrID, companyID);
        return new CreatedVO(1);
    }

    /**
     * 根据hr_id查询hr对应的公司信息
     * @param hrID
     * @return
     */
    @GetMapping("/{hrID}")
    public CompanyDO get(@PathVariable(value = "hrID") @Positive(message = "{id.positive}") Integer hrID) {
        return hrCompanyService.getCompany(hrID);
    }

    /**
     * 根据hr_id查询记录
     * @param hrID
     * @return
     */
    @GetMapping("/search/{hrID}")
    public HrCompanyDO getByHrId(@PathVariable(value = "hrID") @Positive(message = "{id.positive}") Integer hrID) {
        return hrCompanyService.getByHrId(hrID);
    }
}
