function checkPass(){
	let alertString = "";

	let pass1 = document.forms["spremeni"]["new"].value;
	let pass2 = document.forms["spremeni"]["new2"].value;
	if(pass1 === pass2){
		return true;
	}else{
		alertString += "Novi gesli se ne ujemata, popravi";
		document.forms["spremeni"]["new"].style.border="thin solid red";
		document.forms["spremeni"]["new2"].style.border="thin solid red";
		alert(alertString);
		return false;
	}
}
function checkLink(){

	let link1 = document.forms["vnos"]["link1"].value;
	let link2 = document.forms["vnos"]["link2"].value;
	return (confirmLink("link1", link1) && confirmLink("link2", link2))
}
function confirmLink(i,link){
	if (link == null || link === "" || link.indexOf("www.youtube.com/watch") >= 0 || link.indexOf("youtu.be") >= 0) {
		document.forms["vnos"][i].style.border="";
		return true;
	}else {
		alert("Napačen "+i+ " , le-ta naj bo URL naslov Youtube videa.");
		document.forms["vnos"][i].style.border="thin solid red";
		return false;
	}
}