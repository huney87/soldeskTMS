/**
 * 예매창에서 공용으로 쓰이는 스크립트 파일
 */

var forwardForm = function(step){
    var $form = $('<form></form>');
    $form.attr('action', '/ticket');
    $form.attr('method', 'post');
    $form.appendTo('body');

    var hdInput = '<input type="hidden" name="step" value="' + step + '">';
    $form.append(hdInput);
    $form.submit();
}