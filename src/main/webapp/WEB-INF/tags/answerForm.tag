<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@attribute name="uri" required="true" type="java.lang.String"%>
<%@attribute name="edit" required="false" type="java.lang.String"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>

<h2 class="title page-title subheader"><fmt:message key="newanswer.answer.your_answer"/></h2>

<c:set var="sameAuthor" value="${question.author eq currentUser}" />
<c:if test="${sameAuthor}">
	<div class="hidden same-author-confirmation hinted-form answer-form">
		<button class="post-submit big-submit">Estou compartilhando uma solu��o</button>
	</div>
</c:if>

<form action="${uri}" method="post" class="validated-form hinted-form answer-form" data-same-author="${sameAuthor}">
	<tags:markDown value="${answer.description}" hintId="newanswer-answer-hint" htmlClass="required" minlength="30"/>
	
	<c:if test='${not empty edit}'>
		<label for="comment"><fmt:message key="edit_form.comment.label" /></label>
		<input type="text" data-hint-id="answer-comment-hint" class="hintable required" length="5" name="comment" />
	</c:if>
	
	<input class="post-submit big-submit" value="<fmt:message key="newanswer.answer.submit"/>" type="submit" />
</form>


<div class="form-hints">
	<div id="newanswer-answer-hint" class="hint">
		<c:choose> 
			<c:when test='${sameAuthor}'>
				<p><fmt:message key="newanswer.answer.sameauthor.hint" /></p>
			</c:when>
			<c:otherwise>
				<p><fmt:message key="newanswer.answer.hint" /></p>
			</c:otherwise>
		</c:choose>
	</div>
	
	<c:if test='${not empty edit}'>
		<div id="answer-comment-hint" class="hint">
			<p><fmt:message key="edit_form.comment.hint"/></p>
		</div>
	</c:if>
</div>
