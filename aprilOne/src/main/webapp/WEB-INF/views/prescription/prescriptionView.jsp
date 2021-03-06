<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>.
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 처방 상세보기 </title>
</head>
<body>

<script type="text/javascript">

	$(document).ready(function(){
		$("#btn_mediChooice").click(function () {
			$radio = $('input[name="medi"]:checked');			
			span_id = $("#modal_medi").data("med"); 
			console.log("span_id",  span_id );
			
			$("#" +  span_id ).html( $radio.data("med-codename")  + " [" + $radio.data("med-code") 
					          + ", " + $radio.data("med-unit") 
				              + " <input type='hidden' name='medCode' value='" + $radio.data("med-code") + "' />");
		
			 $("#modal_medi").modal('hide');
		});
		
		// 버튼 클릭 시 
		$(".btn_medi").click(function () {			
			console.log($(this).data('suntack'));
			// modal_medi 안에 담긴 데이터를 med라는 이름으로 show  
			$("#modal_medi").data("med", $(this).data('suntack') );
			$("#modal_medi").modal('show');
			
		});
		
	});

</script>

	<form action="<c:url value='/prescription/prescriptionList'/>" method="POST">
		<table class="table">
			<tbody>
				<tr>
					<th>진료코드</th>	
					<td>${clnCode}</td>
				</tr>
				
				<tr>
					<th>처방코드</th>	<!-- prsCode -->
					<td>${preView.prsCode}</td>
				</tr>
				<!-- clnCode  진료상세조회 - 진료코드로 가져옴(진료코드, 환자코드, 담당의, 진료일, 진료내용)   -->  
				<tr>
					<th>환자코드</th>	<!-- patCode -->  
					<td>${clinicVo.patCode}</td>
				</tr>
				<tr>
					<th>담당의</th>	<!-- empId -->  
					<td>${clinicVo.empId} </td>
				</tr> 
				<tr>
					<th>진료일</th>	<!-- clnDate -->  
					<td>${clinicVo.clnDate}</td>
				</tr>
				<tr>
					<th>진료내용</th>	<!-- clnDescr -->  
					<td>${clinicVo.clnDescr}</td>
				</tr>
				
				
				<tr>
					<th>처방내역</th>	<!-- prsDescr -->
					<td>
						<textarea cols="55" rows="5" name="prsDescr" id="prsDescr"> </textarea>
					</td>
				</tr>
				
				
				
				<!-- medCode  의약품코드 테이블에서 의약품코드 컬럼3개 가져옴   -->
				<tr>
					<th>의약품코드</th>	
					<td>
						<span id="medi_1"></span> 
						 <button type="button" class="btn btn-sm btn-info btn_medi" data-suntack='medi_1' data-target="#modal_medi"> 선택</button>
					</td>
				</tr>
				<tr>
					<th>의약품코드2</th>	<!-- medCode2 -->
					<td>
						<span id="medi_2"></span> 
						<button  type="button" class="btn btn-sm btn-info btn_medi" data-suntack='medi_2'  data-target="#modal_medi"> 선택</button>
					</td>
				</tr>
				<tr>
					<th>의약품코드3</th>	<!-- medCode3 -->
					<td>
						<span id="medi_3"></span> 
						<button  type="button" class="btn btn-sm btn-info btn_medi" data-suntack='medi_3'  ddata-target="#modal_medi"> 선택</button>
					</td>
				</tr>
				
				<tr>				
					<td><a class="btn btn-success" href="prescription/prescriptionList" role="button">처방 리스트</a></td>
				</tr>	
				<tr>				
					<td><a class="btn btn-success" href="prescription/prescriptionUpdate" role="button">처방수정</a></td>
				</tr>	
						
				 <tr>				
					<td><a class="btn btn-warning" href="prescription/prescriptionDelete" role="button">처방삭제 </a></td>
				 </tr> 		
			
		</tbody>
	</table>
</form>




<!-- 의약품 목록 모달창 시작 -->

<div class="modal fade" id="modal_medi">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title"> 약품 선택 </h4>
      </div>
      <div class="modal-body">
        <ul>
	        <c:forEach var="i" items="${medList}">
	        	<li>
	        		<label>
	        			<input type="radio" name="medi" data-med-code="${i.medCode }" data-med-codename="${i.medCodename }" data-med-unit="${i.medUnit }" >
	        			${i.medCodename }, [${i.medCode }, ${i.medUnit }]
	        		</label>
	        	</li>
	        </c:forEach>
        
        
        </ul>
      </div>
       
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" id="btn_mediChooice" class="btn btn-primary">선택</button>
     
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 의약품 목록 모달창 끝 -->

</body>
</html>

















