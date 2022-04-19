package com.buddi.svc;

import java.io.File;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.buddi.dao.BuddiDAO;
import com.buddi.vo.BuddiAttachVO;
import com.buddi.vo.BuddiBoardVO;
import com.buddi.vo.BuddiMonVO;
import com.buddi.vo.BuddiUserVO;

@Component
@Service
public class BuddiService {
	@Autowired
	private BuddiDAO dao;

	public boolean login(BuddiUserVO vo) {
		return dao.login(vo);
	}

	public List<BuddiUserVO> getList() {
		return dao.getUserList();
	}

	public boolean add(BuddiUserVO vo) {
		return dao.addUser(vo);
	}

	public BuddiUserVO detailUser(String uid) {
		return dao.selectById(uid);
	}

	public boolean update(BuddiUserVO vo) {
		return dao.update(vo);
	}

	public boolean delete(String uid) {
		return dao.delete(uid);
	}

	public List<Map<String, Object>> detailMon(int dNum) {
		return dao.getMonByNum(dNum);
	}

	public BuddiMonVO getTodayMon() {
		return dao.getTodayMon();
	}

	public List<BuddiMonVO> getGachaResult(int count, String uid) {
		List<BuddiMonVO> list2 = new ArrayList<>();
		Random rd = new Random();
		for (int i = 0; i < count; i++) {
			BuddiMonVO vo = new BuddiMonVO();
			int avgNum = rd.nextInt(1000)+1;
			
			
			int dNum = 0;
			int[] sssr = {1,4,7,25,133,143,150,151};
			int[] ssr = {2, 3, 5, 6, 8, 9, 26, 132, 144, 145, 146, 146, 148, 149};
			int[] sr = {12,16,17,18,35,37,38,52,54,63,64,65,79,80,89,95,
						113,116,121,129,130,134,135,136,142};
			int[] r = {10,11,13,14,15,19,20,21,22,23,24,27,28,29,30,31,32,33,34,
					36,39,40,41,42,43,44,45,46,47,48,49,50,51,53,55,56,57,58,59,
					60,61,62,66,67,68,69,70,71,72,73,74,75,76,77,78,81,82,83,84,
					85,86,87,88,90,91,92,93,94,96,97,98,99,100,101,102,103,104,105,
					106,107,108,109,110,111,112,114,115,117,118,119,120,122,123,124,125,
					126,127,128,131,137,138,139,140,141};
			
				if (1 < avgNum && avgNum < 50) {
					dNum =sssr[rd.nextInt(8)];
					
				} else if(50 < avgNum && avgNum < 150) {
					dNum =ssr[rd.nextInt(14)];
				} else if (150 < avgNum && avgNum < 300) {
					dNum =sr[rd.nextInt(25)];
				} else {
					dNum =r[rd.nextInt(104)];
				}
				
				if(i == 10) {
					if(1 < avgNum && avgNum < 50) {
						dNum =sssr[rd.nextInt(8)];
					} else if (50 < avgNum && avgNum < 350) {
						dNum =ssr[rd.nextInt(14)];
					} else {
						dNum =sr[rd.nextInt(25)];
					}
					
				}
			
			List<Map<String, Object>> list = dao.getMonByNum(dNum);
			Map<String, Object> map = list.get(0);

			vo.setdNum((int) map.get("dNum"));
			vo.setpName((String) map.get("pName"));
			vo.setpGrade((String) map.get("pGrade"));
			vo.setRgb((String) map.get("rgb"));
			vo.setType_num((int) map.get("type_num"));
			vo.setType_name((String) map.get("type_name"));
			vo.setGachaNum(i+1);
			
			if (list.size() == 2) {
				map = list.get(1);
				vo.setSubType_num((int) map.get("type_num"));
				vo.setSubType_name((String) map.get("type_name"));
				vo.setSubRgb((String) map.get("rgb"));
			}
			
			list2.add(vo);

		}
		Map<String, Object> map = new HashMap<>();
		if (count == 11)
			count = 10;
		map.put("count", count);
		map.put("uid", uid);
		dao.minusBall(map);
		return list2;
	}

	public boolean addBoard(BuddiBoardVO board) {
		return dao.addBoard(board);
	}

	public boolean addBoard(HttpServletRequest request, BuddiBoardVO board, MultipartFile[] mfiles) {
		boolean saved = addBoard(board); // 글 저장
		int board_num = board.getNum(); // 글 저장시 자동증가 필드
		if (!saved) {
			System.out.println("글 저장 실패");
			return false;
		}

		ServletContext context = request.getServletContext();
		String savePath = context.getRealPath("/WEB-INF/upload");
		int fileCnt = mfiles.length;
		int saveCnt = 0;
		try {
			for (int i = 0; i < mfiles.length; i++) {
				String filename = mfiles[i].getOriginalFilename();
				mfiles[i].transferTo(new File(savePath + "/" + filename)); // 서버측 디스크
				Map<String, Object> map = new HashMap<>();
				map.put("board_num", board_num);
				map.put("filename", filename);
				map.put("filesize", mfiles[i].getSize());
				boolean fSaved = dao.addFileInfo(map); // attach 테이블에 파일정보 저장
				if (fSaved)
					saveCnt++;
			}
			return fileCnt == saveCnt ? true : false;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	public List<BuddiBoardVO> boardList() {
		List<Map<String, Object>> list = dao.boardList();
		List<BuddiBoardVO> list2 = new ArrayList<>();

		int prev_num = 0;
		for (int i = 0; i < list.size(); i++) {
			int bnum = (int) list.get(i).get("num");
			BuddiBoardVO b = new BuddiBoardVO(bnum);
			if (list2.contains(new BuddiBoardVO(bnum)))// 첨부파일이 다수개라서 중복되는 행이 있다면...

			{
				BuddiBoardVO _board = list2.get(list2.size() - 1);
				BuddiAttachVO att = new BuddiAttachVO();
				att.setNum((int) list.get(i).get("att_num"));
				att.setFilename((String) list.get(i).get("filename"));
				att.setFilesize((int) list.get(i).get("filesize"));
				_board.attach.add(att);
				continue;
			}

			// 첨부파일이 없거나 한개인 게시글이라면...
			Map<String, Object> m = list.get(i);
			BuddiBoardVO board = new BuddiBoardVO();
			board.setNum(bnum);
			board.setTitle((String) m.get("title"));
			board.setAuthor((String) m.get("author"));
			String strDate = m.get("bdate").toString();
			String strD = strDate.replace("T", " ");
			java.sql.Timestamp ts = Timestamp.valueOf(strD);
			board.setBdate(ts);

			// board.setBdate(java.sql.Date.valueOf((String) m.get("author")));

			if (m.get("filename") != null) // 첨부파일을 가진 글이라면...
			{
				BuddiAttachVO att = new BuddiAttachVO();
				att.setNum((int) list.get(i).get("att_num"));
				att.setFilename((String) list.get(i).get("filename"));
				att.setFilesize((int) list.get(i).get("filesize"));
				board.attach.add(att);
			}
			list2.add(board);

		} // end of for()
		return list2;

	}

	public String getFilename(int num) {
		return dao.getFilename(num);
	}

	public BuddiBoardVO detail(int num) {
		List<Map<String, Object>> list = dao.detail(num);
		BuddiBoardVO board = new BuddiBoardVO();
		int size = list.size();
		for (int i = 0; i < size; i++) {
			Map<String, Object> map = list.get(i);
			if (i == 0) {
				board.setNum((int) map.get("num"));
				board.setTitle((String) map.get("title"));
				board.setAuthor((String) map.get("author"));
				board.setContents((String) map.get("contents"));
				String strDate = map.get("bdate").toString();
				String strD = strDate.replace("T", " ");
				java.sql.Timestamp ts = Timestamp.valueOf(strD);
				board.setBdate(ts);
			}
			Object obj = map.get("filename");
			if (obj != null) { // 파일 정보 추출
				BuddiAttachVO att = new BuddiAttachVO();
				att.setNum((int) map.get("att_num"));
				att.setFilename((String) map.get("filename"));
				att.setFilesize((int) map.get("filesize"));
				board.attach.add(att);

			}

		}
		return board;

	}

	public boolean deleteFileInfo(int num, ResourceLoader resourceLoader) {
		String filename = getFilename(num);
		Resource resource = (Resource) resourceLoader.getResource("WEB-INF/upload/" + filename);
		boolean deleted = false;
		try {
			String abPath = resource.getFile().getAbsolutePath();
			File fileDel = new File(abPath);
			deleted = fileDel.exists() ? fileDel.delete() : false;
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (deleted) {
			return dao.deleteFileInfo(num);
		}
		return false;
	}

	public boolean idcheck(String num) {

		return false;
	}

}
