﻿
Процедура УстановкаПараметровСеанса(ТребуемыеПараметры)
	
	ПараметрыСеанса.ТекущийПользователь = Справочники.Пользователи.НайтиПоРеквизиту("УникальныйИдентификатор",
	Строка(ПользователиИнформационнойБазы.ТекущийПользователь().УникальныйИдентификатор));
	
КонецПроцедуры
