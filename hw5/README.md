Задача о читателях и писателях. Базу данных разделяют два типа
процессов – читатели и писатели. Читатели выполняют транзакции, которые
просматривают записи базы данных, транзакции писателей и просматривают
и изменяют записи. Предполагается, что в начале БД находится в
непротиворечивом состоянии (например, если каждый элемент — число, то
они все отсортированы). Каждая отдельная транзакция переводит БД из
одного непротиворечивого состояния в другое. Для предотвращения
взаимного влияния транзакций процесс-писатель должен иметь
исключительный доступ к БД. Если к БД не обращается ни один из
процессов-писателей, то выполнять транзакции могут одновременно сколько
угодно читателей. Создать многопоточное приложение с потокамиписателями и потоками-читателями. Реализовать решение, используя
семафоры.
