package com.ctgu;

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.ProcessEngineConfiguration;
import org.junit.Test;

public class ConfigTest
{

	@Test
	public void testCreateTableWithXml()
	{
		// 引擎配置
		ProcessEngineConfiguration pc = ProcessEngineConfiguration
				.createProcessEngineConfigurationFromResource("activiti.cfg.xml");
		// 获取流程引擎对象
		// 获取流程引擎对象后，activiti会在数据库新建28张表
		ProcessEngine processEngine = pc.buildProcessEngine();
	}

}
