function checkdata() {
	var ssn = form.username.value.toLowerCase();
	<!--����û���-->
	if(!checkUserName(ssn)) {
		return false;
		}
	<!--�������-->
	if(strlen(form.pwd.value)<6 || strlen(form.pwd.value) > 16) {
		//alert("��ȷ��¼���볤��Ϊ6-16");
		document.getElementById("pwdErr").innerHTML = "<font color = 'red'>��ȷ��¼���볤��Ϊ6-16</font>";
		form.pwd.focus();
		return false;
		}else {
			document.getElementById("pwdErr2").innerHTML = "";
		}
	if(strlen2(form.pwd.value)) {
		alert("�Ƿ��ַ����룬ֻ�������ֺ���ĸ");
		form.pwd.focus();
		return false;
		}
	if(form.pwd2.value == "") {
		//alert("������ȷ������");
		document.getElementById("pwdErr2").innerHTML = "<font color = 'red'>������ȷ������</font>";
		form.pwd2.focus();
		return false;
		}
	if(form.pwd2.value != form.pwd.value) {
		//alert("������������벻һ�£�");
		document.getElementById("pwdErr2").innerHTML = "<font color = 'red'>������������벻һ�£�</font>";
		form.pwd2.focus();
		return false;
		} else {
			document.getElementById("pwdErr2").innerHTML = "";
		}
	if(!(form.sex[0].checked || form.sex[1].checked)) {
		alert("��ѡ���Ա𡣡�");
		form.sex[0].focus();
		return false;
		}
	if(form.provice.selectedIndex == 0) {
		alert("��ѡ��ʡ�ݡ���");
		form.provice.focus();
		return false;
		}
	return true ;
	}
	

		<!-- ���Ǽ���û����ĺ���-->
function	checkUserName(ssn) {
		if(ssn.length < 3 ||ssn.length > 18) {
			//alert("�û���Ӧ�ô���3��С��18���ַ�");
			document.getElementById("usernameErr").innerHTML = "<font color = 'red'>��������ȷ���û�����Ӧ�ô���3��С��18���ַ�</font>";
			form.username.focus();
			return false;
			}
		if(isWhiteSpace(ssn)) {
			//alert("�û������ܰ����ո�");
			form.username.focus();
			return false;
			}
		if(!isString(ssn)) {
			//alert("�û�������������������롣��Ӧ������ĸ�������ֿ�ʼ����������Դ�Сд");
			form.username.focus();
			return false;
			}	
			document.getElementById("usernameErr").innerHTML = "";
			return true;
		}
		<!--����Ƿ�ո�-->
function	isWhiteSpace(ssn) {
			var space = " \t\n\r";
			var i;
			for(i=0;i < ssn.length;i++) {
				var c = ssn.charAt(i);
				if(space.indexOf(c) >= 0) {
					return true;
					}
				}
				return false;
			}
			
		<!--������ʽ����鴮-->
function	isString(ssn) {
			var re = /^[0-9a-z][\w-.]*[0-9a-z]$/i;
			if(re.test(ssn)) {
				return true;
			}
			else return false;
		}
		<!--����ĳ��ȼ��-->
function strlen(str) {
	var len;
	var i;
	len = 0;
	for(i=0;i<str.length;i++) {
		if(str.charCodeAt(i) > 255) len+=2;
		else len++;
		}
	return len;
	}
	
function strlen2(str) {
	var len;
	var i;
	len = 0;
	for(i=0;i<str.length;i++) {
		if(str.charCodeAt(i) > 255) return true;
		}
	return false;
	}
			