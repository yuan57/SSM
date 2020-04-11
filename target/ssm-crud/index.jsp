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

    <%--    ������ʽ--%>
    <!-- Bootstrap -->
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
    <!-- ���� Bootstrap ������ JavaScript �������Ҳ���Ը�����Ҫֻ���ص�������� -->
    <!-- jQuery (Bootstrap ������ JavaScript ��������� jQuery�����Ա������ǰ��) -->
    <%--    ����jquery--%>
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.3.1.js"></script>
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
            <table class="table table-hover" id="emps_table">
                <thead>
                <tr>
                    <th>#</th>
                    <th>empname</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>department</th>
                    <th>����</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
    <%--��ʾ��ҳ--%>
    <div class="row">
        <%--��ҳ��Ϣ--%>
        <div class="col-md-6" id="page_info_area">
        </div>
        <%--��ҳ����Ϣ--%>
        <div class="col-md-6" id="page_nav_area">
        </div>
        <script type="text/javascript">

            //ҳ��������֮��ֱ�ӷ���ajax����Ҫ����ҳ����
            $(function () {
                //ȥ��ҳ
                to_Page(1);
            });

            function to_Page(pn) {
                $.ajax({
                    url: "${APP_PATH}/emps",
                    data: "pn=" + pn,
                    type: "GET",
                    success: function (result) {
                        // console.log(result);
                        // 1����������ʾԱ������
                        // 2����������ʾ��ҳ��Ϣ
                        build_emps_table(result);
                        build_page_info(result);
                        build_page_nav(result);
                    }
                });
            }

            //������ʾemp����
            function build_emps_table(result) {
                //���֮ǰ����
                $("#emps_table tbody").empty();
                var emps = result.data.pageInfo.list;
                $.each(emps, function (index, item) {
                    // alert(item.empName);
                    var empIdTd = $("<td></td>").append(item.empId);
                    var empNameTd = $("<td></td>").append(item.empName);
                    var genderTd = $("<td></td>").append(item.gender == "M" ? "��" : "Ů");
                    var emailTd = $("<td></td>").append(item.email);
                    var deptNameTd = $("<td></td>").append(item.dept.deptName);
                    var editBtn = $("<button></button>").addClass("btn btn-success btn-sm")
                        .append("<span></span>").addClass("lyphicon glyphicon-pencil")
                        .append("�༭");
                    var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm")
                        .append("<span></span>").addClass("glyphicon glyphicon-trash")
                        .append("ɾ��");
                    var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
                    //append��������ԭ����Ԫ��
                    $("<tr></tr>")
                        .append(empIdTd)
                        .append(empNameTd)
                        .append(genderTd)
                        .append(emailTd)
                        .append(deptNameTd)
                        .append(btnTd)
                        .appendTo("#emps_table tbody");
                });
            }


            //������ʾ��ҳ��Ϣ
            function build_page_info(result) {
                $("#page_info_area").empty();
                $("#page_info_area").append(" ��ǰ��" + result.data.pageInfo.pageNum + "ҳ����" + result.data.pageInfo.pages + "ҳ ��" + result.data.pageInfo.total + "������");
            }

            //������ʾ��ҳ����Ϣ
            function build_page_nav(result) {
                $("#page_nav_area").empty();
                //page_nav_area
                var nav = $("<nav></nav>").addClass("Page navigation");
                var ul = $("<ul></ul>").addClass("pagination");
                var firstPageLi = $("<li></li>").append($("<a></a>").append("��ҳ").attr("href", "#"));
                var prePageLi = $("<li></li>").append($("<a></a>").attr("href", "#").attr("aria-label", "Previous").append($("<span></span>").append("&laquo;").attr("aria-hidden", "true")));
                if (result.data.pageInfo.hasPreviousPage == false) {
                    firstPageLi.addClass("disabled");
                    prePageLi.addClass("disabled");
                } else {
                    firstPageLi.click(function () {
                        to_Page(1);
                    });
                    prePageLi.click(function () {
                        to_Page(result.data.pageInfo.pageNum - 1);
                    });
                }
                var lastPageLi = $("<li></li>").append($("<a></a>").append("ĩҳ").attr("href", "#"));
                var nextPageLi = $("<li></li>").append($("<a></a>").attr("href", "#").attr("aria-label", "Next").append($("<span></span>").append("&raquo;").attr("aria-hidden", "true")));
                if (result.data.pageInfo.hasNextPage == false) {
                    lastPageLi.addClass("disabled");
                    nextPageLi.addClass("disabled");
                } else {
                    lastPageLi.click(function () {
                        to_Page(result.data.pageInfo.pages);
                    });
                    nextPageLi.click(function () {
                        to_Page(result.data.pageInfo.pageNum + 1);
                    });
                }
                ul.append(firstPageLi);
                ul.append(prePageLi);
                $.each(result.data.pageInfo.navigatepageNums, function (index, item) {
                    var numLi = $("<li></li>").append($("<a></a>").append(item).attr("href", "#"));
                    if (result.data.pageInfo.pageNum == item) {
                        numLi.addClass("active");
                    }
                    numLi.click(function () {
                        to_Page(item);
                    });
                    ul.append(numLi);
                });
                ul.append(nextPageLi);
                ul.append(lastPageLi);
                nav.append(ul);
                nav.appendTo("#page_nav_area");
            }
        </script>
    </div>
</div>
</div>
</body>
</html>