<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>	
<head>
	<link rel="stylesheet"
		href="${pageContext.request.contextPath }/pc/css/mui.min.css" />
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/pc/js/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath }/pc/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath }/pc/css/gongyijingcai.css" />
	<script src="${pageContext.request.contextPath }/pc/js/mui.min.js"></script>
	
	<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/admin/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/admin/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/admin/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/admin/static/h-ui.admin/css/style.css" />
	

<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/static/h-ui.admin/js/H-ui.admin.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/laypage/1.2/laypage.js"></script>
</head>

<table border="1" align="center" width="80%">
	<tr align="center">
		<th>
			&nbsp;编号
		</th>
		<th>
			名称
		</th>
		<th>
			期数
		</th>
		<th>
			操作
		</th>
	</tr>

	<c:forEach items="${list}" var="y">
		<tr align="center">
			<td>
				${y.id}
			</td>
			<td>
				${y.caipiaoType.name }
			</td>
			<td>
				${y.caipiaoQishu }
			</td>
			<td>
				<a href="javascript:view(${y.id})">查看</a>
			</td>
		</tr>
	</c:forEach>

</table>


<script>
   function view(yid)
   {
      var url = "${pageContext.request.contextPath}/yuche.do?p=view";
      var data = {yid:yid};
      var callback = function(data)
      {
          if (data=="没有登录")
          {
             var url = '${pageContext.request.contextPath}/pc/yonghudenglu/denglu_yuche.jsp?yid='+yid;
             layer_show("登录",url,800,500);
             
          }
          else if (data=="还没有购买")
          {
              var url = '${pageContext.request.contextPath}/yuche.do?p=toPayView&yid='+yid;
              layer_show("购买",url,800,500);
          }
          else
          {
              
          }
      }
      $.post(url,data,callback);
   }

</script>
