$(function() {
	var $linealFeetCalc = $('#lineal-feet-calc');
	var $singleWallShingleCalc = $('#single-wall-shingle-calc');
	var $doubleWallShingleCalc = $('#double-wall-shingle-calc');
	var $roofShingleCalc = $('#roof-shingle-calc');

	$linealFeetCalc.submit(function() {
		var squareFeet = $('#sqft-lineal').val();
		var millwork = $('#millwork :selected').val()
		var total = squareFeet * millwork;
		$('#lf-total').empty().append(total.toFixed(2));
		return false;
	});

	$singleWallShingleCalc.submit(function() {
		var squareFeet = $('#sqft-SS').val();
		var shingleSize = $('#single-shingle-size :selected').val();
		var total = squareFeet * shingleSize;
		$('#ss-total').empty().append(total.toFixed(2));
		return false;
	});

	$doubleWallShingleCalc.submit(function() {
		var squareFeet = $('#sqft-DS').val();
		var shingleSize = $('#double-shingle-size :selected').val();
		var total = squareFeet * shingleSize;
		$('#ds-total').empty().append(total.toFixed(2));
		return false;
	});

	$roofShingleCalc.submit(function() {
		var squareFeet = $('#sqft-RS').val();
		var shingleSize = $('#roof-shingle-size :selected').val();
		var total = squareFeet * shingleSize;
		$('#rs-total').empty().append(total.toFixed(2));
		return false;
	});

	$('#lineal-feet-choice').click(function() {
		$('#lineal-feet').siblings('.calculator').hide();
		$('#lineal-feet').slideToggle();
	});

	$('#single-wall-choice').click(function() {
		$('#single-wall').siblings('.calculator').hide();
		$('#single-wall').slideToggle();
	});

	$('#double-wall-choice').click(function() {
		$('#double-wall').siblings('.calculator').hide();
		$('#double-wall').slideToggle();
	});

	$('#roof-choice').click(function() {
		$('#roof-shingle').siblings('.calculator').hide();
		$('#roof-shingle').slideToggle();
	});
	return false;
});
