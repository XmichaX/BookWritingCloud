// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jstree
//= require ckeditor/init
//= require bootstrap.min
//= require_tree .


$(function () {
	$('#table').searchable({
		striped: true,
		oddRow: { 'background-color': '#f5f5f5' },
		evenRow: { 'background-color': '#fff' },
		searchType: 'fuzzy'

	});
	console.log("test");
	$('#searchable-container').searchable({
		searchField: '#container-search',
		selector: '.row',
		childSelector: '.col-xs-4',
		show: function (elem) {
			elem.slideDown(100);
		},
		hide: function (elem) {
			elem.slideUp(100);
		}
	})
});