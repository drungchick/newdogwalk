package dogwalk.dao;

import java.io.Reader;

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
	// 견주 회원가입 시 ID 중복체크 - LJH
	public Owner selectAll(String own_id) {
		return (Owner)session.selectOne("ownerns.selectAll", own_id);
	}
	// 견주 회원가입 시 견주 테이블에 삽입 - LJH
	public int insert(Owner owner) {
		return session.insert("ownerns.insertOwner", owner);
	}
	// 견주 마이페이지 회원정보 조회 - LJH
	public Owner selectOwner(String own_id) {
		// TODO Auto-generated method stub
		return (Owner)session.selectOne("ownerns.selectOwnerId", own_id);
	}
	// 견주 마이페이지 회원정보 수정 - LJH
	public int updateOwner(Owner owner) {
		return session.update("ownerns.updateOwner", owner);
	}
}
