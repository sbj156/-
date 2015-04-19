package com.lmd.spring.task;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

/**
 * 任务链
 * @author mh_cxp
 *
 */
public class TaskChain implements Task {
	@Autowired
	private List<Task> tasks;
	@Override
	public void execute() {
		if(tasks != null)
			for(Task task : tasks)
				task.execute();
	}

}
