
Процедура ПроверкуПрошелПроверкаУсловия(ТочкаМаршрутаБизнесПроцесса, Результат)
	Результат = Допуск;	 
КонецПроцедуры


Процедура ОбработкаЗаказаПриСозданииЗадач(ТочкаМаршрутаБизнесПроцесса, ФормируемыеЗадачи, Отказ)
	ФормируемыеЗадачи[0].Подразделение = Справочники.Подразделение.Менеджеры;	
КонецПроцедуры

Процедура ПроверкаЗаказаПриСозданииЗадач(ТочкаМаршрутаБизнесПроцесса, ФормируемыеЗадачи, Отказ)
	ФормируемыеЗадачи[0].Подразделение = Справочники.Подразделение.Обработка;
КонецПроцедуры

Процедура СообщитьКлиентуОбОтказеПриСозданииЗадач(ТочкаМаршрутаБизнесПроцесса, ФормируемыеЗадачи, Отказ)
	ФормируемыеЗадачи[0].Подразделение = Справочники.Подразделение.Менеджеры;
КонецПроцедуры
