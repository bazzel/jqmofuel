jQuery(function($) {
  $('[data-csv] :submit').live('click', function() {
    var $form = $(this).parents('form');
    $form.clientSideValidations();
  });

  $('.validate :submit').live('click', function() {
    var $form = $(this).parents('form');
    $form.validate();
  });
  
});
