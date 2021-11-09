object Connection: TConnection
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 150
  Width = 215
  object FDConnection: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Criacao\Desktop\CRUDPOODelphi\database\dados.s' +
        'db3'
      'LockingMode=Normal'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 72
    Top = 32
  end
  object FDQuery: TFDQuery
    Connection = FDConnection
    Left = 160
    Top = 24
  end
end
