$(document).on('read page:load', function(){
	$('.rating').raty( { path: '/assets', scoreName: 'comment[rating]' });
	$('.rated').raty({ path: '/assets', readOnly: true, score: function(){return $(this).attr('data-score');} });
	$('.alert').delay('slow').fadeOut();
});