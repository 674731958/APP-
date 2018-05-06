<script type="text/javascript" src="../../../statics/js/jquery-1.8.3.min.js"></script>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common/header.jsp"%>
<div class="clearfix"></div>
<div class="row">
	<div class="col-md-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>
					APP 信息管理维护 <i class="fa fa-user"></i><small>${devUserSession.devName}
						- 您可以通过搜索或者其他的筛选项对APP的信息进行修改、删除等管理操作。^_^</small>
				</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<form method="post" action="../dev/list.do">
					<input type="hidden" name="pageIndex" value="1" />
			    <ul>
					<li>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">软件名称</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input id="softName" name="querySoftwareName" type="text" class="form-control col-md-7 col-xs-12" value="${querySoftwareName }">
							</div>
						</div>
					</li>
					
					<li>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">APP状态</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<select name="queryStatus" class="form-control">
									<c:if test="${statuslist != null }">
									   <option value="">--请选择--</option>
									   <c:forEach var="dataDictionary" items="${statuslist}">
									   		<option <c:if test="${dataDictionary.valueId == queryStatus }">selected="selected"</c:if>
									   		value="${dataDictionary.valueId}">${dataDictionary.valueName}</option>
									   </c:forEach>
									</c:if>
        						</select>
							</div>
						</div>
					</li>
					<li>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">所属平台</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<select name="queryFlatformId" class="form-control">
									<c:if test="${flatforms != null }">
									   <option value="">--请选择--</option>
									   <c:forEach var="dataDictionary" items="${flatforms}">
									   		<option <c:if test="${dataDictionary.valueId == queryFlatformId }">selected="selected"</c:if>
									   		value="${dataDictionary.valueId}">${dataDictionary.valueName}</option>
									   </c:forEach>
									</c:if>
        						</select>
							</div>
						</div>
					</li>
					<li>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">一级分类</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<select id="queryCategoryLevel1" name="queryCategoryLevel1" class="form-control">
									<c:if test="${categorylist1 != null }">
									   <option value="0">--请选择--</option>
									   <c:forEach var="appCategory" items="${categorylist1}">
									   		<option <c:if test="${appCategory.id == queryCategoryLevel1 }">selected="selected"</c:if>
									   		value="${appCategory.id}">${appCategory.categoryName}</option>
									   </c:forEach>
									</c:if>
        						</select>
							</div>
						</div>
					</li>
					<li>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">二级分类</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="hidden" name="categorylevel2list" id="categorylevel2list"/>
        						<select name="queryCategoryLevel2" id="queryCategoryLevel2" class="form-control">
        							<c:if test="${categoryLevel2List != null }">
									   <option value="">--请选择--</option>
									   <c:forEach var="appCategory" items="${categoryLevel2List}">
									   		<option <c:if test="${appCategory.id == queryCategoryLevel2 }">selected="selected"</c:if>
									   		value="${appCategory.id}">${appCategory.categoryName}</option>
									   </c:forEach>
									</c:if>
        						</select>
							</div>
						</div>
					</li>
					<li>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">三级分类</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
        						<select name="queryCategoryLevel3" id="queryCategoryLevel3" class="form-control">
        							<c:if test="${categoryLevel3List != null }">
									   <option value="0">--请选择--</option>
									   <c:forEach var="appCategory" items="${categoryLevel3List}">
									   		<option <c:if test="${appCategory.id == queryCategoryLevel3 }">selected="selected"</c:if>
									   		value="${appCategory.id}">${appCategory.categoryName}</option>
									   </c:forEach>
									</c:if>
        						</select>
							</div>
						</div>
					</li>
					<li><button type="submit" class="btn btn-primary"> 查 &nbsp;&nbsp;&nbsp;&nbsp;询 </button></li>
				</ul>
			</form>
		</div>
	</div>
</div>
<div class="col-md-12 col-sm-12 col-xs-12">
	<div class="x_panel">
		<div class="x_content">
			<p class="text-muted font-13 m-b-30"></p>
			<div id="datatable-responsive_wrapper"
				class="dataTables_wrapper form-inline dt-bootstrap no-footer">
				<div class="row">
					<div class="col-sm-12">
					<a href="${pageContext.request.contextPath}/dev/appinfoadd.do" class="btn btn-success btn-sm">新增APP基础信息</a>
						<table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap dataTable no-footer dtr-inline collapsed"
							cellspacing="0" width="100%" role="grid" aria-describedby="datatable-responsive_info" style="width: 100%;">
							<thead>
								<tr role="row">
									<th class="sorting_asc" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="First name: activate to sort column descending"
										aria-sort="ascending">软件名称</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										APK名称</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										软件大小(单位:M)</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										所属平台</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										所属分类(一级分类、二级分类、三级分类)</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										状态</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										下载次数</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										最新版本号</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										style="width: 124px;"
										aria-label="Last name: activate to sort column ascending">
										操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="appInfo" items="${infolist }" varStatus="status">
									<tr role="row" class="odd">
										<td tabindex="0" class="sorting_1">${appInfo.softwareName}</td>
										<td>${appInfo.APKName }</td>
										<td>${appInfo.softwareSize }</td>
										<td>${ appInfo.flatformName}</td>
										<td>${appInfo.categoryLevel1Name } -> ${appInfo.categoryLevel2Name } -> ${appInfo.categoryLevel3Name }</td><%--				
										<td><span id="appInfoStatus ${appInfo.id}">${appInfo.statusName}
										</span></td>
										--%>
											<!-- 审核通过或是下架 改为上架 -->
											<c:if test="${appInfo.status==2||appInfo.status==5}">
											<td ><a id="shangjia" appinfoid="${appInfo.id}">${appInfo.statusName}</a></td>
											</c:if>
											<c:if test="${appInfo.status==1||appInfo.status==3}">
											<td>${appInfo.statusName}</td>
											</c:if>
											<!-- 上架改为下架 -->
											<c:if test="${appInfo.status==4}">
											<td ><a id="xiajia" appinfoid="${appInfo.id}">${appInfo.statusName}</a></td>
											</c:if>		
										<td>${appInfo.downloads }</td>
										<td>${appInfo.versionNo }</td>
										<td>
										<div class="btn-group">
                      <button type="button" class="btn btn-danger">点击操作</button>
                      <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                        <span class="caret"></span>
                        <span class="sr-only">Toggle Dropdown</span>
                      </button>
                      <ul class="dropdown-menu" role="menu">
                        <li>
                        	<c:choose>
											<c:when test="${appInfo.status == 2 || appInfo.status == 5}">
												<a class="saleSwichOpen" saleSwitch="open" appinfoid=${appInfo.id }  appsoftwarename=${appInfo.softwareName } data-toggle="tooltip" data-placement="top" title="" data-original-title="恭喜您，您的审核已经通过，您可以点击上架发布您的APP">上架</a>
											</c:when>
											<c:when test="${appInfo.status == 4}">
												<a class="saleSwichClose" saleSwitch="close" appinfoid=${appInfo.id }  appsoftwarename=${appInfo.softwareName } data-toggle="tooltip" data-placement="top" title="" data-original-title="您可以点击下架来停止发布您的APP，市场将不提供APP的下载">下架</a>
											</c:when>
										</c:choose>
                        </li>
                        <li><a href='../dev/appinfoversionadd.do?id=${appInfo.id}' class="addVersion" appinfoid="${appInfo.id }" data-toggle="tooltip" data-placement="top" title="" data-original-title="新增APP版本信息">新增版本</a>
                        </li>
                        <li><a class="modifyVersion" 
											appinfoid="${appInfo.id }" versionid="${appInfo.versionId }" status="${appInfo.status }" 
											statusname="${appInfo.statusName }"											
											data-toggle="tooltip" data-placement="top" title="" data-original-title="修改APP最新版本信息">修改版本</a>
                        </li>
                        <li><c:if test="${appInfo.status==1||appInfo.status==3}">
                        <a  href='../dev/selById.do?id=${appInfo.id}' 
						appinfoid="${appInfo.id }" status="${appInfo.status }" statusname="${appInfo.statusName }"
						data-toggle="tooltip" data-placement="top" title="" data-original-title="修改APP基础信息">修改
						</a></c:if></li>
                        <li><a  href='../dev/selAppInfo.do?id=${appInfo.id}'>查看</a></li>
						<li><a  href='../dev/deleteAppInfo.do?id=${appInfo.id }' onclick="return confirm('你确定要删除吗？')">删除</a></li>
                      </ul>
                    </div>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-5">
						<div class="dataTables_info" id="datatable-responsive_info"
							role="status" aria-live="polite">共${total}条记录
							${ye}/${totalPage}页</div>
							<a href='../dev/list.do?ye=1&querySoftwareName=${querySoftwareName}&queryStatus=${queryStatus }&queryFlatformId=${queryFlatformId }&queryCategoryLevel1=${queryCategoryLevel1 }&queryCategoryLevel1=${queryCategoryLevel2}&queryCategoryLevel3=${queryCategoryLevel3 }'>首页</a><%--
							String querySoftwareName,
							Integer queryStatus,
							Integer queryFlatformId,
							Integer queryCategoryLevel1,
							Integer queryCategoryLevel2,
							Integer queryCategoryLevel3,
							--%><a href='../dev/list.do?ye=${ye>=totalPage?totalPage:ye+1}&querySoftwareName=${querySoftwareName}&queryStatus=${queryStatus }&queryFlatformId=${queryFlatformId }&queryCategoryLevel1=${queryCategoryLevel1 }&queryCategoryLevel1=${queryCategoryLevel2}&queryCategoryLevel3=${queryCategoryLevel3 }'>下一页</a>
							<a href='../dev/list.do?ye=${ye<=1?1:ye-1 }&querySoftwareName=${querySoftwareName}&queryStatus=${queryStatus }&queryFlatformId=${queryFlatformId }&queryCategoryLevel1=${queryCategoryLevel1 }&queryCategoryLevel1=${queryCategoryLevel2}&queryCategoryLevel3=${queryCategoryLevel3 }'>上一页</a>
							<a href='../dev/list.do?ye=${totalPage}&querySoftwareName=${querySoftwareName}&queryStatus=${queryStatus }&queryFlatformId=${queryFlatformId }&queryCategoryLevel1=${queryCategoryLevel1 }&queryCategoryLevel1=${queryCategoryLevel2}&queryCategoryLevel3=${queryCategoryLevel3 }'>末页</a>
					</div>
					<div class="col-sm-7">
						<div class="dataTables_paginate paging_simple_numbers"
							id="datatable-responsive_paginate">
							<ul class="pagination">
								<c:if test="${pages.currentPageNo > 1}">
									<li class="paginate_button previous"><a
										href="javascript:page_nav(document.forms[0],1);"
										aria-controls="datatable-responsive" data-dt-idx="0"
										tabindex="0">首页</a>
									</li>
									<li class="paginate_button "><a
										href="javascript:page_nav(document.forms[0],${pages.currentPageNo-1});"
										aria-controls="datatable-responsive" data-dt-idx="1"
										tabindex="0">上一页</a>
									</li>
								</c:if>
								<c:if test="${pages.currentPageNo < pages.totalPageCount }">
									<li class="paginate_button "><a
										href="javascript:page_nav(document.forms[0],${pages.currentPageNo+1 });"
										aria-controls="datatable-responsive" data-dt-idx="1"
										tabindex="0">下一页</a>
									</li>
									<li class="paginate_button next"><a
										href="javascript:page_nav(document.forms[0],${pages.totalPageCount });"
										aria-controls="datatable-responsive" data-dt-idx="7"
										tabindex="0">最后一页</a>
									</li>
								</c:if>
							</ul>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>
</div>
<%@include file="common/footer.jsp"%>
<script src="${pageContext.request.contextPath }/statics/localjs/rollpage.js"></script>
<%--<script src="${pageContext.request.contextPath }/statics/localjs/appinfolist.js"></script>--%>
<script type="text/javascript">
$(document).ready(function(){
	$(".modifyVersion").click(function(){
		var status=$(this).attr("status");
		var versionId=$(this).attr("versionId");
		var statusName=$(this).attr("statusName");
		var appinfoid=$(this).attr("appinfoid");
		if(status=="1"||status=="3"){ //待审核和审核未通过是时才能进入
			if(versionId==""||versionId==null){
				alert("该APP应用无版本信息，请先增加版本信息");
			}else{
				window.location.href="../dev/modifyVersion.do?appId="+appinfoid+"&versionId="+versionId;
			}
		}else{
			alert("状态为"+statusName+"不能进行修改只能进行增加操作！");
		}
	});
	$("#shangjia").click(function(){
		var appinfoid=$(this).attr("appinfoid");
		$.getJSON("shangjia.do",{"appinfoid":appinfoid},function(data){	
			if(data!="0"){
				$("#shangjia").html("已上架");
			}
		});
	});
	$("#xiajia").click(function(){
		var appinfoid=$(this).attr("appinfoid");
		$.getJSON("xiajia.do",{"appinfoid":appinfoid},function(data){	
			if(data!="0"){
				$("#xiajia").html("已下架");
			}
		});
	})
})
</script>