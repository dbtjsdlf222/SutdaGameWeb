<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>	
	<ul class="pagination" style="border: 1px solid brown">
		<c:if test="${1 < page.start}">
			<li ><a href="?kind=${kind}&p=${page.start - page.pageCount}"  aria-label="이전">
			<span aria-hidden="true">이전</span></a></li>
		</c:if>
		<c:forEach var="p" begin="${page.start}" end="${page.end}">
		<c:choose>
			<c:when test="${p eq page.current}">
				<li class="active disable">
					<a>${p}</a>
				</li>
			</c:when>
			<c:otherwise>
				<li>
					<a href="?kind=${kind}&p=${p}">${p}</a>
				</li>
			</c:otherwise>
		</c:choose>
		</c:forEach>
		<c:if test="${page.next}">
			<li ><a href="?kind=${kind}&p=${page.end+1}"  aria-label="다음">
			<span aria-hidden="true">다음</span></a></li>
		</c:if>
	</ul>