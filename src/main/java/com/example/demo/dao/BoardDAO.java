package com.example.demo.dao;
import java.util.List;
import java.util.Map;

import com.example.demo.vo.BoardVO;
import com.example.demo.vo.ManualVO;
import com.example.demo.vo.FWVO;
//import com.example.demo.vo.Criteria;
import com.example.demo.vo.SearchCriteria;

public interface  BoardDAO {

	// 게시글 작성
	public void write(BoardVO vo) throws Exception;
	

	// 게시물 목록 조회
	public List<BoardVO> list(SearchCriteria scri) throws Exception;
	
	// 게시물 중복장애 표시 
	public List<BoardVO> comp(SearchCriteria scri) throws Exception;
	
	// 게시물 장애현황  표시 
	public List<Map<String, Object>> anal1(SearchCriteria scri) throws Exception;
	
	// 고속사별 발생 건수현황  표시 
	public List<Map<String, Object>> anal2(SearchCriteria scri) throws Exception;
	
	// 한달 발생한 건수  
	public List<Map<String, Object>> tot(SearchCriteria scri) throws Exception;
	
	// 게시물 총 개수 
	public int listCount(SearchCriteria scri) throws Exception;
	
	// 챗봇등록 목록 조회
	public List<BoardVO> list2(SearchCriteria scri) throws Exception;
		
	// 챗봇등록 총 개수 
	public int listCount2(SearchCriteria scri) throws Exception;


	// 게시물 조회
	public BoardVO read(int bno) throws Exception;
	
	// 게시물 수정
	public void update(BoardVO vo) throws Exception;
	
	// 게시물 삭제
	public void delete(int bno) throws Exception;
	
	// 첨부파일 업로드
	public void insertFile(Map<String, Object> map) throws Exception;
	
	// 첨부파일 조회
	public List<Map<String, Object>> selectFileList(int bno) throws Exception;
	
	// 첨부파일 다운
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
	
	// 첨부파일 수정
	public void updateFile(Map<String, Object> map) throws Exception;
	
	// 고속사 목록 조회
	public List<BoardVO> co_info(SearchCriteria scri) throws Exception;
	
	// 장애대분류 목록 조회
	public List<BoardVO> csr_req(SearchCriteria scri) throws Exception;
	
	// 요청지역 목록 조회
	public List<BoardVO> fix_area(SearchCriteria scri) throws Exception;
	
	// 처리지역 목록 조회
	public List<BoardVO> zone(SearchCriteria scri) throws Exception;
	
	// 처리단말기 품목 목록 조회
	public List<BoardVO> device(SearchCriteria scri) throws Exception;
	
	// 사용자 목록 조회
	public List<BoardVO> user(SearchCriteria scri) throws Exception;
	
	// 접수상태 조회
	public List<BoardVO> status(SearchCriteria scri) throws Exception;

	// 접수구분  조회
	public List<BoardVO> csr_type(SearchCriteria scri) throws Exception;
	
	// 처리대분류 조회
	public List<BoardVO> fix_ctg(SearchCriteria scri) throws Exception;
	
	// 단순민원 여부
	public List<BoardVO> simple(SearchCriteria scri) throws Exception;
	
	// 챗봇으로 게시글 작성
	public void writechat(BoardVO vo) throws Exception;
	
	// 메뉴얼 등록 작성
	public void manualwrite(ManualVO vo) throws Exception;
	
	// 메뉴얼 파일 업로드
	public void insertManualFile(Map<String, Object> map) throws Exception;
	
	// 메뉴얼 목록 조회
	public List<ManualVO> manuallist(SearchCriteria scri) throws Exception;
	
	// 메뉴얼 총 개수 
	public int manuallistCount(SearchCriteria scri) throws Exception;
	
	// 메뉴얼 게시물 조회
	public ManualVO manualread(int mno) throws Exception;
	
	// 메뉴얼 첨부파일 조회
	public List<Map<String, Object>> manualselectFileList(int mno) throws Exception;
		
	// 메뉴얼 첨부파일 다운
	public Map<String, Object> manselectFileInfo(Map<String, Object> map) throws Exception;
	
	// 메뉴얼 내역 삭제
	public void mandelete(int mno) throws Exception;
	
	// 메뉴얼 등록 수정
	public void manupdate(ManualVO vo) throws Exception;
	
	// 메뉴얼 첨부파일 수정
	public void manupdateFile(Map<String, Object> map) throws Exception;
	
	
	// F/W 등록 작성
	public void FWwrite(FWVO vo) throws Exception;
		
	// F/W 파일 업로드
	public void insertFWFile(Map<String, Object> map) throws Exception;
		
	// F/W 목록 조회
	public List<FWVO> FWlist(SearchCriteria scri) throws Exception;
		
	// F/W 총 개수 
	public int FWlistCount(SearchCriteria scri) throws Exception;
		
	// F/W 게시물 조회
	public FWVO FWread(int fno) throws Exception;
		
	// F/W 첨부파일 조회
	public List<Map<String, Object>> FWselectFileList(int fno) throws Exception;
			
	// F/W 첨부파일 다운
	public Map<String, Object> FWselectFileInfo(Map<String, Object> map) throws Exception;
		
	// F/W 내역 삭제
	public void FWdelete(int fno) throws Exception;
		
	// F/W 등록 수정
	public void FWupdate(FWVO vo) throws Exception;
		
	// F/W 첨부파일 수정
	public void FWupdateFile(Map<String, Object> map) throws Exception;
	
}
