package com.zs.pms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zs.pms.dao.ChannelDao;
import com.zs.pms.po.TChannel;
@Service

public class ChannelServiceImpl implements ChannelService {
	@Autowired
	ChannelDao cd;

	@Override
	
	public List<TChannel> queryById(int id) {
		// TODO Auto-generated method stub
		return cd.queryById(id);
	}

}
