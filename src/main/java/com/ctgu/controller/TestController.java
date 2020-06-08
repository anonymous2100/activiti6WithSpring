package com.ctgu.controller;

import org.activiti.engine.RepositoryService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ctgu.common.ResultMsg;
import com.ctgu.entity.User;

/**
 * @ClassName: TestController
 * @Description: 测试接口 ，没什么意义
 * @author lh2
 * @date 2020年4月24日 下午5:54:06
 */
@Controller
@RequestMapping("/test")
public class TestController
{
	private Logger logger = LoggerFactory.getLogger(TestController.class);

	@Autowired
	private RepositoryService repositoryService;

	@RequestMapping(value = "/user.do", method = { RequestMethod.GET })
	@ResponseBody
	public ResultMsg testUser()
	{
		User u = new User(1, "zs", "12346");

		return ResultMsg.success(u);
	}

}
