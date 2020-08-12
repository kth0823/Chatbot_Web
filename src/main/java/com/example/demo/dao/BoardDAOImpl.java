package com.example.demo.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.example.demo.vo.BoardVO;
import com.example.demo.vo.ManualVO;
//import com.example.demo.vo.Criteria;
import com.example.demo.vo.SearchCriteria;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession sqlSession;

	// 게시글 작성
	@Override
	public void write(BoardVO vo) throws Exception {
		sqlSession.insert("boardMapper.insert", vo);

	}
	
	// 게시물 목록 조회
	@Override
	public List<BoardVO> list(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("boardMapper.listPage", scri);

	}

	// 게시물 총 개수
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.listCount", scri);

	}
	
	// 챗봇등록 목록 조회
	@Override
	public List<BoardVO> list2(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("boardMapper.listPage2", scri);

	}

	// 챗봇등록 총 개수
	@Override
	public int listCount2(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.listCount2", scri);
		
	}

	// 게시물 조회
	@Override
	public BoardVO read(int bno) throws Exception {

		return sqlSession.selectOne("boardMapper.read", bno);
	}

	// 게시물 수정
	@Override
	public void update(BoardVO vo) throws Exception {

		sqlSession.update("boardMapper.update", vo);
	}

	// 게시물 삭제
	@Override
	public void delete(int bno) throws Exception {

		sqlSession.delete("boardMapper.delete", bno);
	}
	
	// 첨부파일 업로드
		@Override
	public void insertFile(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("boardMapper.insertFile", map);
	}
		
	// 첨부파일 조회
	@Override
	public List<Map<String, Object>> selectFileList(int bno) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("boardMapper.selectFileList", bno);
	}
	
	// 첨부파일 다운로드
	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.selectFileInfo", map);
	}
	
	//첨부파일 업데이트 
	@Override
	public void updateFile(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
		sqlSession.update("boardMapper.updateFile", map);
	}
	
	// 고속사 목록 조회
	@Override
	public List<BoardVO> co_info(SearchCriteria scri) throws Exception {
	
		return sqlSession.selectList("boardMapper.co_info", scri);

	}
	
	// 장애대분류 목록 조회
	@Override
	public List<BoardVO> csr_req(SearchCriteria scri) throws Exception {
		
		return sqlSession.selectList("boardMapper.csr_req", scri);

	}
	
	// 요청지역 대분류 목록 조회
	@Override
	public List<BoardVO> fix_area(SearchCriteria scri) throws Exception {
		
		return sqlSession.selectList("boardMapper.fix_area", scri);

	}
	
	// 처리지역 대분류 목록 조회
	@Override
	public List<BoardVO> zone(SearchCriteria scri) throws Exception {
		
		return sqlSession.selectList("boardMapper.zone", scri);

	}
	
	// 처리단말기지역 대분류 목록 조회
	@Override
	public List<BoardVO> device(SearchCriteria scri) throws Exception {
		
		return sqlSession.selectList("boardMapper.device", scri);

	}
	
	// 사용자 목록 조회
	@Override
	public List<BoardVO> user(SearchCriteria scri) throws Exception {
			
		return sqlSession.selectList("boardMapper.user", scri);

	}
	
	// 접수 상태 조회
	@Override
	public List<BoardVO> status(SearchCriteria scri) throws Exception {
			
		return sqlSession.selectList("boardMapper.status", scri);

	}
	
	// 접수 구분 조회
	@Override
	public List<BoardVO> csr_type(SearchCriteria scri) throws Exception {
			
		return sqlSession.selectList("boardMapper.csr_type", scri);

	}
	
	// 접수 상태 조회
	@Override
	public List<BoardVO> fix_ctg(SearchCriteria scri) throws Exception {
			
		return sqlSession.selectList("boardMapper.fix_ctg", scri);

	}
	// 접수 상태 조회
	@Override
	public List<BoardVO> simple(SearchCriteria scri) throws Exception {
				
		return sqlSession.selectList("boardMapper.simple", scri);

	}
	
	// 챗봇으로 게시글 작성
	@Override
	public void writechat(BoardVO vo) throws Exception {
		sqlSession.insert("boardMapper.client04", vo);

	}
	
	// 메뉴얼 등록 작성
	@Override
	public void manualwrite(ManualVO vo) throws Exception {
		sqlSession.insert("boardMapper.insertManual", vo);

	}
	
	// 메뉴얼 파일 업로드
	@Override
	public void insertManualFile(Map<String, Object> map) throws Exception {
	// TODO Auto-generated method stub
	sqlSession.insert("boardMapper.insertmanualFile", map);
	}
	
	// 게시물 목록 조회
	@Override
	public List<ManualVO> manuallist(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("boardMapper.manuallistPage", scri);

	}

	// 게시물 총 개수
	@Override
	public int manuallistCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.manuallistCount", scri);

	}
	
	// 게시물 조회
	@Override
	public ManualVO manualread(int mno) throws Exception {

		return sqlSession.selectOne("boardMapper.manualread", mno);
	}
	
	// 첨부파일 조회
	@Override
	public List<Map<String, Object>> manualselectFileList(int mno) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("boardMapper.manualselectFileList", mno);
	}
		
	// 첨부파일 다운로드
	@Override
	public Map<String, Object> manselectFileInfo(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.manselectFileInfo", map);
	}
	
	// 메뉴얼 내역  삭제
	@Override
	public void mandelete(int mno) throws Exception {

		sqlSession.delete("boardMapper.mandelete", mno);
	}
	
}