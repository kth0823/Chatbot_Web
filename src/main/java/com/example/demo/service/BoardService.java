package com.example.demo.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.demo.vo.BoardVO;
//import com.example.demo.vo.Criteria;
import com.example.demo.vo.SearchCriteria;

public interface BoardService {

	// 게시글 작성
	public void write(BoardVO vo, MultipartHttpServletRequest mpRequest) throws Exception;

	// 게시물 목록 조회
//	public List<BoardVO> list() throws Exception;
	public List<BoardVO> list(SearchCriteria scri) throws Exception;

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
	
	// 게시글 작성
	public void writechat(BoardVO vo) throws Exception;
}