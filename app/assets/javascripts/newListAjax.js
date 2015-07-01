$(function(){

	$("#new_list").submit(function(event){
		event.preventDefault();

		var list_name = $("#list_name").val();

		listCreation(list_name);

	});


	function listCreation(list_name){

		$.ajax({
			type: "post",
			url: "/lists",
			dataType: "JSON",
			data: {
				list: {
					name: list_name,
				}
			},

			success: function(data, textStatus, jqXHR){
        // <li>January 2015
        //  <a href="/lists/"+myJson.id+"">Show</a>
        //  <a href="/lists/1/edit">Edit</a>
        //  <a data-confirm="Are you sure?" rel="nofollow" data-method="delete" href="/lists/1">Destroy</a>
        // </li>


        var html = "<li><a href='/lists/" + data.id + "'>" + list_name + "</a>";
        $("#results").prepend(html);

				// var html = "<li>" +list_name + "<a href='/lists/"+data.id+"'>Show</a></li>";
				// $("#results").prepend(html);

			},
			error: function(jqXHR, textStatus, errorThrown){
				alert("ERROR");
			}

		});
	}
});
