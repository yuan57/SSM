<!DOCTYPE html>
<%@ page contentType="text/html;charset=gb2312" %>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8" >
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- ����3��meta��ǩ*����*������ǰ�棬�κ��������ݶ�*����*������� -->
    <title>Ա���б�</title>

<%--    ����/Ϊ��ʼ�����·�����Ե�ǰ��Դ��·��Ϊ��׼���������׳�����
        ��/Ϊ��ʼ�����·��������Դ���Է�������·��Ϊ��׼��http://localhost:3306��:��Ҫ������Ŀ��
        http://localhost:8080/ssm/
--%>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <!-- jQuery (Bootstrap ������ JavaScript ��������� jQuery�����Ա������ǰ��) -->
    <%--    ����jquery--%>
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-1.8.3.js"></script>
    <%--    ������ʽ--%>
    <!-- Bootstrap -->
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- ���� Bootstrap ������ JavaScript �������Ҳ���Ը�����Ҫֻ���ص�������� -->
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/npm.js"></script>
</head>
<body>
    <%--���ʾҳ��--%>
    <div class="container">
        <%--����--%>
        <div class="row" class="col-md-12">SSM-CRUD</div>
        <%--��ť--%>
        <div class="row"></div>
        <%--��ʾ�������--%>
        <div class="row"></div>
         <%--��ʾ��ҳ--%>
        <div class="row"></div>
    </div>
</body>
</html>