package gwangjae.tms.genre.service;

import gwangjae.tms.genre.dao.mapper.GenrerMapper;
import gwangjae.tms.genre.domain.Genre;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("genreService")
public class GenreService{
	@Autowired 
	@Qualifier("genreMapper")
	GenrerMapper genreMapper;
	
	//전체 장르 리스트
	public List<Genre> getGenreList(){
		return genreMapper.selectGenreList();
	}
	//전체 분류1 장르 리스트
	public List<Genre> getGenreCode1List(){
		return genreMapper.selectGenreCode1List();
	}
	//전체 분류2 장르 리스트
	public List<Genre> getGenreCode2List(){
		return genreMapper.selectGenreCode2List();
	}
	//장르 아이디로 장르 정보 찾기(소분류)
	public Genre getGenre(int GenreID){
		return genreMapper.selectGenre(GenreID);
	}
	//코드1 번호의 장르 정보 찾기(대분류)
	public Genre getCode1(int code1){
		return genreMapper.selectCode1(code1);
	}
	//코드1번호에 속하는 하위분류 찾기
	public List<Genre> getGenreCode1(int code1){
		return genreMapper.selectRegionGenre(code1);
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
	public void removeGenre(int GenreID){
		genreMapper.deleteGenre(GenreID);
	}
}
