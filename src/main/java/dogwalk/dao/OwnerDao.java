package dogwalk.dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import dogwalk.model.Owner;

public class OwnerDao {
	// 싱글톤
	private static OwnerDao instance = new OwnerDao();
	
	private OwnerDao() {}
	
	public static OwnerDao getInstance() {
		return instance;
	}
		
	// 마이베이티스
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
	
	public Owner select(String own_id) {
		return (Owner) session.selectOne("ownerProfilens.select", own_id);
	}

	public List<Owner> list(int startRow, int endRow) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		return session.selectList("ownerProfilens.list", hm);
	}

	public int total() {
		return (int) session.selectOne("ownerProfilens.total");
	}
}
