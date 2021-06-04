package dogwalk.dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import dogwalk.model.MBoard;

public class MBoardDao {

	// singleton
	private static MBoardDao instance = new MBoardDao();
	private MBoardDao() {}
	public static MBoardDao getInstance() {
		return instance;
	}
	private static SqlSession session;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			// true 값이어야 입력/수정/삭제 한 후에 commit 실행.
			session = ssf.openSession(true);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<MBoard> list(int startRow, int endRow) {
		// 파라미터로는 단수개의 정보만 전달 가능
		// List는 특정틀의 동일한 유형을 가진 정보를 전달 가능 But Array로 집합, 정렬, 배열해야 함
		// Hash은 다수의 정보 전달 가능. key값으로 해당 정보 더미들 구분
		//    key값은 문자열로 받고,  정보값은 문자와 숫자 모두로 받을 수 있게 Object로 지정
		HashMap<String, Object> hm = new HashMap<>();
			hm.put("startRow", startRow);
			hm.put("endRow", endRow);
		return session.selectList("mboardns.list", hm);
	}
	
	// 게시글 총 개수
	public int total() {
		return (int) session.selectOne("mboardns.total");
	}
	
	public MBoard select(int mbd_no) {
		return (MBoard) session.selectOne("mboardns.select", mbd_no);
	}
	
	public int insert(MBoard mboard) {
		// TODO Auto-generated method stub
		return session.insert("mboardns.insert", mboard);
	}
	public int update(MBoard mboard) {
		// TODO Auto-generated method stub
		return session.update("mboardns.update", mboard);
	}
	public int delete(int mbd_no) {
		// TODO Auto-generated method stub
		return session.delete("mboardns.delete", mbd_no);
	}

}
