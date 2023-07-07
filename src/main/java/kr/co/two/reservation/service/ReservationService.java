package kr.co.two.reservation.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.multipart.MultipartFile;

import kr.co.two.reservation.dao.ReservationDAO;
import kr.co.two.reservation.dto.MeetingRoomDTO;
import kr.co.two.reservation.dto.ReservationDTO;

@Service
public class ReservationService {

	Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	ReservationDAO dao;

	public void reservationMR(HashMap<String, String> reservationData) {
		dao.reservationMR(reservationData);

	}

	public ArrayList<MeetingRoomDTO> mrList() {

		return dao.mrList();
	}

	public ArrayList<ReservationDTO> reservationList(HashMap<String, String> param) {
		// TODO Auto-generated method stub
		return dao.reservationList(param);
	}

	@Value("${spring.servlet.multipart.location}")
	private String root;

	public int creatingMR(MultipartFile mrPhoto, HashMap<String, String> params) {

		String fileName = mrPhoto.getOriginalFilename();
		logger.info("ori_fileName: " + fileName);

		String ext = fileName.substring(fileName.lastIndexOf("."));
		String newFileName = System.currentTimeMillis() + ext; // 시간으로 하는건 옛날 방법 요새는 해쉬 코드 사용
		logger.info(fileName + "=>" + newFileName);

		// MIME 유형 설정
		String contentType = mrPhoto.getContentType();
		if (contentType == null) {
			// MIME 유형이 지정되지 않은 경우 기본값으로 설정
			contentType = MimeTypeUtils.APPLICATION_OCTET_STREAM_VALUE;
		}

		try {
			byte[] bytes = mrPhoto.getBytes();
			Path path = Paths.get(root + "/" + newFileName);
			Files.write(path, bytes);
		} catch (IOException e) {
			e.printStackTrace();
		}

		params.put("ori_file_name", fileName);
		params.put("new_file_name", newFileName);

		return dao.creatingMR(params);
	}

	

	public HashMap<String, Object> mrList2(int page,int cnt, String opt, String keyword) {
		HashMap<String, Object>map = new HashMap<String,Object>();
		int offset = (page - 1) * cnt;

		int total = dao.totalCount(opt, keyword); // 12
		// cnt = 10
		int range = total % cnt == 0 ? total / cnt : (total / cnt) + 1;

		logger.info("total :" + total);
		logger.info("range :" + range);
		logger.info("before page :" + page);

		page = page > range ? range : page;

		logger.info("after page :" + page);

		map.put("currPage", page);
		map.put("pages", range);
		ArrayList<MeetingRoomDTO> mrList = dao.mrList2(opt, keyword, cnt, offset);
		map.put("list", mrList);
		return map;
	}

	
	
	public HashMap<String, Object> mrDelete(ArrayList<String> mrDelList) {
		HashMap<String, Object> map = new HashMap<String, Object>();		
		int delSize = mrDelList.size();
		int successCnt = 0;
		for (String mrDel : mrDelList) {
			successCnt += dao.mrDelete(mrDel);
		}		
		map.put("msg", delSize+" 개의 삭제 요청중 "+successCnt+" 개의 회의실이 삭제되었습니다."); 
		map.put("success", true);
		return map;
	}

	public HashMap<String, Object> rvList(int page, int cnt, String opt, String keyword) {
		HashMap<String, Object>map = new HashMap<String,Object>();
		int offset = (page - 1) * cnt;

		int total = dao.rvTotalCount(opt, keyword); // 12
		// cnt = 10
		int range = total % cnt == 0 ? total / cnt : (total / cnt) + 1;

		logger.info("total :" + total);
		logger.info("range :" + range);
		logger.info("before page :" + page);

		page = page > range ? range : page;

		logger.info("after page :" + page);

		map.put("currPage", page);
		map.put("pages", range);
		ArrayList<ReservationDTO> rvList = dao.rvList(opt, keyword, cnt, offset);
		for (ReservationDTO reservationDTO : rvList) {
			logger.info("endTime:"+reservationDTO.getEndTime());
			
		}
	
		map.put("list", rvList);
		return map;
	}

	public HashMap<String, Object> rvDelete(ArrayList<String> rvDelList) {
		HashMap<String, Object> map = new HashMap<String, Object>();		
		int delSize = rvDelList.size();
		int successCnt = 0;
		for (String rvDel : rvDelList) {
			successCnt += dao.rvDelete(rvDel);
		}		
		map.put("msg", delSize+" 개의 예약 취소요청중 "+successCnt+" 개의 예약이 취소되었습니다."); 
		map.put("success", true);
		return map;
	}

}
