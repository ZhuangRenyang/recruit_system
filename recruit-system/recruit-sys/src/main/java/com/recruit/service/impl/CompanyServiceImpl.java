package com.recruit.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.recruit.dto.company.CreateOrUpdateCompanyDTO;
import com.recruit.model.CompanyDO;
import com.recruit.mapper.CompanyMapper;
import com.recruit.service.CompanyService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author Eval
 * @since 2022-04-01
 */
@Service
public class CompanyServiceImpl extends ServiceImpl<CompanyMapper, CompanyDO> implements CompanyService {

    @Resource
    private CompanyMapper companyMapper;

    @Override
    public boolean updateCompany(CompanyDO company, CreateOrUpdateCompanyDTO validator) {
        company.setName(validator.getName());
        company.setForeignName(validator.getForeignName());
        company.setCity(validator.getCity());
        company.setLogo(validator.getLogo());
        company.setPoster(validator.getPoster());
        company.setMission(validator.getMission());
        company.setDescription(validator.getDescription());
        company.setState(validator.getState());
        return companyMapper.updateById(company) > 0;
    }

    @Override
    public boolean updateState(Integer id, Integer state) {
        return companyMapper.updateState(id, state);
    }

    @Override
    public boolean createCompany(CreateOrUpdateCompanyDTO validator) {
        CompanyDO companyDO = new CompanyDO();
        companyDO.setName(validator.getName());
        companyDO.setForeignName(validator.getForeignName());
        companyDO.setCity(validator.getCity());
        companyDO.setLogo(validator.getLogo());
        companyDO.setPoster(validator.getPoster());
        companyDO.setMission(validator.getMission());
        companyDO.setDescription(validator.getDescription());
        // 新增企业，状态默认都为0，表示未审核
        companyDO.setState(0);
        return companyMapper.insert(companyDO) > 0;
    }

    @Override
    public CompanyDO getByName(String name) {
        QueryWrapper<CompanyDO> wrapper = new QueryWrapper<>();
        wrapper.eq("name", name);
        CompanyDO companyDO = companyMapper.selectOne(wrapper);
        return companyDO;
    }

    @Override
    public List<CompanyDO> findHotCompany() {
        return companyMapper.findHotCompany();
    }
}
