$(document).ready(function() {
    form = $('#settle_form')
    product_id = $("#product_id").val()
    $("#add_to_cart").click(function() {
        form.attr('action','/shopping/add_to_cart/'+product_id+'/')
        form.submit()
    });
    $("#buy_product").click(function(){
        form.attr('action','/shopping/buy_product/')
         $('#settle').modal('show');
    });
    $("#add_to_favorites").click(function(){
        form.attr('action','/shopping/add_to_favorites/'+product_id+'/')
        form.submit()
    });
    $(".product_count").on('change', function(){
        var product_id = $(this).data('product-id')
        var sub_price = parseInt($(".cart_price_"+product_id).text()) * parseInt($(this).val(), 10)
        var new_total_price = parseInt($('#settle_total_price').text(), 10) - parseInt($('.cart_sub_price_'+product_id).text()) + sub_price

        $('.settle_count_'+product_id).text($(this).val())
        $('.cart_sub_price_'+product_id).text(sub_price)
        $('.settle_sub_price_'+product_id).text(sub_price)
        $('#settle_total_price').text(new_total_price)
    });
    handle_message()
});

function settle_cart(){
    $('#settle').modal('show');
}

function handle_message(){
    if($('#message .modal-body').text().trim() !== ''){
        $('#message').modal('show');
        $('#message').on('hidden.bs.modal', function () {
            // 清空模态框内容
            $('#message .modal-body').empty();
            // 移除页面中的消息元素
            $('#message-area').remove();
        });
    }
}