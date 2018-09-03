package kr.or.nextit.session.service.impl;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.or.nextit.session.service.SessionService;

@Service("SessionService")
public class SessionServiceImpl implements SessionService {

	private final Logger log = LoggerFactory.getLogger(this.getClass());

	@Resource(name = "SessionService")
	private SessionService sessionService;


}
