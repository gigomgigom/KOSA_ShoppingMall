function adminShowByIndex(index) {			
	switch(index) {
		case 'dashboard': 
			$.ajax({
				url: "admin/admin_dashboard",
				method: "get",
				success: function(data) {
					$("#view_container").html(data);
				}
			});
		break;
		case 'member_view': 
			$.ajax({
				url: "admin/admin_member_view",
				method: "get",
				success: function(data) {
					$("#view_container").html(data);
				}
			});
		break;
	}

}