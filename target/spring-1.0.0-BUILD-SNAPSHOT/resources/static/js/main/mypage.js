$("#editBtn").on("click",function(e){
    e.preventDefault();
    if (isHR) {
        $("#nameText, #contactText, #birthdayText, #positionText, #departmentText, #emailText").hide();
        $("#nameInput, #contactInput, #birthdayInput, #positionInput, #departmentInput, #emailInput").show();
    }
    $("#zipCodeText, #addressText, #detailAddressText").hide();
    $("#zipCodeInput, #addressInput, #detailAddressInput").show();
    $("#searchAddressBtn").show();
    $("#editBtn").hide();
    $("#saveBtn").show();
})
$("#searchAddressBtn").on("click", function(e){
    e.preventDefault();
    new daum.Postcode({
        oncomplete: function(data) {
            $("#zipCodeInput").val(data.zonecode);
            $("#addressInput").val(data.roadAddress);
            $("#detailAddressInput").focus();
        }
    }).open();
});
$("#backBtn").on("click",function(){
    window.history.back();
})