package com.mycompany.javajavajo.service;

import org.springframework.stereotype.Service;

import com.mycompany.javajavajo.dto.SearchIndex;

@Service
public class PagerService {
	
	public SearchIndex setSearchIndex(SearchIndex searchIndex, SearchIndex sessionSearchIndex) {
		
		if(searchIndex.getPageno() == null) {
			if(sessionSearchIndex == null) {
				searchIndex.setPageno("1");
			} else {
				searchIndex.setPageno(sessionSearchIndex.getPageno());
			}
		}
		
		if(searchIndex.getSortindex() == 0) {
			if(sessionSearchIndex != null) {
				searchIndex.setSortindex(sessionSearchIndex.getSortindex());
			}
		}
		
		if(searchIndex.getCtgindex() == 0) {
			if(sessionSearchIndex != null) {
				searchIndex.setCtgindex(sessionSearchIndex.getCtgindex());
			}
		}
		
		if(searchIndex.getSearchkeyword() == null) {
			if(sessionSearchIndex != null) {
				searchIndex.setSearchkeyword(sessionSearchIndex.getSearchkeyword());
			}
		}
		
		if(searchIndex.getSearchindex() == 0) {
			if(sessionSearchIndex != null) {
				searchIndex.setSearchindex(sessionSearchIndex.getSearchindex());
			}
		}
		
		if(searchIndex.getStartdate() == null) {
			if(sessionSearchIndex != null) {
				searchIndex.setStartdate(sessionSearchIndex.getStartdate());
			}
		}
		if(searchIndex.getEnddate() == null) {
			if(sessionSearchIndex != null) {
				searchIndex.setEnddate(sessionSearchIndex.getEnddate());
			}
		}
		
		return searchIndex;
	}
}
