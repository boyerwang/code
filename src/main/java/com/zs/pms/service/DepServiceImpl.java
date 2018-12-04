package com.zs.pms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zs.pms.dao.DepDao;
import com.zs.pms.po.TDep;

@Service
public class DepServiceImpl implements DepService {
	@Autowired
	DepDao ddao;

	@Override
	public List<TDep> queryByPid(int pid) {
		// TODO Auto-generated method stub
		return ddao.queryByPid(pid);
	}

}
