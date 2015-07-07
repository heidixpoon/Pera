$(function(){

	$("#new_transaction").submit(function(event){
		event.preventDefault();

		var item_name = $("#item_name").val();
    var amount_name = $("#amount_name").val();


		transactionCreation(item_name, amount_name);

	});


	function transactionCreation(item_name, amount_name){

		$.ajax({
			type: "post",
			url: "/lists/2",
			dataType: "JSON",
			data: {
				transaction: {
					item: item_name,
          amount: amount_name
				}
			},

			success: function(data, textStatus, jqXHR){
        // <li>January 2015
        //  <a href="/lists/"+myJson.id+"">Show</a>
        //  <a href="/lists/1/edit">Edit</a>
        //  <a data-confirm="Are you sure?" rel="nofollow" data-method="delete" href="/lists/1">Destroy</a>
        // </li>

        var html = "<li>" + item_name + "</li>";
        $("#results2").prepend(html);

				// var html = "<li>" +list_name + "<a href='/lists/"+data.id+"'>Show</a></li>";
				// $("#results").prepend(html);

			},
			error: function(jqXHR, textStatus, errorThrown){
				alert("ERROR");
			}

		});
	}
});
