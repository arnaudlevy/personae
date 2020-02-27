$(function() {
    function setVisibility (target) {
        var checked = target.prop('checked'),
            parent = target.closest('.value_and_no_value'),
            range = $('.person_evaluations_value', parent);
        if (checked) {
            range.hide();
        } else {
            range.show();
        }
    };
    $('.person_evaluations_no_value input').each(function() {
        setVisibility($(this));
    })
    $('.person_evaluations_no_value input').change(function () {
        setVisibility($(this));
    });
});
