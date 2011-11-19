//= require jquery
//= require jquery_ujs
//= require_self
//= require_tree .
//= require rails.validations
//= require jquery.validate

jQuery(function($) {
  $('[data-csv] :submit').live('click', function() {
    var $form = $(this).parents('form');
    $form.clientSideValidations();
  });

  $('.validate :submit').live('click', function() {
    var $form = $(this).parents('form');
    $form.validate();
  });

  // $('input.decimals').numeric();
  // $('input.integers').numeric(false);
});