jQuery(function($) {
  $(':submit').live('click', function() {
    var $form = $(this).parents('form');
    //$form.validate();
    $form.clientSideValidations();
  });
});
