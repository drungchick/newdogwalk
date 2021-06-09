package dogwalk.dao;

import java.io.Reader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import dogwalk.model.Notice;
import dogwalk.dao.NoticeDao;

public class NoticeDao {
	/*singleton 정의*/
	private static NoticeDao instance = new NoticeDao();
	
	private NoticeDao() {}
	
	public static NoticeDao getInstance() {
		return instance;
	}
	
	// 오라클과 연동
	// session 객체는 오라클 DB와 연결된 상태
	private static SqlSession session;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			
			session = ssf.openSession(true);	// true: auto commit, 반드시 기술해야함
			reader.close();
		} catch (Exception e) {
			System.out.println("session 생성에러: "+e.getMessage());
		}
	}
	
	// 공지사항 목록
	public List<Notice> list(int startRow, int endRow) {	
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		return session.selectList("noticens.list", hm); // notice.xml파일의 이름이 noticens 함수와 같은 것이 list
	}

	public int total() {
		return (int) session.selectOne("noticens.total"); // notice.xml파일의 이름이 noticens 함수와 같은 것이 total
	}

	public Notice select(String nt_no) {
		return (Notice) session.selectOne("noticens.select", nt_no); // notice.xml파일의 이름이 noticens 함수와 같은 것이 select
	}
	
	public int readCountUpdate(String nt_no) {
		return (int) session.update("noticens.rcupdate", nt_no);
	}

	public int update(Notice notice) {
		return session.update("noticens.update", notice);
	}

	public int delete(String nt_no) {
		return session.update("noticens.delete", nt_no);
	}

	public int insert(Notice notice) {
		return session.insert("noticens.insert", notice);
	}
}