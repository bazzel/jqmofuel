// Custom jQuery Mobile configuration.
// See http://jquerymobile.com/demos/1.0a3/docs/api/globalconfig.html
$(document).bind("mobileinit", function(){
  $.extend($.mobile, {
    loadingMessage: I18n.t("messages.loading")
  });
  
  $.mobile.page.prototype.options.backBtnText = I18n.t("buttons.back");
});
