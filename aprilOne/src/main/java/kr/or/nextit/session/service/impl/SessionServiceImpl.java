package kr.or.nextit.session.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.nextit.session.service.SessionService;

@Service("SessionService")
public class SessionServiceImpl implements SessionService {

	private final Logger log = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private SessionMapper sessionMapper;

}
