<<<<<<< HEAD
$('#btnClose').on('click', function () {
  self.close();
});

$('#btnEnroll').on('click', function (e) {
  let stringVal = $('input[name="seq_order"]:checked').val();
  let array = stringVal.split('/');
  let seq_order = array[0];
  let buy_name = array[1];

  opener.document.getElementById('seq_order').value = seq_order;
  opener.document.getElementById('buy_name').value = buy_name;
  self.close();
});
=======

	$("#btnClose").on("click", function(){
 		self.close();
 	});
 
 	$("#btnEnroll").on("click", function(e){
 		let stringVal = $('input[name="seq_order"]:checked').val();
 		let array = stringVal.split("/");
 		let seq_order = array[0];
 		let buy_name = array[1];
 		
 		opener.document.getElementById("seq_order").value = seq_order;
 		opener.document.getElementById("buy_name").value = buy_name;
 		self.close();
 	});
 	
>>>>>>> fa0d61449ee11d5d8ecf5513db7ce8eaf887b622
