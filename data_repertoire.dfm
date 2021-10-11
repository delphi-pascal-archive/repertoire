object Data: TData
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 783
  Top = 211
  Height = 270
  Width = 215
  object Connect_repertoire: TADOConnection
    LoginPrompt = False
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    BeforeConnect = Connect_repertoireBeforeConnect
    Left = 88
    Top = 16
  end
  object Query_repertoire: TADOQuery
    Connection = Connect_repertoire
    ExecuteOptions = [eoAsyncFetch]
    Filtered = True
    MaxRecords = 100
    Parameters = <>
    SQL.Strings = (
      'select * from repertoire')
    Left = 88
    Top = 80
  end
  object DataSource1: TDataSource
    DataSet = Query_repertoire
    Left = 88
    Top = 152
  end
end
