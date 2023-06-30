package kr.co.two.mail.dao;

import java.lang.StackWalker.Option;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.two.mail.dto.MailDTO;

@Mapper
public interface MailDAO {

	ArrayList<MailDTO> mailgetOptions();


}
