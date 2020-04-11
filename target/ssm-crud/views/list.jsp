<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=gb2312" isELIgnored="false" %>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- ����3��meta��ǩ*����*������ǰ�棬�κ��������ݶ�*����*������� -->
    <title>Ա���б�</title>

    <%--    ����/Ϊ��ʼ�����·�����Ե�ǰ��Դ��·��Ϊ��׼���������׳�����
            ��/Ϊ��ʼ�����·��������Դ���Է�������·��Ϊ��׼��http://localhost:3306��:��Ҫ������Ŀ��
            http://localhost:8080/ssm/
    --%>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <!-- jQuery (Bootstrap ������ JavaScript ��������� jQuery�����Ա������ǰ��) -->
    <%--    ����jquery--%>
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-1.8.3.js"></script>
    <%--    ������ʽ--%>
    <!-- Bootstrap -->
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
    <!-- ���� Bootstrap ������ JavaScript �������Ҳ���Ը�����Ҫֻ���ص�������� -->
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/npm.js"></script>
</head>
<body>
<%--���ʾҳ��--%>
<div class="container">
    <%--����--%>
    <div class="row" class="col-md-12">
        <h1>SSM-CRUD</h1>
    </div>
    <%--��ť--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-success  btn-sm">����</button>
            <button class="btn btn-danger btn-sm">ɾ��</button>
        </div>
    </div>
    <%--��ʾ�������--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover">
                <tr>
                    <th>#</th>
                    <th>empname</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>department</th>
                    <th>����</th>
                </tr>
                <c:forEach var="emp" items="${pageInfo.list}">
                    <tr>
                        <th>${emp.empId}</th>
                        <th>${emp.empName}</th>
                        <th>${emp.gender=="M"?"��":"Ů"}</th>
                        <th>${emp.email}</th>
                        <th>${emp.dept.deptName}</th>
                        <th>
                            <button class="btn btn-success btn-sm">
                                �༭
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                            </button>
                            <button class="btn btn-danger btn-sm">
                                ɾ��
                                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                            </button>
                        </th>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <%--��ʾ��ҳ--%>
    <div class="row">
        <%--������Ϣ--%>
        <div class="col-md-6">
            ��ǰ��${pageInfo.pageNum}ҳ����${pageInfo.pages}ҳ ��${pageInfo.total}������
        </div>
        <%--��ҳ����Ϣ--%>
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li><a href="${APP_PATH}/emps?pn=1">��ҳ</a></li>
                    <li><a href="${APP_PATH}/emps?pn=${pageInfo.pages}">ĩҳ</a></li>
                    <c:if test="${pageInfo.hasPreviousPage}">
                        <li>
                            <a href="${APP_PATH}/emps?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>

                    <c:forEach items="${pageInfo.navigatepageNums}" var="pageNum">
                        <c:if test="${pageNum==pageInfo.pageNum}" var="page_Num">
                            <li class="active"><a href="#">${pageNum}</a></li>
                        </c:if>
                        <c:if test="${pageNum!=pageInfo.pageNum}">
                            <li><a href="${APP_PATH}/emps?pn=${pageNum}">${pageNum}</a></li>
                        </c:if>
                    </c:forEach>

                    <c:if test="${pageInfo.hasNextPage}">
                        <li>
                            <a href="${APP_PATH}/emps?pn=${pageInfo.pageNum+1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>

                </ul>
            </nav>
        </div>
    </div>
</div>
</body>
</html>