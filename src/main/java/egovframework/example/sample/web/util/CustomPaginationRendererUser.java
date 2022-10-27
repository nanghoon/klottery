package egovframework.example.sample.web.util;

import egovframework.rte.ptl.mvc.tags.ui.pagination.AbstractPaginationRenderer;

public class CustomPaginationRendererUser extends AbstractPaginationRenderer{
	
	public CustomPaginationRendererUser() {
		firstPageLabel = "";
		previousPageLabel = "<a href=\"#\" onclick=\"{0}({1}); return false;\" class=\"paging prev\">&lt;</a> ";
		currentPageLabel = "<a href=\"#\" onclick=\"{0}({1}); return false;\" class=\"paging click\">{0}</a>";
		otherPageLabel = "<a href=\"#\" onclick=\"{0}({1}); return false;\" class=\"paging\">{2}</a>";
		nextPageLabel = "<a href=\"#\" onclick=\"{0}({1}); return false;\" class=\"paging prev\">&gt;</a>";
		lastPageLabel = "";
	}
}

