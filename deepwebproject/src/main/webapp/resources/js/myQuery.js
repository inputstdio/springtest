function validateEmail(sEmail) {
	var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	if (filter.test(sEmail)) {
		return true;
	} else {
		return false;
	}
}
function findPost() {
	new daum.Postcode({
		oncomplete : function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
			var extraRoadAddr = ''; // 도로명 조합형 주소 변수

			// 법정동명이 있을 경우 추가한다. (법정리는 제외)
			// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
				extraRoadAddr += data.bname;
			}
			// 건물명이 있고, 공동주택일 경우 추가한다.
			if (data.buildingName !== '' && data.apartment === 'Y') {
				extraRoadAddr += (extraRoadAddr !== '' ? ', '
						+ data.buildingName : data.buildingName);
			}
			// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			if (extraRoadAddr !== '') {
				extraRoadAddr = ' (' + extraRoadAddr + ')';
			}
			// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
			if (fullRoadAddr !== '') {
				fullRoadAddr += extraRoadAddr;
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('zipcode').value = data.zonecode;
			document.getElementById('address1').value = fullRoadAddr;
			document.getElementById('address2').value = data.jibunAddress;

		},
		onclose : function(state) {
			if (state === 'FORCE_CLOSE') {
				// 사용자가 브라우저 닫기 버튼을 통해 팝업창을 닫았을 경우, 실행될 코드를 작성하는 부분입니다.
			} else if (state === 'COMPLETE_CLOSE') {
				// 사용자가 검색결과를 선택하여 팝업창이 닫혔을 경우, 실행될 코드를 작성하는 부분입니다.
				// oncomplete 콜백 함수가 실행 완료된 후에 실행됩니다.
			}
		}
	}).open();
}

function findPost_vender() {
	new daum.Postcode({
		oncomplete : function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
			var extraRoadAddr = ''; // 도로명 조합형 주소 변수

			// 법정동명이 있을 경우 추가한다. (법정리는 제외)
			// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
				extraRoadAddr += data.bname;
			}
			// 건물명이 있고, 공동주택일 경우 추가한다.
			if (data.buildingName !== '' && data.apartment === 'Y') {
				extraRoadAddr += (extraRoadAddr !== '' ? ', '
						+ data.buildingName : data.buildingName);
			}
			// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			if (extraRoadAddr !== '') {
				extraRoadAddr = ' (' + extraRoadAddr + ')';
			}
			// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
			if (fullRoadAddr !== '') {
				fullRoadAddr += extraRoadAddr;
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('vender_zipcode').value = data.zonecode;
			document.getElementById('vender_newaddr').value = fullRoadAddr;
			document.getElementById('vender_oldaddr').value = data.jibunAddress;
		},
		onclose : function(state) {
			if (state === 'FORCE_CLOSE') {
				// 사용자가 브라우저 닫기 버튼을 통해 팝업창을 닫았을 경우, 실행될 코드를 작성하는 부분입니다.
			} else if (state === 'COMPLETE_CLOSE') {
				// 사용자가 검색결과를 선택하여 팝업창이 닫혔을 경우, 실행될 코드를 작성하는 부분입니다.
				// oncomplete 콜백 함수가 실행 완료된 후에 실행됩니다.
			}
		}
	}).open();
}

function autoHypen() {
	var x = document.getElementById("phone");
	x.value = x.value.replace(/[^0-9]/g, '');
	var tmp = "";

	if (x.value.length > 3 && x.value.length <= 7) {
		tmp += x.value.substr(0, 3);
		tmp += '-';
		tmp += x.value.substr(3);
		x.value = tmp;
	} else if (x.value.length > 7) {
		tmp += x.value.substr(0, 3);
		tmp += '-';
		tmp += x.value.substr(3, 4);
		tmp += '-';
		tmp += x.value.substr(7);
		x.value = tmp;
	}
}

$(document).ready(function() {	
	$('#find').on('click', function() {
		findPost();
		return false;
	})
	$('#image').on('click', function() {
		$('input[type=file]').click();
		return false;
	});
	$('#photo').change(function(event) {
		var temp_path = URL.createObjectURL(event.target.files[0]);
		$('#image').attr('src', temp_path);
	});
	$('#emailAuth').on('click', function() {
		var email = $('#email').val();
		if (email == "") {
			/* alert("Please Input Email") */
			$('#myModal').modal('show');
			$('.modal_btn2').hide();
			$('.modal-body').text("Please Input Email!");
			$('.modal_btn1').on('click', function() {
				$('#email').focus();
				$('#myModal').modal('hide');
			});
			return;
		}
		$.ajax({
			type : 'POST',
			data : "email=" + email,
			datatype : 'json',
			url : 'emailAuth',
			success : function(data) {
				alert(data);
				return false;
			},
			error : function(request, status, error) {
				alert(status);
			}
		});
	});
	$('#check').on('click', function() {
		var email = $('#email').val();
		if (email == "") {
			/* alert("Please Input Email") */
			$('#myModal').modal('show');
			$('.modal_btn2').show();
			$('.modal-body').text("Please Input Email!");
			$('.modal_btn1').on('click', function() {
				$('#email').focus();
				$('#myModal').modal('hide');
			});
			$('.modal_btn2').hide();
			return;
		} else {
			if (validateEmail(email)) {
				$.ajax({
					type : 'POST',
					data : "email=" + email,
					datatype : 'json',
					url : 'check',
					success : function(data) {
						if (data == 0) {
							$('.modal-body').text("This email is available.");
							$('.modal_btn2').show();
							$('.modal_btn1').on('click', function() {
								$('#confirm_yn').val('y')
								$('#password').focus();
								$('#myModal').modal('hide');
							});
							$('.modal_btn2').on('click', function() {
								$('#confirm_yn').val('n')
								$('#email').focus();
								$('#myModal').modal('hide');
							});
						} else {
							$('.modal-body').text("Duplicate email.");
							$('.modal_btn2').hide();
							$('.modal_btn1').on('click', function() {
								$('#confirm_yn').val('n')
								$('#email').focus();
								$('#myModal').modal('hide');
							});
						}
						$('#myModal').modal('show');
						return false;
					},
					error : function(request, status, error) {
						alert("Error : " + request.status);
					}
				});
			} else {
				/* alert("Entered email is not valid."); */
				$('#myModal').modal('show');
				$('.modal_btn2').hide();
				$('.modal-body').text("Entered email is not valid.");
				$('.modal_btn1').on('click', function() {
					$('#confirm_yn').val('n')
					$('#email').focus();
					$('#myModal').modal('hide');
				});
				return;
			}
		}
	});

	$('#save').on('click', function() {
		if ($('#confirm_yn').val() == 'n') {
			$('#myModal').modal('show');
			$('.modal_btn2').hide();
			$('.modal-body').text("Email validation is required.");
			$('.modal_btn1').on('click', function() {
				$('#email').focus();
				$('#myModal').modal('hide');
			});
			return;
		} else {
			$('#member_insert_form').submit();
		}
	})
	
	$('#update_save').on('click', function(){
		$('#myModal').modal('show');
		$('.modal_btn2').show();
		$('.modal-body').text("Do you want to update?");
		$('.modal_btn1').on('click', function() {
			$('#myModal').modal('hide');
			$('#member_update_form').submit();
		});
		$('.modal_btn2').on('click', function() {
			$('#myModal').modal('hide');
		});
		return;
	})
	
//	login.jsp
	$('#login_btn').on('click', function() {
		$('#login_form').submit();
	})
	$('#findpass').on('click', function(){
		$('#emailModal').modal('show');
		$('#findemail').val("");
		$('.modal_findemail').on('click', function(){
			if($('#findemail').val()==""){
				$('#myModal').modal('show');
				$('.login_modal_btn1').on('click', function(){
					$('#findemail').focus();
					$('#myModal').modal('hide');
				})
				return;
			} else {
				$('#emailModal').modal('hide');
				$.ajax({
					type : 'POST',
					data : "email=" + $('#findemail').val(),
					datatype : 'json',
					url : 'emailLossFind',
					success : function(data) {
						if(data == 0){
							$('#myModal').modal('show');
							$('#login-modal-body').text("Email does not exist.");
							$('.login_modal_btn1').on('click', function(){
								$('#emailModal').modal('show');
								$('#findemail').focus();
								$('#myModal').modal('hide');
							})
						} else {
							$('#myModal').modal('show');
							$('#login-modal-body').text("Sent a temporary password by email.");
							$('.login_modal_btn1').on('click', function(){
								$('#myModal').modal('hide');
								$('#emailModal').modal('hide');
							})
						}
						return false;
					},
					error : function(request, status, error) {
						alert(status);
					}
				});
				return;
			}
		})
	})

//	home.jsp
	$('#login').on('click', function() {
		location.replace("login");
	})

//	member_search.jsp
	$('.check-all').click(function() {
		$('.check-one').prop('checked', this.checked);
	})
	$('#selected_delete').on('click', function(){
		var checkbox = [];
		$("input[name='check-one']:checked").each(function(){
			checkbox.push($(this).val());
		});
		if(checkbox.length < 1) {
			$('.modal_btn2').hide();
			$('.modal-body').text("Please select email to delete.");
			$('#member_serach_modal').modal('show');
			$('.modal_btn1').on('click', function() {
				$('#member_serach_modal').modal('hide');
				return;
			});
		} else {
			$('.modal_btn2').show();
			$('.modal-body').text("Do you want to delete?");
			$('#member_serach_modal').modal('show');
			$('.modal_btn1').on('click', function() {
				location.replace("memberSelectedDelete?email="+checkbox);
				$('#member_serach_modal').modal('hide');
				return;
			});
			$('.modal_btn2').on('click', function() {
				$('#member_serach_modal').modal('hide');
				return;
			});
		}
	})
	$('.serach_photo').on('click', function() {
		$('#member_image_modal').modal('show');
		$('.image-modal-body-img').attr('src', this.src);
		$('.image-modal-body-img').on('click', function() {
			$('#member_image_modal').modal('hide');
		})
	});
	$("select[name='level']").each(function(){
		$(this).val($(this).attr('value'));
    });
	$('#fix_all').on('click', function() {
		$('.modal_btn2').show();
		$('.modal-body').text("Do you want to level all fix?");
		$('#member_serach_modal').modal('show');
		$('.modal_btn1').on('click', function() {
			var array_level = new Array;
			var array_email = new Array;
	        $("select[name='level']").each(function(){
	        	array_level.push($(this).val());
	        });
	        $("span[id='email']").each(function(){
	        	array_email.push($(this).text());
	        }); 
	        location.replace("memberLevelUpdate?array_email="+array_email+"&array_level="+array_level);
			$('#member_serach_modal').modal('hide');
			return;
		});
		$('.modal_btn2').on('click', function() {
			$('#member_serach_modal').modal('hide');
			return;
		});
	})
 // board_list.jsp
	$('#board_search').on('click', function() {
		var search = $('#boardSearch').val();
		location.replace("boardList?search="+search);
	})
 // board_detail.jsp
	$('#attach_btn').on('click', function() {
		$('input[type=file]').click();
		return false;
	})
	$('#b_attach').change(function(event) {
		if(window.FileReader){
			var filename = $(this)[0].files[0].name;
		} else {
			var filename = $(this).val().split('/').pop().split('\\').pop();
		}
		
		$('#attach_name').val(filename);
	});
	$('#board_delete').on('click', function() {
		$('#boardModal').modal('show');
		$('.modal-body').text("Are you sure you want to delete?");
		$('.modal_btn1').on('click', function() {
			$('#boardModal').modal('hide');
			location.replace("boardDelete?b_seq="+$('#b_seq').val());
			return;
		});
		$('.modal_btn2').on('click', function() {
			$('#boardModal').modal('hide');
			return;
		});
	})
	$('#board_modify').on('click', function() {
		$('#boardModal').modal('show');
		$('.modal-body').text("Would you like to modify?");
		$('.modal_btn1').on('click', function() {
			$('#boardModal').modal('hide');
			$('#boardModify').submit();
			return;
		});
		$('.modal_btn2').on('click', function() {
			$('#boardModal').modal('hide');
			return;
		});
	})
  // salary_insert_form.jsp
	$('#empno_check').on('click', function() {
		var empno = $('#empno').val();
		if (empno == "") {
			/* alert("Please Input Email") */
			$('#myModal').modal('show');
			$('.modal_btn2').show();
			$('.modal-body').text("Please Input Empno!");
			$('.modal_btn1').on('click', function() {
				$('#empno_available').val('false');
				$('#empno').focus();
				$('#myModal').modal('hide');
			});
			$('.modal_btn2').hide();
			return;
		} else {
			$.ajax({
				type : 'POST',
				data : "empno=" + empno,
				datatype : 'json',
				url : 'checkEmpno',
				success : function(data) {
					if (data == 0) {
						$('.modal-body').text("This empno is available.");
						$('.modal_btn2').show();
						$('.modal_btn1').on('click', function() {
							$('#empno_available').val('true');
							$('#name').focus();
							$('#myModal').modal('hide');
						});
						$('.modal_btn2').on('click', function() {
							$('#empno_available').val('false');
							$('#empno').focus();
							$('#myModal').modal('hide');
						});
					} else {
						$('.modal-body').text("Duplicate empno.");
						$('.modal_btn2').hide();
						$('.modal_btn1').on('click', function() {
							$('#empno_available').val('false');
							$('#empno').focus();
							$('#myModal').modal('hide');
						});
					}
					$('#myModal').modal('show');
					return false;
				},
				error : function(request, status, error) {
					alert("Error : " + request.status);
				}
			});
		}
	});
  // salary_calculation.jsp
	$('#calc_create').on('click', function(){
		if($(calc_month).val()=='' || $(calc_year).val()==''){
			return;
		} else {
			$('#myModal').modal('show');
			$('.modal-body').text("Data will be erased and recreated. Do you want to create?");
			$('.modal_btn1').on('click', function() {
				$('#myModal').modal('hide');
				$('#salaryCalc').attr('action', 'salaryCreate');
				$('#salaryCalc').submit();
			});
			$('.modal_btn2').on('click', function() {
				$('#myModal').modal('hide');
			});
		}
	})
  // vender_insert_form.jsp
	$('#vender_zipcode_find').on('click', function() {
		findPost_vender();
		return false;
	})
  // vender_list.jsp
	$('.vender_check_all').click(function() {
		$('.vender_check_one').prop('checked', this.checked);
	})
	$('#vender_selected_delete').on('click', function(){
		var checkbox = [];
		$("input[name='vender_check_one']:checked").each(function(){
			checkbox.push($(this).val());
		});
		if(checkbox.length < 1) {
			$('.modal_btn2').hide();
			$('.modal-body').text("삭제할 목록을 선택 하세요.");
			$('#myModal').modal('show');
			$('.modal_btn1').on('click', function() {
				$('#myModal').modal('hide');
				return;
			});
		} else {
			$('.modal_btn2').show();
			$('.modal-body').text("선택한 항목을 삭제 합니다.");
			$('#myModal').modal('show');
			$('.modal_btn1').on('click', function() {
				location.replace("venderSelectedDelete?code="+checkbox);
				$('#myModal').modal('hide');
				return;
			});
			$('.modal_btn2').on('click', function() {
				$('#myModal').modal('hide');
				return;
			});
		}
	})
  // product_list.jsp
	$('.product_check_all').click(function() {
		$('.product_check_one').prop('checked', this.checked);
	})
	$('#product_selected_delete').on('click', function(){
		var checkbox = [];
		$("input[name='product_check_one']:checked").each(function(){
			checkbox.push($(this).val());
		});
		if(checkbox.length < 1) {
			$('.modal_btn2').hide();
			$('.modal-body').text("삭제할 목록을 선택 하세요.");
			$('#myModal').modal('show');
			$('.modal_btn1').on('click', function() {
				$('#myModal').modal('hide');
				return;
			});
		} else {
			$('.modal_btn2').show();
			$('.modal-body').text("선택한 항목을 삭제 합니다.");
			$('#myModal').modal('show');
			$('.modal_btn1').on('click', function() {
				location.replace("productSelectedDelete?code="+checkbox);
				$('#myModal').modal('hide');
				return;
			});
			$('.modal_btn2').on('click', function() {
				$('#myModal').modal('hide');
				return;
			});
		}
	})
  // balance_detail.jsp
	$('#balance_delete').click(function() {
		var yyyy = $('#yyyy').val();
		var vendcode = $('#vendcode').val();
		location.replace("balanceDelete?yyyy="+yyyy+"&vendcode="+vendcode);
	})
  // buy.jsp
	$('#buy_new').on('click', function(){
		alert('new!');
	})
	$('#buy_vendcode').on('change', function(){
		var vendname = $(this).children('option:selected').text();
		var vendcode = $(this).val();
		$.ajax({
			type : 'POST',
			data : "vendcode=" + vendcode,
			datatype : 'json',
			url : 'buyNew',
			success : function(data){
				$('#buy_vendname').attr('value', vendname);
				$('#buy_yyyy').attr('value', data.yyyy);
				$('#buy_dd').attr('value', data.dd);
				$('#buy_mm').attr('value', data.mm);
				$('#buy_no').attr('value', data.no);
				$('#buy_hanf').attr('value', data.hanf);
			},
			error : function(request, status, error) {
				alert("Error : " + request.status);
			}
		})
	})
	$('#buy_procodes').on('change', function(){
		var proname = $(this).children('option:selected').text();
		var procode = $(this).val();
		$.ajax({
			type : 'POST',
			data : "procode=" + procode,
			datatype : 'json',
			url : 'buyNew2',
			success : function(data){
				$('#buy_proname').attr('value', proname);
				$('#buy_procode').attr('value', procode);
				$('#buy_stock').attr('value', data.stock);
				$('#buy_price').attr('value', data.saleprice);
				$('#buy_qty').attr('max', data.stock);
				$('#buy_qty').attr('value', 0);
				$('#buy_total').attr('value', 0);
				$('#buy_qty').focus();
			},
			error : function(request, status, error) {
				alert("Error : " + request.status);
			}
		})
	})
	$('#buy_qty').on('change', function(){
		var price = $('#buy_price').val();
		var qty = $('#buy_qty').val();
		$('#buy_total').attr('value', price*qty);
	})
	$('#buy_search_btn').on('click', function(){
		var vendcode = $('#buy_search_vendcode').val();
		var yyyy = $('#buy_search_yyyy').val();
		var mm = $('#buy_search_mm').val();
		if (vendcode == null){
			$('.modal_btn2').hide();
			$('.modal-body').text("검색 할 거래처를 선택 하세요.");
			$('#myModal').modal('show');
			$('.modal_btn1').on('click', function() {
				$('#myModal').modal('hide');
				return;
			});
		} else if (yyyy == ""){
			$('.modal_btn2').hide();
			$('.modal-body').text("검색 할 년도를 입력 하세요.");
			$('#myModal').modal('show');
			$('.modal_btn1').on('click', function() {
				$('#myModal').modal('hide');
				return;
			});
		} else if (mm == null){
			$('.modal_btn2').hide();
			$('.modal-body').text("검색 할 달을 입력 하세요.");
			$('#myModal').modal('show');
			$('.modal_btn1').on('click', function() {
				$('#myModal').modal('hide');
				return;
			});
		} else {
			$('#buySearch').submit();
		}
	})
	$('#buy_update').on('click', function(){
		$('#buyInsert').attr('action', "buyUpdate");
		$('#buyInsert').submit();
	})
	$('#buy_delete').on('click', function(){
		var seq = $('#buy_seq').val();
		location.replace("buyDelete?seq="+seq);
	})
});

function selectedSeq(seq){
	$.ajax({
		type : 'POST',
		data : "seq=" + seq,
		datatype : 'json',
		url : 'buyDetail',
		success : function(data){
			$('#buy_seq').attr('value', data.seq);
			$('#buy_vendcode').val(data.vendcode).prop("selected", true);
			$('#buy_yyyy').attr('value', data.yyyy);
			$('#buy_dd').attr('value', data.dd);
			$('#buy_mm').attr('value', data.mm);
			$('#buy_no').attr('value', data.no);
			$('#buy_hanf').attr('value', data.hanf);
			$('#buy_proname').attr('value', data.proname);
			$('#buy_procodes').val(data.procode).prop("selected", true);
			$('#buy_procode').attr('value', data.procode);
			$('#buy_stock').attr('value', data.stock);
			$('#buy_price').attr('value', data.price);
			$('#buy_qty').attr('max', data.stock);
			$('#buy_qty').attr('value', data.qty);
			$('#buy_total').attr('value', data.total);
			$('#buy_memo').attr('value', data.memo);
			$('#buy_update').show();
			$('#buy_delete').show();
			$('#buy_save').hide();
			$('#buy_reset').hide();
		},
		error : function(request, status, error) {
			alert("Error : " + request.status);
		}
	})
}

function homeModal(str){
	if (str == "login"){
		$('#homeModal').modal('show');
		$('.modal-body').text("This feature requires a login.");
		$('.modal_btn1').on('click', function() {
			$('#homeModal').modal('hide');
			return;
		});
	} else if (str == "permission"){
		$('#homeModal').modal('show');
		$('.modal-body').text("This feature requires level 3.");
		$('.modal_btn1').on('click', function() {
			$('#homeModal').modal('hide');
			return;
		});
	}
}

function memberDeleteFunction(email) {
	$('.modal_btn2').show();
	$('.modal-body').text("Do you want to delete?");
	$('#member_serach_modal').modal('show');
	$('.modal_btn1').on('click', function() {
		location.replace("memberDelete?email="+email);
		$('#member_serach_modal').modal('hide');
		return;
	});
	$('.modal_btn2').on('click', function() {
		$('#member_serach_modal').modal('hide');
		return;
	});
}

/**
 * This will fix the CKEDITOR not handling the input[type=reset] clicks.
 */
$(function() {
    if (typeof CKEDITOR != 'undefined') {
        $('form').on('reset', function(e) {
            if ($(CKEDITOR.instances).length) {
                for (var key in CKEDITOR.instances) {
                    var instance = CKEDITOR.instances[key];
                    if ($(instance.element.$).closest('form').attr('name') == $(e.target).attr('name')) {
                        instance.setData(instance.element.$.defaultValue);
                    }
                }
            }
        });
    }
});