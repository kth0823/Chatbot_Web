package com.example.demo.service;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.demo.dao.BoardDAO;
import com.example.demo.util.FileUtils;
import com.example.demo.vo.BoardVO;
//import com.example.demo.vo.Criteria;
import com.example.demo.vo.SearchCriteria;

@Service
public class BoardServiceImpl implements  BoardService {
    
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Inject
	private BoardDAO dao;

	// 게시글 작성
	@Override
	public void write(BoardVO vo, MultipartHttpServletRequest mpRequest) throws Exception {
		dao.write(vo);
		
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(vo, mpRequest); 
		int size = list.size();
		for(int i=0; i<size; i++){ 
			dao.insertFile(list.get(i)); 
		}
	}

	// 게시물 목록 조회
	@Override
	public List<BoardVO> list(SearchCriteria scri) throws Exception {

		return dao.list(scri);
	}
	//게시물 총 개수 
	@Override
	public int listCount(SearchCriteria scri) throws Exception{
		// TODO Auto-generated method stub
		return dao.listCount(scri);
	}
	
	// 챗봇등록 목록 조회
	@Override
	public List<BoardVO> list2(SearchCriteria scri) throws Exception {

		return dao.list2(scri);
	}
	//챗봇등록 총 개수 
	@Override
	public int listCount2(SearchCriteria scri) throws Exception{
		// TODO Auto-generated method stub
		return dao.listCount2(scri);
	}
	
	// 게시물  조회
	@Override
	public BoardVO read(int bno) throws Exception {

		return dao.read(bno);
	}
	
	@Override
	public void update(BoardVO vo, MultipartHttpServletRequest mpRequest) throws Exception {

		dao.update(vo);
		
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(vo, mpRequest); 
		int size = list.size();
		for(int i=0; i<size; i++){ 
			dao.insertFile(list.get(i)); 
		}
	}

	@Override
	public void delete(int bno) throws Exception {

		dao.delete(bno);
	}
	
	// 첨부파일 조회
	@Override
	public List<Map<String, Object>> selectFileList(int bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectFileList(bno);
	}
	
	// 첨부파일 다운로드
	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectFileInfo(map);
	}
	
	@Override
	public void update(BoardVO boardVO, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception {
		
	dao.update(boardVO);
		
	List<Map<String, Object>> list = fileUtils.parseUpdateFileInfo(boardVO, files, fileNames, mpRequest);
	Map<String, Object> tempMap = null;
	int size = list.size();
	for(int i = 0; i<size; i++) {
		tempMap = list.get(i);
		if(tempMap.get("IS_NEW").equals("Y")) {
				dao.insertFile(tempMap);
			}else {
				dao.updateFile(tempMap);
			}
		}
	}
	
	// 운수사목록 조회
	@Override
	public List<BoardVO> co_info(SearchCriteria scri) throws Exception {

		return dao.co_info(scri);
	}
	
	// 징에데븐루 목록 조회
	@Override
	public List<BoardVO> csr_req(SearchCriteria scri) throws Exception {

		return dao.csr_req(scri);
	}
	
	// 요청지역 데븐루 목록 조회
	@Override
	public List<BoardVO> fix_area(SearchCriteria scri) throws Exception {

		return dao.fix_area(scri);
	}
	
	// 처리지역 데븐루 목록 조회
	@Override
	public List<BoardVO> zone(SearchCriteria scri) throws Exception {

		return dao.zone(scri);
	}
	
	// 처리단말기 품목 데븐루 목록 조회
	@Override
	public List<BoardVO> device(SearchCriteria scri) throws Exception {

		return dao.device(scri);
	}
	
	// 사용자 목록 조회
	@Override
	public List<BoardVO> user(SearchCriteria scri) throws Exception {

			return dao.user(scri);
	}
	
	// 접수상태 조회
	@Override
	public List<BoardVO> status(SearchCriteria scri) throws Exception {

			return dao.status(scri);
	}
	
	// 접수구분 조회
	@Override
	public List<BoardVO> csr_type(SearchCriteria scri) throws Exception {

			return dao.csr_type(scri);
	}
	
	// 접수상태 조회
	@Override
	public List<BoardVO> fix_ctg(SearchCriteria scri) throws Exception {

			return dao.fix_ctg(scri);
	}
	
	// 접수상태 조회
	@Override
	public List<BoardVO> simple(SearchCriteria scri) throws Exception {

			return dao.simple(scri);
	}
	
	// 챗봇으로 게시글 작성
	@Override
	public void writechat(BoardVO vo) throws Exception {
		dao.writechat(vo);	
		
	}

}
