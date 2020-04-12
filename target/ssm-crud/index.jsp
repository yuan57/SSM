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
<%--   Ա�����ģ̬��--%>
<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" id="emp_add_modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="gridSystemModalLabel">Ա�����</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="empName_add_input" class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_add_input"
                                   placeholder="zs">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_add_input"
                                   placeholder="email@qq.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">gendar</label>
                        <label class="radio-inline">
                            <input type="radio" name="gender" id="gendar_M_add" value="M" checked="checked"> ��
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="gender" id="gendar_F_add" value="F"> Ů
                        </label>
                    </div>
                    <!--�����������б� �ύ����id����-->
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName��</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId" id="dept_add_select">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">�ر�</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">����</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<%--    Ա���޸�ģ̬��--%>
<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel"
     id="emp_update_modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">Ա���޸�</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="empName_add_input"
                               class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName_update-static"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control"
                                   id="email_update_input" placeholder="email@qq.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_update_input"
                               class="col-sm-2 control-label">gendar</label>
                        <label class="radio-inline">
                            <input type="radio" name="gender" value="M"
                                   checked="checked"> ��
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="gender" value="F"> Ů
                        </label>
                    </div>
                    <!--�����������б� �ύ����id����-->
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName��</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId" id="dept_update_select">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">�ر�</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">����</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<%--���ʾҳ��--%>
<div class="container">
    <%--����--%>
    <div class="row" class="col-md-12">
        <h1>SSM-CRUD</h1>
    </div>
    <%--��ť--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-success  btn-sm" id="emp_add_modal_btn">����</button>
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


            var totalRecord;
            var currentPage;

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
                        .append("<span></span>").addClass("lyphicon glyphicon-pencil edit_btn")
                        .append("�༭");
                    //Ϊ�༭��ť����Զ������ԣ�����ʾԱ����ǰid
                    editBtn.attr("edit_id",item.empId);
                    var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm")
                        .append("<span></span>").addClass("glyphicon glyphicon-trash delete_btn")
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
                totalRecord = result.data.pageInfo.total;
                currentPage = result.data.pageInfo.pageNum;
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

            //��������ݺ���ʽ
            function resetForm(ele) {
                //���������
                $(ele)[0].reset();
                $(ele).find("*").removeClass("has-error has-success");
                $(ele).find(".help-block").text("");
            }

            //���������ť����ģ���
            $("#emp_add_modal_btn").click(function () {
                //��������ݺ���ʽ
                resetForm($("#emp_add_modal form"));
                //����ajax���󣬲��������Ϣ����ʾ�����б�
                getDepts("#dept_add_select");
                //����ģ̬��
                $("#emp_add_modal").modal({
                    backdrop: false
                });
            });

            // ��ѯ������Ϣ
            function getDepts(ele) {
                //��������б�
                $(ele).empty();
                $.ajax({
                    url: "${APP_PATH}/depts",
                    type: "GET",
                    success: function (result) {
                        $.each(result.data.depts, function () {
                            var option = $("<option></option>").append(this.deptName).attr("value", this.deptId);
                            option.appendTo(ele);
                        });
                    }
                });
            }

            function validate_add_form() {
                //1���õ�ҪУ������ݣ�ʹ��������ʽ����У��
                var empName = $("#empName_add_input").val();
                var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5}$)/;
                if (!regName.test(empName)) {
                    // alert("�û�����2-5λ���Ļ�����6-16λӢ�ĺ����ֵ����");
                    show_validate_msg($("#empName_add_input"), "eror", "�û�����2-5λ���Ļ�����6-16λӢ�ĺ����ֵ����");
                    return false;
                } else {
                    show_validate_msg($("#empName_add_input"), "success", "");
                }
                var email = $("#email_add_input").val();
                var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
                if (!regEmail.test(email)) {
                    // alert("�����ʽ����ȷ");
                    //Ӧ��������Ԫ��֮ǰ����ʽ
                    show_validate_msg($("#email_add_input"), "eror", "�����ʽ����ȷ")
                    return false;
                } else {
                    show_validate_msg($("#email_add_input"), "success", "");
                }
                return true;
            }

            function show_validate_msg(ele, status, msg) {
                //�����ǰԪ��У��״̬
                ele.parent().removeClass("has-success has-error");
                ele.next("span").text("");
                if (status == "success") {
                    ele.parent().addClass("has-success");
                    ele.next("span").text(msg);
                } else {
                    ele.parent().addClass("has-error");
                    ele.next("span").text(msg);
                }
            }

            //�������
            $("#emp_save_btn").click(function () {
                //1����ģ̬���е������ύ�����ݿ�
                //2���ȶ�Ҫ�ύ�����������ݽ���У��
                //3���ж�֮ǰ���û���У���Ƿ�ɹ�������ɹ�������
                //3������ajax���󣬱���Ա��
                if (!validate_add_form()) {
                    return false;
                }
                if ($(this).attr("ajax-va") == "error") {
                    return false;
                }
                $.ajax({
                    url: "${APP_PATH}/saveEmp",
                    type: "post",
                    data: $("#emp_add_modal form").serialize(),
                    success: function (result) {
                        // alert(result.msg);
                        if (result.code == 200) {
                            // ����ɹ���
                            // 1���ر�ģ̬��
                            $("#emp_add_modal").modal('hide');
                            // 2���������һҳ
                            //����ajax������ʾ���һҳ����
                            to_Page(totalRecord);
                        } else {
                            // {"code":300,"msg":"����ʧ��","data":{"errorField":{"email":"�����ʽ����ȷ"}}}
                            if (result.data.errorField.email != undefined) {
                                //��ʾ���������Ϣ
                                show_validate_msg($("#email_add_input"), "error", "�����ʽ����");
                            }
                            if (result.data.errorField.empName != undefined) {
                                //��ʾ���ִ�����Ϣ
                                show_validate_msg($("#email_add_input"), "error", "va_msg\",\"�û�����2-5λ���Ļ�����6-16λӢ�ĺ����ֵ����");
                            }
                        }

                    }
                });
            });

            //����û����Ƿ��ظ�
            $("#empName_add_input").change(function () {
                //����ajax��������û����Ƿ����
                var empName = this.value;
                $.ajax({
                    url: "${APP_PATH}/checkUser",
                    data: "empName=" + empName,
                    type: "POST",
                    success: function (result) {
                        if (result.code == 200) {
                            //�ɹ�
                            show_validate_msg($("#empName_add_input"), "success", result.data.va_msg);
                            $("#emp_save_btn").attr("ajax-va", "success");
                        } else {
                            show_validate_msg($("#empName_add_input"), "error", result.data.va_msg);
                            $("#emp_save_btn").attr("ajax-va", "error");
                        }
                    }
                });
            });

            //1����ť����֮ǰ�Ͱ��ˣ���˰󶨲���
            //�����ڴ�����ť��ʱ�򴴽���Ҳ����ʹ��live
            $(document).on("click", ".edit_btn", function () {
                // 1�����Ա����Ϣ
                getEmp($(this).attr("edit_id"));
                //2�����������Ϣ����ʾ�����б�
                getDepts("#dept_update_select");
                // 3������ģ̬��,��Ա����id�������°�ť
                $("#emp_update_btn").attr("edit_id",$(this).attr("edit_id"));
                $("#emp_update_modal").modal({
                    backdrop: "static"
                });
            });
            //��ȡһ��Ա������Ϣ
            function getEmp(id) {
                $.ajax({
                    url:"${APP_PATH}/getEmp/"+ id,
                    type:"GET",
                    success:function (result) {
                        //{"code":200,"msg":"����ɹ�","data":{"emp":{"empId":1,"empName":"c7b79","gender":"M","email":"c7b79@qq.com","dId":1,"dept":null}}}
                       var empData=result.data.emp;
                       $("#empName_update-static").text(empData.empName);
                       $("#email_update_input").val(empData.email);
                       $("input[name=gender]").val([empData.gender]);
                       $("#dept_update_select").val([empData.dId]);
                    }
                });
            }

            /**��������ӵ����¼�
             *
             * ���ֱ�ӷ���ajax =PUT��ʽ������
             *��װ������ Employee{empId=1, empName='null', gender='null', email='null', dId=null, dept=null}
             *���⣺������������ ��emploee��װ����
             *ԭ��
             * tomcat��
             * 1�����������е����ݣ���װ��һ��Map
             * 2��request.getParameter("empname")�ͻ�����Mapȡֵ��
             *3��SpringMVC��װPOJO����ʱ�����pojo�е�ÿ�����Ե�ֵ ��request.getParameter("email")
             *PUT�����������е����ݣ�request.getParameter()�ò���
             * Tomcat������PUT����Ͳ����װ��ֻ��Post����ŷ�װ
             *
             *Ҫ��֧��ֱ�ӷ���PUT����Ҫ��װ�������е�����
             * FormContentFilter
             * ����:���������е����������װ��map
             * request�����°�װ��request.getParameter()����д���ͻ���Լ���װ��map��ȡ����
             */
            $("#emp_update_btn").click(function () {
                //1����֤�����Ƿ�Ϸ�
                var email = $("#email_update_input").val();
                var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
                if (!regEmail.test(email)) {
                    show_validate_msg($("#email_update_input"), "eror", "�����ʽ����ȷ")
                    return false;
                } else {
                    show_validate_msg($("#email_update_input"), "success", "");
                }
                //2������ajax���󣬱����޸ĺ����Ϣ  ����PUT����
                $.ajax({
                    url:"${APP_PATH}/saveEmpWithUpdate/"+$(this).attr("edit_id"),
                    type:"PUT",
                    data:$("#emp_update_modal form").serialize(),
                    success:function (result) {
                        $("#emp_update_modal").modal('hide');
                        to_Page(currentPage);
                    }
                });

            });
        </script>
    </div>
</div>
</div>
</body>
</html>