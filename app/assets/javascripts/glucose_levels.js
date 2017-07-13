$(document).ready(function() {
	var readings = $('.gl-reading').length;
	if(readings > 3){
		$('#btn-add-reading').prop('disabled', true);
	}
	$('html').on('click', '#btn-save-reading', function(){
		$.ajax({
			type: "POST",
			url: "/glucose_levels",
			data: $('#frm-createGL').serialize(),
			dataType: 'json',
			success: function(data) {
				$('#frm-createGL .alert').show()
				$('#frm-createGL .alert').text(data.message);
				if(data.status == 200)
					window.location.reload();
			}
		});
		return false;
	});


	$('#datetimepicker1').datepicker({
		showTodayButton: true,
		horizontal: 'left',
		vertical: 'bottom',
    format: 'yyyy/mm/dd'
  });
})
