<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>�ʴ�BBS</title>
	<link rel="stylesheet" type="text/css" href="../css/styles.css">

  </head>
  
<body>
	<center>
		<%@ include file="top.jsp" %>
		<div id="wholePage">
			<div id="currentPoint">
				��ǰλ��:&nbsp;&nbsp;<a class="green" href="allPostAction.action">��ҳ</a>
			</div>
			<ul class="singlePost">
				<li class="sequence">����</li>
				<li class="topic" style="text-align: center;">����</li>
				<li class="author">����</li>
				<li class="date">����</li>
				<li class="delete">ɾ��</li>
			</ul>
			<s:iterator value="allQuestion" status="st">
				<ul class="singleQuestion">
					<li class="sequence">
						<s:property value="#st.getIndex()+1+(pageNumber-1)*pageSize"/>
					</li>
					<li class="topic">
						<a class="maroon" href="QuestionMatterAction.action?questionId=<s:property value="postId"/>"><s:property value="topic"/></a>
					</li>
					<li class="author">
						<a class="green" href="userInformationAction.action?userId=<s:property value="user.userId"/>"><s:property value="user.userNickname"/></a>
					</li>
					<li class="date">
						<s:date name="postTime" format="yyyy-MM-dd HH:mm:ss"/>
					</li>
					<li class="delete">
						<s:if test="%{#session.loginManager != null}">
							<a class="blue" href="deleteQuestionAction.action?questionId=<s:property value="postId"/>&pageNumber=<s:property value="pageNumber"/>">ɾ��</a>
						</s:if>
						<s:else> ---- </s:else>
					</li>
				</ul>				
			</s:iterator>
			<ul class="singleQuestion">
				<li class="postPaging">
					<s:property value="pageNumber"/>/<s:property value="totalPage"/>
					<a class="maroon" href="allQuestionAction.action?pageNumber=1">��ҳ</a>
					<a class="maroon" href="allQuestionAction.action?pageNumber=<s:property value="pageNumber-1"/>">��һҳ</a>
					<a class="maroon" href="allQuestionAction.action?pageNumber=<s:property value="pageNumber+1"/>">��һҳ</a>
					<a class="maroon" href="allQuestionAction.action?pageNumber=<s:property value="totalPage"/>">ĩҳ</a>
				</li>
			</ul>
		</div>
		<%@ include file="bottom.html" %>		
	</center>
</body>
</html>