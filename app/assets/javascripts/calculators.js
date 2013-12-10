$(function() {
	var $linealFeetCalc = $('#lineal-feet-calc');
	var $singleWallShingleCalc = $('#single-wall-shingle-calc');
	var $doubleWallShingleCalc = $('#double-wall-shingle-calc');
	var $roofShingleCalc = $('#roof-shingle-calc');


	$linealFeetCalc.submit(function() {
		var squareFeet = $('#sqft-lineal').val();
		var millwork = $('#millwork :selected').val()
		var total = squareFeet * millwork;
		$('#lineal-feet').empty().append(total.toFixed(2));
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
});
