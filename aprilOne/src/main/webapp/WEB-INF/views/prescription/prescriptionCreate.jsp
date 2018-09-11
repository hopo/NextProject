<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 처방 등록 </title>
</head>
<body>



<form action="" method="get">
	
<table class="table">
		<tbody>
			
			
			<tr>
				<th>처방코드</th>	<!-- prsCode -->
				<td><input type="text" name="preCode" id="preCode" > </td>
			</tr>
			
			
			
			
			<!-- clnCode  진료상세조회 - 진료코드로 가져옴(진료코드, 환자코드, 담당의, 진료일, 진료내용)   -->  
			<tr>
				<th>진료코드</th>	
				<td>
						c11111
				</td>
			</tr>
			<tr>
				<th>환자코드</th>	<!-- patCode -->  
				<td>
					${item.patCode}<a href="<c:url value='/patientView'/>"><button class="btn btn-sm btn-info">상세보기</button></a>
				</td>
			</tr>
			<tr>
				<th>담당의</th>	<!-- empId -->  
				<td>
					${item.empId}<a href="<c:url value='/employeeView'/>"><button class="btn btn-sm btn-info">상세보기</button></a>
				</td>
			</tr>
			<tr>
				<th>진료일</th>	<!-- clnDate -->  
				<td>
					${item.clnDate} </a>
				</td>
			</tr>
			<tr>
				<th>진료내용</th>	<!-- clnDescr -->  
				<td>
					${item.clnDescr}
				</td>
			</tr>
			<tr>
				<th>이전 처방내역</th>	<!-- prsCode -->
				<td> </td>
			</tr>
			
		
			
			
			<tr>
				<th>처방내역</th>	<!-- prsDescr -->
				<td>
					<textarea cols="55" rows="5"> </textarea>
				</td>
			</tr>
			
			
			
			
			
			<!-- medCode  의약품코드 테이블에서 의약품코드 컬럼3개 가져옴   -->
			
			<tr>
				<th>의약품코드</th>	
				<td>${item.clnDate} <a href="<c:url value='/medicinetView'/>"><button class="btn btn-sm btn-info">상세보기</button></a></td>
			</tr>
			<tr>
				<th>의약품코드2</th>	<!-- medCode2 -->
				<td>${item.clnDescr}</td>
			</tr>
			<tr>
				<th>의약품코드3</th>	<!-- medCode3 -->
				<td>${item.clnDescr}</td>
			</tr>
			
			
			
		</tbody>
	</table>

</form>

</body>
</html>

















