package gwangjae.tms.genre.dao.mapper;

import gwangjae.tms.genre.domain.Genre;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;

public interface GenrerMapper {
	//카테고리 전체 리스트
	List<Genre> selectGenreList();
	//카테고리 대분류 리스트
	List<Genre> selectGenreCode1List();
	//카테고리 소분류 리스트
	List<Genre> selectGenreCode2List();
	//카테고리 아이디로 카테고리 정보 조회
	Genre selectGenre(int GenreID);
	//대분류 번호로 카테고리 정보 조회
	Genre selectCode1(int code1);
	//대분류에 속한 하위분류 조회
	List<Genre> selectRegionGenreList(int code1);
	//카테고리 수정
	int updateGenre(Genre Genre);
	//카테고리 추가
	@Insert("INSERT INTO Genre (Genre_id, code1, code2, Genre_name)"
			+ "VALUES (Gen_id_seq.nextval, #{code1}, #{code2}, #{GenreName,jdbcType=VARCHAR})")
	int insertGenre(Genre Genre);
	//카테고리 삭제
	@Delete("DELETE FROM Genre WHERE Genre_id = #{Genreid}")
	int deleteGenre(int Genreid);
}