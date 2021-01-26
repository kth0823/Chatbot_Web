package com.example.demo.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.demo.vo.BoardVO;
import com.example.demo.vo.ManualVO;
import com.example.demo.vo.FWVO;
import com.example.demo.vo.BusVO;
//import com.example.demo.vo.Criteria;
import com.example.demo.vo.SearchCriteria;

public interface BoardService {

	// 게시글 작성
	public void write(BoardVO vo, MultipartHttpServletRequest mpRequest) throws Exception;

	// 게시물 목록 조회
//	public List<BoardVO> list() throws Exception;
	public List<BoardVO> list(SearchCriteria scri) throws Exception;
	
	// 게시물 전체내역  반환
//	public List<BoardVO> list() throws Exception;
	public List<BoardVO> listtotal(SearchCriteria scri) throws Exception;

	// 게시물 중복장애 조회
	//	public List<BoardVO> list() throws Exception;
	public List<BoardVO> comp(SearchCriteria scri) throws Exception;
	
	// 게시물 장애현황 조회
	//	public List<BoardVO> list() throws Exception;
	public List<Map<String, Object>> anal1(SearchCriteria scri) throws Exception;
	
	// 고속사 발생건수 조회
	//	public List<BoardVO> list() throws Exception;
	public List<Map<String, Object>> anal2(SearchCriteria scri) throws Exception;
	
	// 한달 발생건수 조회
	//	public List<BoardVO> list() throws Exception;
	public List<Map<String, Object>> tot(SearchCriteria scri) throws Exception;
	
	// OCR 고속사 번호 조회
	//	public List<BoardVO> list() throws Exception;
	public List<Map<String, Object>> OCR(SearchCriteria scri) throws Exception;
	
	// 월별 발생건수 조회
	//	public List<BoardVO> list() throws Exception;
	public List<Map<String, Object>> month(SearchCriteria scri) throws Exception;
		
	// 게시물 총 갯수
	public int listCount(SearchCriteria scri) throws Exception;
	
	// 챗봇등록 목록 조회
	public List<BoardVO> list2(SearchCriteria scri) throws Exception;

	// 챗봇목록 총 갯수
	public int listCount2(SearchCriteria scri) throws Exception;

	// 게시물 목록 조회
	public BoardVO read(int bno) throws Exception;

	// 게시물 수정
	public void update(BoardVO vo, MultipartHttpServletRequest mpRequest) throws Exception;

	// 게시물 삭제
	public void delete(int bno) throws Exception;
	
	// 첨부파일 조회
	public List<Map<String, Object>> selectFileList(int bno) throws Exception;
	
	// 첨부파일 다운
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
	
	// 게시물 수정
	public void update(BoardVO boardVO, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception;
	
	// 고속사 목록 조회
	public List<BoardVO> co_info(SearchCriteria scri) throws Exception;
	
	// 장애대분류 목록 조회
	public List<BoardVO> csr_req(SearchCriteria scri) throws Exception;
	
	// 요청지역 대분류 목록 조회
	public List<BoardVO> fix_area(SearchCriteria scri) throws Exception;
	
	// 처리지역 대분류 목록 조회
	public List<BoardVO> zone(SearchCriteria scri) throws Exception;
	
	// 처리단말기 품목 대분류 목록 조회
	public List<BoardVO> device(SearchCriteria scri) throws Exception;
	
	// 사용자 목록 조회
	public List<BoardVO> user(SearchCriteria scri) throws Exception;
	
	// 사용자 목록 조회
	public List<BoardVO> status(SearchCriteria scri) throws Exception;
	
	// 사용자 목록 조회
	public List<BoardVO> csr_type(SearchCriteria scri) throws Exception;
	
	// 사용자 목록 조회
	public List<BoardVO> fix_ctg(SearchCriteria scri) throws Exception;
	
	// 단순장애 여부
	public List<BoardVO> simple(SearchCriteria scri) throws Exception;
	
	// 차량번호 지역 조회
	public List<BusVO> car_region(SearchCriteria scri) throws Exception;
	
	// 차량번호 차량타입 조회
	public List<BusVO> bus_type(SearchCriteria scri) throws Exception;
	
	// 게시글 작성
	public void writechat(BoardVO vo) throws Exception;
	
	// 게시글 작성
	public void manualwrite(ManualVO vo, MultipartHttpServletRequest mpRequest) throws Exception;
	
	// 메뉴얼 목록 조회
	public List<ManualVO> manuallist(SearchCriteria scri) throws Exception;

	// 메뉴얼 총 갯수
	public int manuallistCount(SearchCriteria scri) throws Exception;
	
	// 메뉴얼 목록 조회
	public ManualVO manualread(int mno) throws Exception;
	
	// 메뉴얼 파일 조회
	public List<Map<String, Object>> manualselectFileList(int mno) throws Exception;
		
	// 메뉴얼 파일 다운
	public Map<String, Object> manselectFileInfo(Map<String, Object> map) throws Exception;
	
	// 메뉴얼 내역 삭제
	public void mandelete(int mno) throws Exception;
	
	// 메뉴얼 내역 수정
	public void manupdate(ManualVO vo, MultipartHttpServletRequest mpRequest) throws Exception;
	
	// 메뉴얼 파일 수정
	public void manupdate(ManualVO vo, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception;
	
	// F/W 작성
	public void FWwrite(FWVO vo, MultipartHttpServletRequest mpRequest) throws Exception;
		
	// F/W 목록 조회
	public List<FWVO> FWlist(SearchCriteria scri) throws Exception;

	// F/W 총 갯수
	public int FWlistCount(SearchCriteria scri) throws Exception;
		
	// F/W 목록 조회
	public FWVO FWread(int fno) throws Exception;
		
	// F/W 파일 조회
	public List<Map<String, Object>> FWselectFileList(int fno) throws Exception;
			
	// F/W 파일 다운
	public Map<String, Object> FWselectFileInfo(Map<String, Object> map) throws Exception;
		
	// F/W 내역 삭제
	public void FWdelete(int fno) throws Exception;
		
	// F/W 내역 수정
	public void FWupdate(FWVO vo, MultipartHttpServletRequest mpRequest) throws Exception;
		
	// F/W 파일 수정
	public void FWupdate(FWVO vo, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception;
	
	// 차량등록 작성
	public void Carwrite(BusVO vo) throws Exception;
	
	// 차량 목록 조회
	public List<BusVO> Carlist(SearchCriteria scri) throws Exception;

	// 차량 리스트 총 갯수
	public int CarlistCount(SearchCriteria scri) throws Exception;
	
	
}