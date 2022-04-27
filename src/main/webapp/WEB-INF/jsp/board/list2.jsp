<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org"
	xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout"
	data-layout-decorate="~{samples/layout/sampleLayout}"
	>

<!-- 사용자 CSS 추가 -->
<th:block layout:fragment="css">
</th:block>


<!-- 사용자 스크립트 추가 -->
<th:block layout:fragment="script">
<script th:inline="javascript">
/*<![CDATA[*/
$(function () {
	
	var result =/*[[${msg}]]*/ 'default';
	
	if(result == 'success'){
		alert("처리가 완료되었습니다.");
	}
	
	$('#example1').DataTable({
		'ordering'    : false,   /* 자동으로 정렬되는 것을 막자 */
	});
	
    /* $('#example2').DataTable({
      'paging'      : true,
      'lengthChange': false,
      'searching'   : false,
      'ordering'    : true,
      'info'        : true,
      'autoWidth'   : false
    }); */
    
  });

/*]]>*/
</script>
</th:block>



<div layout:fragment="content">

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        게시판 리스트
        <small>advanced tables</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Tables</a></li>
        <li class="active">Data tables</li>
      </ol>
    </section>
    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">

          <div class="box">
            <div class="box-header">
              <h3 class="box-title">List All Page</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>BNO</th>
                  <th>TITLE</th>
                  <th>WRITER</th>
                  <th>REGDATE</th>
                  <th>VIEWCNT</th>
                </tr>
                </thead>
                <tbody>
              		<tr th:each="b : ${list}">
	                  <td th:text="${b.num}">num</td>
	                  <td><a th:href="@{/buddi/bbs/detail?num=${b.num}" th:text="${b.title}">TITLE</a></td>
	                  <td th:text="${b.author}">AUTHOR</td>
	                  <td th:text="${b.bdate}">BDATE</td>
	                  <td th:text="${b.viewcnt}">VIEWCNT</td>
	                </tr>
                </tbody>
                <tfoot>
                <tr>
                  <th>BNO</th>
                  <th>TITLE</th>
                  <th>WRITER</th>
                  <th>REGDATE</th>
                  <th>VIEWCNT</th>
                </tr>
                </tfoot>
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

</div>


</html>