<script type="text/javascript" src="../../../statics/js/jquery-1.8.3.min.js"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common/header.jsp"%>
<div class="clearfix"></div>
<div class="row">
  <div class="col-md-12 col-sm-12 col-xs-12">
    <div class="x_panel">
      <div class="x_title">
        <h2>修改APP基础信息 <i class="fa fa-user"></i><small>${devUserSession.devName}</small></h2>
             <div class="clearfix"></div>
      </div>
      <div class="x_content">
        <form class="form-horizontal form-label-left" action="../dev/updateAppInfo.do" method="post" enctype="multipart/form-data">
          <input type="hidden" name="id" id="id" value="${appInfo.id}">
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">软件名称 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input id="softwareName" class="form-control col-md-7 col-xs-12" 
               data-validate-length-range="20" data-validate-words="1" 
               name="softwareName" value="${appInfo.softwareName}" required="required"
               placeholder="请输入软件名称" type="text">
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">APK名称 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input id="APKName" type="text" class="form-control col-md-7 col-xs-12" 
              name="APKName" value="${appInfo.APKName}" readonly="readonly">
            </div>
          </div>
          
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">支持ROM <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input id="supportROM" class="form-control col-md-7 col-xs-12" 
              	name="supportROM" value="${appInfo.supportROM}" required="required"
              	data-validate-length-range="20" data-validate-words="1" 
              	placeholder="请输入支持的ROM" type="text">
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">界面语言 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input id="interfaceLanguage" class="form-control col-md-7 col-xs-12" 
              data-validate-length-range="20" data-validate-words="1"  required="required"
              name="interfaceLanguage" value="${appInfo.interfaceLanguage}"
              placeholder="请输入软件支持的界面语言" type="text">
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="number">软件大小 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="number" id="softwareSize" name="softwareSize" value="${appInfo.softwareSize}" required="required"
              data-validate-minmax="10,500"  placeholder="请输入软件大小，单位为Mb" class="form-control col-md-7 col-xs-12">
            </div>
          </div>
          
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="number">下载次数 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="number" id="downloads" name="downloads" value="${appInfo.downloads}" required="required"
              data-validate-minmax="10,500"  placeholder="请输入下载次数" class="form-control col-md-7 col-xs-12">
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12"  for="select">所属平台 <span class="required">*</span></label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="hidden" value="${appInfo.flatformId}" id="fid" />
              <select name="flatformId" id="flatformId" class="form-control" required="required"></select>
            </div>
          </div>
          
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="select">一级分类 <span class="required">*</span></label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="hidden" value="${appInfo.categoryLevel1}" id="cl1" />
              <select name="categoryLevel1" id="categoryLevel1" class="form-control"  required="required"></select>
            </div>
          </div>
          
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12"  for="select">二级分类 <span class="required">*</span></label>
            <div class="col-md-6 col-sm-6 col-xs-12">
            	<input type="hidden" value="${appInfo.categoryLevel2}" id="cl2" />
              <select name="categoryLevel2" id="categoryLevel2" class="form-control"  required="required"></select>
            </div>
          </div>
          
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="select">三级分类 <span class="required">*</span></label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="hidden" value="${appInfo.categoryLevel3}" id="cl3" />
              <select name="categoryLevel3" id="categoryLevel3" class="form-control"  required="required"></select>
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">APP状态 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
            	<input id="statusName" type="text" class="form-control col-md-7 col-xs-12" 
              	name="statusName" value="${appInfo.statusName}" readonly="readonly">
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="textarea">应用简介 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <textarea id="appInfo" name="appInfo" required="required"
              placeholder="请输入本软件的相关信息，本信息作为软件的详细信息进行软件的介绍。" class="form-control col-md-7 col-xs-12">
              ${appInfo.appInfo}</textarea>
            </div>
          </div>
           <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">LOGO图片 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
				<input type="hidden" id="logoPicPath" name="logoPicPath" value="${appInfo.logoPicPath}"/>
            	<input type="hidden" id="logoLocPath" name="logoLocPath" value="${appInfo.logoLocPath}"/>
				<div id="uploadfile" style="display: none">
				<input id="attach"  type="file" class="form-control col-md-7 col-xs-12" name="attach">
				<p><span style="color:red;font-weight: bold;">*注：1、大小不得超过500k.2、图片格式：jpg、png、jpeg、pneg</span></p>
				</div>
				<div id="logoFile"></div>
				${fileUploadError }
            </div>
          </div>
          <div class="form-group">
            <div class="col-md-6 col-md-offset-3">
            	<c:if test="${appInfo.status == 3}">
            	 	<button id="send" type="submit" name="status" value="1" class="btn btn-success">保存并再次提交审核</button>
            	</c:if>
              <button id="send" type="submit" class="btn btn-success">保存</button>
              <button type="button" class="btn btn-primary" id="back">返回</button>
              <br/><br/>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<%@include file="common/footer.jsp"%>
<script type="text/javascript">
	function delfile(id){
		$.getJSON("updateFile.do",{"id":id},function(data){
			if(data>0){
				alert("删除成功！");
				$("#uploadfile").show();
				$("#logoFile").hide();
			}else{
				alert("删除失败！");
				
			}
		});
	}
$(document).ready(function(){
		//动态加载平台
		$.getJSON("flatforms.do",function(data){
			var fid=$("#fid").val();
			$("#flatformId").html("");
			var options="<option value='0'>--请选择--</option>"
			$(data).each(function(){			
				if(fid==this.valueId){   //info表的id和Dictionary的id相等就选中	
					options+="<option selected value="+this.valueId+">"+this.valueName+"</option>";
				}else{
					options+="<option  value="+this.valueId+">"+this.valueName+"</option>";
				}
			});
			$("#flatformId").html(options);
		});
		//动态加载1及菜单
		$.getJSON("category1.do",function(data){
			var cl1=$("#cl1").val();
			$("#categoryLevel1").html("");
			var options="<option value='0'>--请选择--</option>"
			$(data).each(function(data){
				if(cl1==this.id){
					options+="<option selected value="+this.id+">"+this.categoryName+"</option>"
				}else{
					options+="<option value="+this.id+">"+this.categoryName+"</option>"
				}
			});
			$("#categoryLevel1").html(options);
		})	
		//动态加载2及菜单
		var cl1=$("#cl1").val();
		$.getJSON("categorylevellist.do",{"queryCategoryLevel1":cl1},function(data){
			var cl2=$("#cl2").val();
			$("#categoryLevel2").html("");
			var options="<option value='0'>--请选择--</option>";
			$(data).each(function(){
				if(cl2==this.id){
					options+="<option  selected value="+this.id+">"+this.categoryName+"</option>";
				}else{
					options+="<option  value="+this.id+">"+this.categoryName+"</option>";
				}
			});
			$("#categoryLevel2").html(options);
		});
		//连动加载2及菜单
		$("#categoryLevel1").change(function(){
			var cl1=$("#cl1").val();		
			$("#categoryLevel2").html("");
			var options="<option value='0'>--请选择--</option>"
			$.getJSON("categorylevellist.do",{"queryCategoryLevel1":cl1},function(data){
				$(data).each(function(){
					//alert(this.categoryName);
					options+="<option  value="+this.id+">"+this.categoryName+"</option>";
				})
				$("#categoryLevel2").html(options)
			})
			
		})
		//动态加载3及菜单
		var cl2=$("#cl2").val();
		$.getJSON("categorylevellist2.do",{"queryCategoryLevel2":cl2},function(data){
			var cl3=$("#cl3").val();
			$("#categoryLevel3").html("");
			var options="<option value='0'>--请选择--</option>";
			$(data).each(function(){
				if(cl3==this.id){
					options+="<option  selected value="+this.id+">"+this.categoryName+"</option>";
				}else{
					options+="<option  value="+this.id+">"+this.categoryName+"</option>";
				}
			});
			$("#categoryLevel3").html(options);
		});
		//连动加载3及菜单
		$("#categoryLevel2").change(function(){
			var cl2=$("#cl2").val();		
			$("#categoryLevel3").html("");
			var options="<option value='0'>--请选择--</option>"
			$.getJSON("categorylevellist2.do",{"queryCategoryLevel2":cl2},function(data){
				$(data).each(function(){
					options+="<option  value="+this.id+">"+this.categoryName+"</option>";
				})
				$("#categoryLevel3").html(options)
			})
			
		})
			
	//LOGO图片---------------------
	var logoPicPath = $("#logoPicPath").val();
	var id = $("#id").val();
	if(logoPicPath == null || logoPicPath == "" ){
		$("#uploadfile").show();
	}else{
		$("#logoFile").append("<p><img src=\""+logoPicPath+"?m="+Math.random()+"\" width=\"100px;\"/> &nbsp;&nbsp;"+
							"<a href='javascript:;' onclick='delfile("+id+");'>删除</a></p>");
	}
	});
	
</script>
<%--<script src="${pageContext.request.contextPath }/statics/localjs/appinfomodify.js"></script>--%>