package book.mapper;

import java.util.List;

import book.dto.BookDto;

public interface BookMapperInter {

	public int Totbook();
	public void insertbook(BookDto dto);
	public List<BookDto> getAllData();
}
