
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
<link type="text/css" href="./css/left3.css" rel="stylesheet" />
<script src="js/menu.js"></script>

</head>

<body>
	<table class="ta1">
		<tr>
			<td class="td1"><table class="ta2">
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
											<table class="ta3">
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
									<td><table class="ta4">
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
																	href="student/stu1.jsp" target="main">������Ϣ����</a></span></td>
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
											<table class="ta3">
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
					<tr id="show2" style="display: none">
						<td align="center" valign="top"><table width="145" border="0"
								align="center" cellpadding="0" cellspacing="0">
								<tr>
									<td><table class="ta4">
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
																	href="student/stu_select_proj.jsp" target="main">ѡ��Ǽ�</a></span></td>
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
																	href="student/select_stu_proj.jsp" target="main">��ѡ��ѯ</a></span></td>
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
											<table class="ta3">
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
					<tr id="show3" style="display: none">
						<td align="center" valign="top"><table width="145" border="0"
								align="center" cellpadding="0" cellspacing="0">
								<tr>
									<td><table class="ta4">
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
																	href="student/tijiao.jsp" target="main">�����ύ</a></span></td>
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
																	href="student/lunwen_view.jsp" target="main">���Ĳ鿴</a></span></td>
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
											<table class="ta3">
												<tr>
													<td><div align="center">
															<img src="images/top_8.gif" width="16" height="16">
														</div></td>
													<td valign="middle"><div align="center" class="STYLE1">�ɼ��鿴</div></td>
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
									<td><table class="ta4">
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
																	href="student/stu_grade.jsp" target="main">�ɼ��鿴</a></span></td>
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
											<table class="ta3">
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
								<br> ��Ȩ���У�������
							</p>
							<p class="STYLE3">ָ����ʦ��xxxxx</p></td>
					</tr>
				</table></td>
		</tr>
	</table>
</body>
</html>

