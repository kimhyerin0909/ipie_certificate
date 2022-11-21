const resvnum = document.getElementById("resvnum");
const empnum = document.getElementById("empnum");
const workday = document.getElementById("workday");
const seatnum = document.getElementById("seatnum");

const isEmptyData = () => {
	if(resvnum.value  === "") {
		alert("예약번호가 입력되지 않았습니다.")
		resvnum.focus();
		return false;
	}
	else if(empnum.value  === "") {
		alert("사원번호가 입력되지 않았습니다.")
		empnum.focus();
		return false;
	}
	else if(workday.value  === "") {
		alert("근무일자가 입력되지 않았습니다.")
		workday.focus();
		return false;
	}
	else if(seatnum.value  === "") {
		alert("좌석번호가 입력되지 않았습니다.")
		seatnum.focus();
		return false;
	} else {
		alert("좌석예약정보가 등록되었습니다!")
		return true;
	}
}

const rewrite = () => {
	alert("정보를 지우고 처음부터 다시 입력됩니다!")
}

const inquire = () => {
	if(empnum.value === "") {
		alert("사원번호가 입력되지 않았습니다.")
		empnum.focus();
		return false;
	} else {
		return true;
	}
}