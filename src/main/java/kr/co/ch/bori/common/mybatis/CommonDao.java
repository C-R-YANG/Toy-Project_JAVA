package kr.co.ch.bori.common.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CommonDao {
    private final SqlSession sqlSession;

    public CommonDao(SqlSession sqlSession){
        this.sqlSession = sqlSession;
    }

    public int getCount(String query, Object search) throws DataAccessException {
        return sqlSession.selectOne(query, search);
    }

    public <E> List<E> getList(String query, Object search) throws DataAccessException {
        return sqlSession.selectList(query, search);
    }

    public Object insertData(String query, Object model) throws DataAccessException {
        sqlSession.insert(query, model);
        return model;
    }

    public int getSeq(String query) throws DataAccessException {
        return sqlSession.selectOne(query);
    }

    public <E> E getData(String query, Object search) throws DataAccessException {
        return sqlSession.selectOne(query, search);
    }

    public int mergeData(String query, Object model) throws DataAccessException {
        return sqlSession.update(query, model);
    }

    public int updateData(String query, Object model) throws DataAccessException {
        return sqlSession.update(query, model);
    }

    public int deleteData(String query, Object search) throws DataAccessException {
        return sqlSession.delete(query, search);
    }
}
