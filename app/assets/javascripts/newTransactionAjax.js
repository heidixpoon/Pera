

	function transactionCreation(item_name, amount_name, list_id){

		$.ajax({
			type: "post",
			url: "/transactions",
			dataType: "JSON",
			data: {
				transaction: {
					item: item_name,
          amount: amount_name,
					list_id: list_id
				}
			},

			success: function(data, textStatus, jqXHR){

        var html = "<li>" + item_name + "</li>";
        $("#results2").prepend(html);
			},

			error: function(jqXHR, textStatus, errorThrown){
				alert(errorThrown);
			}

		});
	}
