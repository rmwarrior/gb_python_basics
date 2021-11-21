###################################################
    Для документирования пришлось поставить Node.js с его менеджером пакетов.
Может быть можно было и без него, но команда "npm install jsdoc -g"
не распознавалась.

###################################################
    Затем, выяснилось, что отключено выполнение сценариев:

PS C:\Temp\2 JS\ДЗ\2\домашнее_задание> jsdoc .\4.html
jsdoc : Невозможно загрузить файл C:\Users\...\AppData\Roaming\npm\jsdoc.ps1,
так как выполнение сценариев отключено в этой системе.
Для получения дополнительных сведений см. about
_Execution_Policies по адресу https:/go.microsoft.com/fwlink/?LinkID=135170.
строка:1 знак:1
+ jsdoc .\4.html
+ ~~~~~
    + CategoryInfo          : Ошибка безопасности: (:) [], PSSecurityException
    + FullyQualifiedErrorId : UnauthorizedAccess

###################################################
Пришлось временно включать:

PS> Set-ExecutionPolicy -executionpolicy Bypass -scope Process
