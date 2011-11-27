//= require jquery
//= require jquery_ujs
//= require_self
//= require_tree .
//= require rails.validations

jQuery(function($) {
  $('[data-validate] :submit').live('click', function() {
    var $form = $(this).parents('form');
    $form.validate();
  });

  // $('input.decimals').numeric();
  // $('input.integers').numeric(false);
});
