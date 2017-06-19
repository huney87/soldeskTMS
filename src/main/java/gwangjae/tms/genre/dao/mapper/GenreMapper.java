package gwangjae.tms.genre.dao.mapper;

import gwangjae.tms.genre.domain.Genre;

import java.util.List;

public interface GenreMapper {
	//장르 전체 리스트
	List<Genre> selectGenreList();
	//장르 대분류 리스트
	List<Genre> selectGenreMajorList();
	//장르 아이디로 장르 정보 조회
	Genre selectGenre(Genre Genre);
	//장르 수정
	void updateGenre(Genre Genre);
	//장르 추가
	void insertGenre(Genre Genre);
	//장르 삭제
	void deleteGenre(Genre Genre);
}