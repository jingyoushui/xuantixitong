
<%@ page language="java" pageEncoding="gb2312"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ page language="java" import="java.sql.*"%>

<html>
<head>
<base href="<%=basePath%>">

<title></title>
<script src="js/menu.js"></script>

<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}

.STYLE1 {
	color: #FFFFFF;
	font-weight: bold;
	font-size: 12px;
}

.STYLE2 {
	font-size: 12px;
	color: #03515d;
}

a:link {
	font-size: 12px;
	text-decoration: none;
	color: #03515d;
}

a:visited {
	font-size: 12px;
	text-decoration: none;
	color: #03515d;
}

.STYLE3 {
	font-size: 12px
}
-->
</style>


</head>

<body>
	<table width="156" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td align="center" valign="top"><table width="100%"
					height="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td height="33" background="images/main_21.gif">&nbsp;</td>
					</tr>


					<tr>
						<td height="20" background="images/main_25.gif" id="td1"
							onClick="show(1)"><table width="100%" border="0"
								cellspacing="0" cellpadding="0">
								<tr>
									<td width="13%">&nbsp;</td>
									<td width="72%" height="20"><div align="center">
											<table width="100%" height="21" border="0" cellpadding="0"
												cellspacing="0">
												<tr>
													<td><div align="center">
															<img src="images/top_8.gif" width="16" height="16">
														</div></td>
													<td valign="middle"><div align="center" class="STYLE1">������Ϣ����</div></td>
												</tr>
											</table>
										</div></td>
									<td width="15%">&nbsp;</td>
								</tr>
							</table></td>
					</tr>
					<tr id="show1">
						<td align="center" valign="top"><table width="145" border="0"
								align="center" cellpadding="0" cellspacing="0">
								<tr>
									<td><table width="130" border="0" align="center"
											cellpadding="0" cellspacing="0">
											<tr>
												<td width="41" height="35"><div align="center">
														<img src="images/left_1.gif" width="31" height="31">
													</div></td>
												<td width="89" height="35"><table width="100%"
														border="0" cellspacing="0" cellpadding="0">
														<tr>
															<td height="23" style="cursor: hand"
																onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "
																onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><span
																class="STYLE2">&nbsp;<a
																	href="teacher/tea1.jsp" target="main">������Ϣ����</a></span></td>
														</tr>
													</table></td>
											</tr>

										</table></td>
								</tr>
							</table></td>
					</tr>


					<tr>
						<td height="20" background="images/main_25.gif" id="td2"
							onClick="show(2)"><table width="100%" border="0"
								cellspacing="0" cellpadding="0">
								<tr>
									<td width="13%">&nbsp;</td>
									<td width="72%" height="20"><div align="center">
											<table width="100%" height="21" border="0" cellpadding="0"
												cellspacing="0">
												<tr>
													<td><div align="center">
															<img src="images/top_8.gif" width="16" height="16">
														</div></td>
													<td valign="middle"><div align="center" class="STYLE1">�������</div></td>
												</tr>
											</table>
										</div></td>
									<td width="15%">&nbsp;</td>
								</tr>
							</table></td>
					</tr>
					<tr id="show2" style="display: none">
						<td align="center" valign="top"><table width="145" border="0"
								align="center" cellpadding="0" cellspacing="0">
								<tr>
									<td><table width="130" border="0" align="center"
											cellpadding="0" cellspacing="0">
											<tr>
												<td width="41" height="35"><div align="center">
														<img src="images/left_1.gif" width="31" height="31">
													</div></td>
												<td width="89" height="35"><table width="100%"
														border="0" cellspacing="0" cellpadding="0">
														<tr>
															<td height="23" style="cursor: hand"
																onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "
																onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><span
																class="STYLE2">&nbsp;<a href="teacher/proj_add.jsp"
																	target="main">�������</a></span></td>
														</tr>
													</table></td>
											</tr>
											<tr>
												<td width="41" height="35"><div align="center">
														<img src="images/left_2.gif" width="31" height="31">
													</div></td>
												<td height="35"><table width="100%" border="0"
														cellspacing="0" cellpadding="0">
														<tr>
															<td height="23" style="cursor: hand"
																onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "
																onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><span
																class="STYLE2">&nbsp;<a
																	href="teacher/proj_select.jsp" target="main">�����ѯ</a></span></td>
														</tr>
													</table></td>
											</tr>

										</table></td>
								</tr>
							</table></td>
					</tr>


					<tr>
						<td height="20" background="images/main_25.gif" id="td3"
							onClick="show(3)"><table width="100%" border="0"
								cellspacing="0" cellpadding="0">
								<tr>
									<td width="13%">&nbsp;</td>
									<td width="72%" height="20"><div align="center">
											<table width="100%" height="21" border="0" cellpadding="0"
												cellspacing="0">
												<tr>
													<td><div align="center">
															<img src="images/top_8.gif" width="16" height="16">
														</div></td>
													<td valign="middle"><div align="center" class="STYLE1">ѡ�����</div></td>
												</tr>
											</table>
										</div></td>
									<td width="15%">&nbsp;</td>
								</tr>
							</table></td>
					</tr>
					<tr id="show3" style="display: none">
						<td align="center" valign="top"><table width="145" border="0"
								align="center" cellpadding="0" cellspacing="0">
								<tr>
									<td><table width="130" border="0" align="center"
											cellpadding="0" cellspacing="0">
											<tr>
												<td width="41" height="35"><div align="center">
														<img src="images/left_1.gif" width="31" height="31">
													</div></td>
												<td width="89" height="35"><table width="100%"
														border="0" cellspacing="0" cellpadding="0">
														<tr>
															<td height="23" style="cursor: hand"
																onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "
																onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><span
																class="STYLE2">&nbsp;<a
																	href="teacher/stu_proj_list.jsp" target="main">ѡ�����</a></span></td>
														</tr>
													</table></td>
											</tr>
										</table></td>
								</tr>
							</table></td>
					</tr>



					<tr>
						<td height="20" background="images/main_25.gif" id="td3"
							onClick="show(4)"><table width="100%" border="0"
								cellspacing="0" cellpadding="0">
								<tr>
									<td width="13%">&nbsp;</td>
									<td width="72%" height="20"><div align="center">
											<table width="100%" height="21" border="0" cellpadding="0"
												cellspacing="0">
												<tr>
													<td><div align="center">
															<img src="images/top_8.gif" width="16" height="16">
														</div></td>
													<td valign="middle"><div align="center" class="STYLE1">���Ĺ���</div></td>
												</tr>
											</table>
										</div></td>
									<td width="15%">&nbsp;</td>
								</tr>
							</table></td>
					</tr>
					<tr id="show4" style="display: none">
						<td align="center" valign="top"><table width="145" border="0"
								align="center" cellpadding="0" cellspacing="0">
								<tr>
									<td><table width="130" border="0" align="center"
											cellpadding="0" cellspacing="0">
											<tr>
												<td width="41" height="35"><div align="center">
														<img src="images/left_1.gif" width="31" height="31">
													</div></td>
												<td width="89" height="35"><table width="100%"
														border="0" cellspacing="0" cellpadding="0">
														<tr>
															<td height="23" style="cursor: hand"
																onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "
																onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><span
																class="STYLE2">&nbsp;<a
																	href="teacher/lunwen.jsp" target="main">���Ĺ���</a></span></td>
														</tr>
													</table></td>
											</tr>



										</table></td>
								</tr>
							</table></td>
					</tr>



					<tr>
						<td height="20" background="images/main_25.gif" id="td3"
							onClick="show(5)"><table width="100%" border="0"
								cellspacing="0" cellpadding="0">
								<tr>
									<td width="13%">&nbsp;</td>
									<td width="72%" height="20"><div align="center">
											<table width="100%" height="21" border="0" cellpadding="0"
												cellspacing="0">
												<tr>
													<td><div align="center">
															<img src="images/top_8.gif" width="16" height="16">
														</div></td>
													<td valign="middle"><div align="center" class="STYLE1">�ɼ�����</div></td>
												</tr>
											</table>
										</div></td>
									<td width="15%">&nbsp;</td>
								</tr>
							</table></td>
					</tr>
					<tr id="show5" style="display: none">
						<td align="center" valign="top"><table width="145" border="0"
								align="center" cellpadding="0" cellspacing="0">
								<tr>
									<td><table width="130" border="0" align="center"
											cellpadding="0" cellspacing="0">
											<tr>
												<td width="41" height="35"><div align="center">
														<img src="images/left_1.gif" width="31" height="31">
													</div></td>
												<td width="89" height="35"><table width="100%"
														border="0" cellspacing="0" cellpadding="0">
														<tr>
															<td height="23" style="cursor: hand"
																onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "
																onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><span
																class="STYLE2">&nbsp;<a
																	href="teacher/stu_grade.jsp" target="main">�ɼ�����</a></span></td>
														</tr>
													</table></td>
											</tr>



										</table></td>
								</tr>
							</table></td>
					</tr>

					<tr>
						<td height="20" background="images/main_25.gif" id="td3"
							onClick="show(6)"><table width="100%" border="0"
								cellspacing="0" cellpadding="0">
								<tr>
									<td width="13%">&nbsp;</td>
									<td width="72%" height="20"><div align="center">
											<table width="100%" height="21" border="0" cellpadding="0"
												cellspacing="0">
												<tr>
													<td><div align="center">
															<img src="images/top_8.gif" width="16" height="16">
														</div></td>
													<td valign="middle"><div align="center" class="STYLE1">�����ʴ�</div></td>
												</tr>
											</table>
										</div></td>
									<td width="15%">&nbsp;</td>
								</tr>
							</table></td>
					</tr>
					<tr id="show6" style="display: none">
						<td align="center" valign="top"><table width="145" border="0"
								align="center" cellpadding="0" cellspacing="0">
								<tr>
									<td><table width="130" border="0" align="center"
											cellpadding="0" cellspacing="0">
											<tr>
												<td width="41" height="35"><div align="center">
														<img src="images/left_1.gif" width="31" height="31">
													</div></td>
												<td width="89" height="35"><table width="100%"
														border="0" cellspacing="0" cellpadding="0">
														<tr>
															<td height="23" style="cursor: hand"
																onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "
																onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><span
																class="STYLE2">&nbsp;<a href="teacher/liuyanban_list.jsp"
																	target="main">�����ʴ�</a></span></td>
														</tr>
													</table></td>
											</tr>

										</table></td>
								</tr>
							</table></td>
					</tr>
					<tr>
						<td height="20" background="images/main_25.gif" id="td3"><table
								width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="13%">&nbsp;</td>
									<td width="72%" height="20"><div align="center">
											<table width="100%" height="21" border="0" cellpadding="0"
												cellspacing="0">
												<tr>
													<td width="18%"><div align="center"></div></td>
													<td width="82%" valign="middle"><div align="center"
															class="STYLE1"></div></td>
												</tr>
											</table>
										</div></td>
									<td width="15%">&nbsp;</td>
								</tr>
							</table></td>
					</tr>
					<tr>
						<td height="39" align="center"><p class="STYLE3">
								<br> ��Ȩ���У�xxxxx
							</p>
							<p class="STYLE3">ָ����ʦ��xxxxx</p></td>
					</tr>
				</table></td>
		</tr>
	</table>
</body>
</html>

