var I18n = I18n || {};
I18n.translations = {"en":{"date":{"formats":{"default":"%Y-%m-%d","short":"%b %d","long":"%B %d, %Y","traditional":"%m/%d/%y","month-year":"%b., %Y"},"day_names":["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"],"abbr_day_names":["Sun","Mon","Tue","Wed","Thu","Fri","Sat"],"month_names":[null,"January","February","March","April","May","June","July","August","September","October","November","December"],"abbr_month_names":[null,"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],"order":["year","month","day"]},"time":{"formats":{"default":"%a, %d %b %Y %H:%M:%S %z","short":"%d %b %H:%M","long":"%B %d, %Y %H:%M"},"am":"am","pm":"pm"},"support":{"array":{"words_connector":", ","two_words_connector":" and ","last_word_connector":", and "}},"errors":{"format":"%{attribute} %{message}","messages":{"inclusion":"is not included in the list","exclusion":"is reserved","invalid":"is invalid","confirmation":"doesn't match confirmation","accepted":"must be accepted","empty":"can't be empty","blank":"can't be blank","too_long":"is too long (maximum is %{count} characters)","too_short":"is too short (minimum is %{count} characters)","wrong_length":"is the wrong length (should be %{count} characters)","not_a_number":"is not a number","not_an_integer":"must be an integer","greater_than":"must be greater than %{count}","greater_than_or_equal_to":"must be greater than or equal to %{count}","equal_to":"must be equal to %{count}","less_than":"must be less than %{count}","less_than_or_equal_to":"must be less than or equal to %{count}","odd":"must be odd","even":"must be even","expired":"has expired, please request a new one","not_found":"not found","already_confirmed":"was already confirmed","not_locked":"was not locked","not_saved":{"one":"1 error prohibited this %{resource} from being saved:","other":"%{count} errors prohibited this %{resource} from being saved:"}}},"activerecord":{"errors":{"messages":{"taken":"has already been taken","record_invalid":"Validation failed: %{errors}"}},"models":{"car":"Car","user":"User","refueling":"Refueling"},"attributes":{"user":{"email":"Email","password":"Password","password_confirmation":"Repeat","current_password":"Current password","locale":"Language","volume":"Volume"},"refueling":{"mileage":"Mileage","liter":"Volume","amount":"Amount","date":"Date","car":"Car"},"car":{"last_refueling":"Last Refueling","fuel":"Fuel","fuel_efficiency":"Efficiency","fuel_economy":"Economy","fuel_cost":"Cost","refuelings":"Refuelings","mileage":"Mileage"}}},"number":{"format":{"separator":".","delimiter":",","precision":3,"significant":false,"strip_insignificant_zeros":false},"currency":{"format":{"format":"%u%n","unit":"$","separator":".","delimiter":",","precision":2,"significant":false,"strip_insignificant_zeros":false}},"percentage":{"format":{"delimiter":""}},"precision":{"format":{"delimiter":""}},"human":{"format":{"delimiter":"","precision":3,"significant":true,"strip_insignificant_zeros":true},"storage_units":{"format":"%n %u","units":{"byte":{"one":"Byte","other":"Bytes"},"kb":"KB","mb":"MB","gb":"GB","tb":"TB"}},"decimal_units":{"format":"%n %u","units":{"unit":"","thousand":"Thousand","million":"Million","billion":"Billion","trillion":"Trillion","quadrillion":"Quadrillion"}}}},"datetime":{"distance_in_words":{"half_a_minute":"half a minute","less_than_x_seconds":{"one":"less than 1 second","other":"less than %{count} seconds"},"x_seconds":{"one":"1 second","other":"%{count} seconds"},"less_than_x_minutes":{"one":"less than a minute","other":"less than %{count} minutes"},"x_minutes":{"one":"1 minute","other":"%{count} minutes"},"about_x_hours":{"one":"about 1 hour","other":"about %{count} hours"},"x_days":{"one":"1 day","other":"%{count} days"},"about_x_months":{"one":"about 1 month","other":"about %{count} months"},"x_months":{"one":"1 month","other":"%{count} months"},"about_x_years":{"one":"about 1 year","other":"about %{count} years"},"over_x_years":{"one":"over 1 year","other":"over %{count} years"},"almost_x_years":{"one":"almost 1 year","other":"almost %{count} years"}},"prompts":{"year":"Year","month":"Month","day":"Day","hour":"Hour","minute":"Minute","second":"Seconds"}},"helpers":{"select":{"prompt":"Please select"},"submit":{"create":"Create %{model}","update":"Update %{model}","submit":"Save %{model}"},"label":{"car":{"mileage":{}},"refueling":{"date":{}},"user":{"locale":{},"volume":{}}}},"devise":{"failure":{"already_authenticated":"You are already signed in.","unauthenticated":"You need to sign in or sign up before continuing.","unconfirmed":"You have to confirm your account before continuing.","locked":"Your account is locked.","invalid":"Invalid email or password.","invalid_token":"Invalid authentication token.","timeout":"Your session expired, please sign in again to continue.","inactive":"Your account was not activated yet."},"sessions":{"signed_in":"Signed in successfully.","signed_out":"Signed out successfully."},"passwords":{"send_instructions":"You will receive an email with instructions about how to reset your password in a few minutes.","updated":"Your password was changed successfully. You are now signed in.","updated_not_active":"Your password was changed successfully.","send_paranoid_instructions":"If your e-mail exists on our database, you will receive a password recovery link on your e-mail","new":{"title":"Forgot your password?"}},"confirmations":{"send_instructions":"You will receive an email with instructions about how to confirm your account in a few minutes.","send_paranoid_instructions":"If your e-mail exists on our database, you will receive an email with instructions about how to confirm your account in a few minutes.","confirmed":"Your account was successfully confirmed. You are now signed in."},"registrations":{"signed_up":"You have signed up successfully. If enabled, a confirmation was sent to your e-mail.","inactive_signed_up":"You have signed up successfully. However, we could not sign you in because your account is %{reason}.","updated":"You updated your account successfully.","destroyed":"Bye! Your account was successfully cancelled. We hope to see you again soon.","reasons":{"inactive":"inactive","unconfirmed":"unconfirmed","locked":"locked"}},"unlocks":{"send_instructions":"You will receive an email with instructions about how to unlock your account in a few minutes.","unlocked":"Your account was successfully unlocked. You are now signed in.","send_paranoid_instructions":"If your account exists, you will receive an email with instructions about how to unlock it in a few minutes."},"omniauth_callbacks":{"success":"Successfully authorized from %{kind} account.","failure":"Could not authorize you from %{kind} because \"%{reason}\"."},"mailer":{"confirmation_instructions":{"subject":"Confirmation instructions"},"reset_password_instructions":{"subject":"Reset password instructions"},"unlock_instructions":{"subject":"Unlock Instructions"}}},"car":{"refueling_ago_in_words":"%{date} ago"},"cars":{"index":{"title":"My Cars","new_car":"Add"},"new":{"title":"Add Car"},"show":{"total":"Total","per_day":"Per day","per_month":"Per month","per_year":"Per year","since":"Since %{date}"},"form":{"fuel_prompt":"Please select a fuel type"}},"refuelings":{"index":{"title":"Refuelings for %{car}","new_refueling":"Add"},"new":{"title":"Add Refueling"},"form":{"car_prompt":"Please select a car"}},"buttons":{"sign_in":"Sign In","create_account":"Create Account","sign_out":"Sign Out","update":"Update","save":"Save","back":"Back","edit":"Edit","delete":"Delete","confirm_delete":"Are you sure you want to delete '%{target}'?","previous":"Previous","next":"Next","charts":"Charts","send_reset_password_instruction":"Submit","forgot_password":"Forgot Password"},"footer":{"refueling":"Refueling","cars":"Cars","my-info":"My Info"},"abbr":{"day":"d","month":"mo","year":"yr","liter":"L","kilometer":"km","cent":"c"},"charts":{"fuel_efficiency":{"title":"Fuel efficiency (%{mileage}/%{volume})","legend":["Fuel efficiency","Moving fuel efficiency"]},"fuel_consumption":{"title":"Fuel consumption (%{volume}/100 %{mileage})","legend":["Fuel consumption","Moving fuel consumption"]},"fuel_cost":{"title":"Fuel cost (c/%{mileage})","legend":["Fuel cost","Moving fuel cost"]}},"messages":{"loading":"Loading"},"today":"Today"},"devise":{},"nl":{"abbr":{"cent":"c","day":"d.","kilometer":"km","liter":"l","month":"mnd.","year":"jr."},"activerecord":{"attributes":{"car":{"fuel":"Brandstof","fuel_cost":"Kosten","fuel_economy":"Verbruik","fuel_efficiency":"Effici\u00ebntie","last_refueling":"Laatst getankt","mileage":"Kilometerstand","refuelings":"Tankbeurten"},"refueling":{"amount":"Bedrag","car":"Auto","date":"Datum","liter":"Volume","mileage":"Kilometerstand"},"user":{"current_password":"Huidig wachtwoord","email":"Email","locale":"Taal","password":"Wachtwoord","password_confirmation":"Herhaal wachtwoord","volume":"Volume"}},"errors":{"messages":{"record_invalid":"Validatie mislukt: %{errors}","taken":"is al in gebruik"}},"models":{"car":"Auto","refueling":"Tankbeurt","user":"Account"}},"buttons":{"back":"Terug","charts":"Grafieken","confirm_delete":"Weet je zeker dat je '%{target}' wilt verwijderen?","create_account":"Een account maken","delete":"Verwijderen","edit":"Bewerken","forgot_password":"Wachtwoord vergeten","next":"Volgende","previous":"Vorige","save":"Opslaan","send_reset_password_instruction":"Versturen","sign_in":"Aanmelden","sign_out":"Afmelden","update":"Bijwerken"},"car":{"refueling_ago_in_words":"%{date} geleden"},"cars":{"form":{"fuel_prompt":"Selecteer een type brandstof"},"index":{"new_car":"Nieuw","title":"Mijn auto's"},"new":{"title":"Nieuwe auto"},"show":{"per_day":"Per dag","per_month":"Per maand","per_year":"Per jaar","since":"Sinds %{date}","total":"Totaal"}},"charts":{"fuel_consumption":{"legend":["Verbruik","Voortschrijdend verbruik"],"title":"Brandstofverbruik (%{volume}/100 %{mileage})"},"fuel_cost":{"legend":["Brandstofkosten","Gemiddelde brandstofkosten"],"title":"Brandstofkosten (c/%{mileage})"},"fuel_efficiency":{"legend":["Verbruik","Voortschrijdend verbruik"],"title":"Brandstofeffici\u00ebntie (%{mileage}/%{volume})"}},"date":{"abbr_day_names":["zon","maa","din","woe","don","vri","zat"],"abbr_month_names":[null,"jan","feb","mar","apr","mei","jun","jul","aug","sep","okt","nov","dec"],"day_names":["zondag","maandag","dinsdag","woensdag","donderdag","vrijdag","zaterdag"],"formats":{"default":"%d-%m-%Y","long":"%e %B %Y","month-year":"%b., %Y","short":"%e %b","traditional":"%d-%m-%y"},"month_names":[null,"januari","februari","maart","april","mei","juni","juli","augustus","september","oktober","november","december"],"order":["day","month","year"]},"datetime":{"distance_in_words":{"about_x_hours":{"one":"ongeveer \u00e9\u00e9n uur","other":"ongeveer %{count} uur"},"about_x_months":{"one":"ongeveer \u00e9\u00e9n maand","other":"ongeveer %{count} maanden"},"about_x_years":{"one":"ongeveer \u00e9\u00e9n jaar","other":"ongeveer %{count} jaar"},"almost_x_years":{"one":"bijna \u00e9\u00e9n jaar","other":"bijna %{count} jaar"},"half_a_minute":"een halve minuut","less_than_x_minutes":{"one":"minder dan \u00e9\u00e9n minuut","other":"minder dan %{count} minuten"},"less_than_x_seconds":{"one":"minder dan \u00e9\u00e9n seconde","other":"minder dan %{count} seconden"},"over_x_years":{"one":"meer dan \u00e9\u00e9n jaar","other":"meer dan %{count} jaar"},"x_days":{"one":"1 dag","other":"%{count} dagen"},"x_minutes":{"one":"1 minuut","other":"%{count} minuten"},"x_months":{"one":"1 maand","other":"%{count} maanden"},"x_seconds":{"one":"1 seconde","other":"%{count} seconden"}},"prompts":{"day":"dag","hour":"uur","minute":"minuut","month":"maand","second":"seconde","year":"jaar"}},"errors":{"format":"%{attribute} %{message}","messages":{"accepted":"moet worden geaccepteerd","blank":"moet opgegeven zijn","confirmation":"komt niet met de bevestiging overeen","empty":"moet opgegeven zijn","equal_to":"moet gelijk zijn aan %{count}","even":"moet even zijn","exclusion":"is niet beschikbaar","greater_than":"moet groter zijn dan %{count}","greater_than_or_equal_to":"moet groter dan of gelijk zijn aan %{count}","inclusion":"is niet in de lijst opgenomen","invalid":"is ongeldig","less_than":"moet minder zijn dan %{count}","less_than_or_equal_to":"moet minder dan of gelijk zijn aan %{count}","not_a_number":"is geen getal","not_an_integer":"moet een geheel getal zijn","odd":"moet oneven zijn","too_long":"is te lang (maximaal %{count} tekens)","too_short":"is te kort (minimaal %{count} tekens)","wrong_length":"heeft onjuiste lengte (moet %{count} tekens lang zijn)"}},"footer":{"cars":"Auto's","my-info":"Mijn Info","refueling":"Tanken"},"helpers":{"select":{"prompt":"Selecteer"},"submit":{"create":"%{model} toevoegen","submit":"%{model} opslaan","update":"%{model} bewaren"}},"messages":{"loading":"Bezig..."},"number":{"currency":{"format":{"delimiter":".","format":"%u%n","precision":2,"separator":",","unit":"\u20ac"}},"format":{"delimiter":".","precision":2,"separator":","},"human":{"decimal_units":{"format":"%n %u","units":{"billion":"miljard","million":"miljoen","quadrillion":"biljard","thousand":"duizend","trillion":"biljoen"}},"format":{"precision":3,"significant":true,"strip_insignificant_zeros":true},"storage_units":{"format":"%n %u","units":{"byte":{"one":"Byte","other":"Bytes"},"gb":"GB","kb":"KB","mb":"MB","tb":"TB"}}}},"refuelings":{"form":{"car_prompt":"Selecteer een auto"},"index":{"new_refueling":"Nieuw","title":"Tanken - %{car}"},"new":{"title":"Tanken"}},"support":{"array":{"last_word_connector":" en ","two_words_connector":" en ","words_connector":", "}},"time":{"am":"'s ochtends","formats":{"default":"%a %d %b %Y %H:%M:%S %Z","long":"%d %B %Y %H:%M","short":"%d %b %H:%M"},"pm":"'s middags"},"today":"Vandaag"}};