package dogwalk.dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import dogwalk.model.WBooking;

public class WBookingDao {

	// singleton
	private static WBookingDao instance = new WBookingDao();
	private WBookingDao() {}
	public static WBookingDao getInstance() {
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
	
	// 워커 전용 게시판 리스트
	@SuppressWarnings("unchecked")
	public List<WBooking> list(int startRow, int endRow) {
		// 파라미터로는 단수개의 정보만 전달 가능
		// List는 특정틀의 동일한 유형을 가진 정보를 전달 가능 But Array로 집합, 정렬, 배열해야 함
		// Hash은 다수의 정보 전달 가능. key값으로 해당 정보 더미들 구분
		//    key값은 문자열로 받고,  정보값은 문자와 숫자 모두로 받을 수 있게 Object로 지정
		HashMap<String, Object> hm = new HashMap<>();
			hm.put("startRow", startRow);
			hm.put("endRow", endRow);
		return session.selectList("wbookingns.list", hm);
	}
	
	// 게시글 총 개수
	public int total() {
		return (int) session.selectOne("bookingns.total");
	}
	
}
