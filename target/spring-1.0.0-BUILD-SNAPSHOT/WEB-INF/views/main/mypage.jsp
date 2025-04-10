<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"/>
<link rel="stylesheet" href="/css/main/mypage.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
    let isHR = ("<c:out value='${employeeDetail.departmentName}'/>" === "인사팀") ||
               ("<c:out value='${employeeDetail.role}'/>" === "ADMIN");
</script>

<div class="mainContainer">
    <div class="mainHeader">
        <div class="title">
            <h2><span class="material-icons">supervisor_account</span>사원 정보</h2>
        </div>
    </div>
    <div class="mainBody">
        <form action="/hr/update" method="post" id="frm">
            <div class="content">
                <div class="hrProfile" style="background-image: url(${employeeDetail.profileImg});">
                </div>
                <div class="name">
                    이름 :
                    <span id="nameText">${employeeDetail.name}</span>
                    <c:if test="${employeeDetail.departmentName eq '인사팀' or employeeDetail.role eq 'ADMIN'}">
                        <input type="text" id="nameInput" name="name" value="${employeeDetail.name}" style="display:none;" />
                    </c:if>
                </div>
                <div class="contact">
                    연락처 :
                    <span id="contactText">${employeeDetail.contact}</span>
                    <c:if test="${employeeDetail.departmentName eq '인사팀' or employeeDetail.role eq 'ADMIN'}">
                        <input type="text" id="contactInput" name="contact" value="${employeeDetail.contact}" style="display:none;" />
                    </c:if>
                </div>
                <div class="birthday">
                    생년월일 :
                    <span id="birthdayText">${employeeDetail.birthday}</span>
                    <c:if test="${employeeDetail.departmentName eq '인사팀' or employeeDetail.role eq 'ADMIN'}">
                        <input type="text" id="birthdayInput" name="birthday" value="${employeeDetail.birthday}" style="display:none;" />
                    </c:if>
                </div>
                <div class="position">
                    직급 :
                    <span id="positionText">${employeeDetail.jobName}</span>
                    <c:if test="${employeeDetail.departmentName eq '인사팀' or employeeDetail.role eq 'ADMIN'}">
                        <input type="text" id="positionInput" name="jobName" value="${employeeDetail.jobName}" style="display:none;" />
                    </c:if>
                </div>
                <div class="department">
                    부서 :
                    <span id="departmentText">${employeeDetail.departmentName}</span>
                    <c:if test="${employeeDetail.departmentName eq '인사팀' or employeeDetail.role eq 'ADMIN'}">
                        <input type="text" id="departmentInput" name="departmentName" value="${employeeDetail.departmentName}" style="display:none;" />
                    </c:if>
                </div>
                <div class="email">
                    이메일 :
                    <span id="emailText">${employeeDetail.email}</span>
                    <c:if test="${employeeDetail.departmentName eq '인사팀' or employeeDetail.role eq 'ADMIN'}">
                        <input type="text" id="emailInput" name="email" value="${employeeDetail.email}" style="display:none;" />
                    </c:if>
                </div>

                <div class="postCode">
                    우편번호 :
                    <span id="zipCodeText">${employeeDetail.postCode}</span>
                    <input type="text" id="zipCodeInput" name="postCode" value="${employeeDetail.postCode}" style="display:none;" />
                    <button type="button" id="searchAddressBtn" style="display:none;">주소검색</button>
                </div>
                <div class="address">
                    주소 :
                    <span id="addressText">${employeeDetail.address}</span>
                    <input type="text" id="addressInput" name="address" value="${employeeDetail.address}" style="display:none;" readonly />
                </div>
                <div class="detailAddress">
                    상세주소 :
                    <span id="detailAddressText">${employeeDetail.detailAddress}</span>
                    <input type="text" id="detailAddressInput" name="detailAddress" value="${employeeDetail.detailAddress}" style="display:none;" />
                </div>

            </div>
        <div class="btn">
            <button type="button" id="editBtn">수정하기</button>
            <button type="submit" id="saveBtn" style="display:none;">수정완료</button>
            <button type="button" id="backBtn">돌아가기</button>
        </div>
        </form>
    </div>
</div>

<script src="/js/main/mypage.js" type="text/javascript"></script>
<jsp:include page="/WEB-INF/views/template/footer.jsp"/>
