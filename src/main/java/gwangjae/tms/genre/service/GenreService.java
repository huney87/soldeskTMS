package gwangjae.tms.genre.service;

import gwangjae.tms.genre.dao.mapper.GenreMapper;
import gwangjae.tms.genre.domain.Genre;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("genreService")
public class GenreService{
	@Autowired 
	@Qualifier("genreMapper")
	GenreMapper genreMapper;
	
	//전체 장르 리스트
	public List<Genre> getGenreList(){
		return genreMapper.selectGenreList();
	}
	//대분류 장르 리스트
	public List<Genre> getGenreMajorList(){
		return genreMapper.selectGenreMajorList();
	}
	//장르 아이디로 장르 정보 찾기
	public Genre getGenre(Genre param){
		return genreMapper.selectGenre(param);
	}
	//장르 추가
	public void addGenre(Genre param){
		genreMapper.insertGenre(param);
	}
	//장르 수정
	public void modifyGenre(Genre param){
		genreMapper.updateGenre(param);
	}
	//장르 삭제
	public void removeGenre(Genre param){
		genreMapper.deleteGenre(param);
	}
}
