$FilePath = '\notes\Rails Applications.xlsx'                             
$Excel = New-Object -ComObject Excel.Application
$Workbook = $Excel.Workbooks.Open($FilePath)    
$excel.Visible = $true                          

