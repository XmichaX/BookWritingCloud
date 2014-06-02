$(document).ready(function () {
    $('form[data-remote]').bind("ajax:before", function () {
        for (instance in CKEDITOR.instances) {
            CKEDITOR.instances[instance].updateElement();
        }
    });

    $("#book_new").on('ajax:success', function (e, data, status, xhr) {
        htmlToAppend = '<tr><td>' + data.title + '</td><td>' + data.edition + '</td><td>' + data.published + '</td><td>'
            + data.genre + '</td><td>' + data.tags + '</td><td>' + getUsers(data.users) + '</td>';

        htmlToAppend += '<td><a href="/books/' + data.id + '"><span class="glyphicon glyphicon-pencil">' +
            '</span></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/books/' + data.id + '" data-confirm="Are you sure?" ' +
            'data-method="delete" rel="nofollow"><span class="glyphicon glyphicon-trash"></span></a></td></tr>';

        $('.books-content tr:last').after(htmlToAppend);
        $('#myModal').modal('hide');
    });

    $('#submit-book').click(function () {
        $('#book_new').submit();
    });

    $('.book-save').click(function () {
        $('#book_edit').submit();
    });

    $('.book-info').click(function () {
        $('#myModal').modal('show');
    });

    $('.book-edit').click(function () {
        $('#myModal').modal('hide');
        $('#myModalEdit').modal('show');
    });

    $("#book_edit").on('ajax:success', function (e, data, status, xhr) {
        $('#myModalEdit').find('.modal-footer').prepend('<div class="alert alert-success text-left remove-time">Information updated successfully!</div>');
        $('.remove-time').delay(4000).fadeOut();
        update_book(data);
    });

});

function update_book(bookJson) {
    $('.book-title').html(bookJson.title);
    $('.book-edition').html(bookJson.edition);
    $('.book-genre').html(bookJson.genre);
    $('.book-tags').html(bookJson.tags);
    $('.book-published').html(bookJson.published);
    $('.book-abstract').html(bookJson.abstract);
};

function getUsers(dataJson) {
    var stringUser = "";
    var length = dataJson.length;

    $.each(dataJson, function (index) {
        $.each(this, function (k, v) {
            stringUser += v + " ";
        });
        if (index != length - 1) {
            stringUser += ", "
        }
    });

    return stringUser;
};