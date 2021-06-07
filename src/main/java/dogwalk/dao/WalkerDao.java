package dogwalk.dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import dogwalk.model.Dog;
import dogwalk.model.Walker;

public class WalkerDao {
	// 싱글톤
	private static WalkerDao instance = new WalkerDao();
	
	private WalkerDao() {}
	
	public static WalkerDao getInstance() {
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
	
	public List<Walker> list(int startRow, int endRow) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		return session.selectList("walkerns.list", hm);
	}

	public int total() {
		return (int) session.selectOne("walkerns.total");
	}

	public Walker select(String wkr_reg_no) {
		return (Walker) session.selectOne("walkerns.selectWalkerNo", wkr_reg_no);
	}

	public List<Walker> searchlist(int startRow, int endRow, String type, String search) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		hm.put("type", type);
		hm.put("search", search);
		return session.selectList("walkerns.searchlist", hm);
	}
}
