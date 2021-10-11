unit data_repertoire;

interface

uses
  SysUtils, Classes, DB, ADODB,Forms;

type
  TData = class(TDataModule)
    Connect_repertoire: TADOConnection;
    Query_repertoire: TADOQuery;
    DataSource1: TDataSource;
    procedure Connect_repertoireBeforeConnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Data: TData;

implementation

uses repertoire;

{$R *.dfm}

procedure TData.Connect_repertoireBeforeConnect(Sender: TObject);
begin
{Connect_repertoire.ConnectionString :=
    'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source='
    + ExtractFilepath(application.ExeName)+ '\repertoire.mdb'//ExtractFileDir(paramStr(0)) + '\repertoire.mdb'
    +';Mode=ReadWrite;Extended Properties="";Jet OLEDB:System database="";Jet OLEDB:Registry Path="";'
    +'Jet OLEDB:Database Password="";Jet OLEDB:Engine Type=5;Jet OLEDB:Database Locking Mode=1;'
    +'Jet OLEDB:Global Partial Bulk Ops=2;Jet OLEDB:Global Bulk Transactions=1;Jet OLEDB:New Database Password="";'
    +'Jet OLEDB:Create System Database=False;Jet OLEDB:Encrypt Database=False;'
    +'Jet OLEDB:Don''t Copy Locale on Compact=False;'
    +'Jet OLEDB:Compact Without Replica Repair=False;Jet OLEDB:SFP=False';}
end;

procedure TData.DataModuleCreate(Sender: TObject);
begin
{Connect_repertoire.ConnectionString :=
    'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source='
    + ExtractFilepath(application.ExeName)+ '\repertoire.mdb'//ExtractFileDir(paramStr(0)) + '\repertoire.mdb'
    +';Mode=ReadWrite;Extended Properties="";Jet OLEDB:System database="";Jet OLEDB:Registry Path="";'
    +'Jet OLEDB:Database Password="";Jet OLEDB:Engine Type=5;Jet OLEDB:Database Locking Mode=1;'
    +'Jet OLEDB:Global Partial Bulk Ops=2;Jet OLEDB:Global Bulk Transactions=1;Jet OLEDB:New Database Password="";'
    +'Jet OLEDB:Create System Database=False;Jet OLEDB:Encrypt Database=False;'
    +'Jet OLEDB:Don''t Copy Locale on Compact=False;'
    +'Jet OLEDB:Compact Without Replica Repair=False;Jet OLEDB:SFP=False';}

 Connect_repertoire.ConnectionString :='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+ExtractFilePath(Application.Exename)+'repertoire.mdb;Mode=ReadWrite;Persist Security Info=False';

 //'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+ExtractFilePath(Application.Exename)+'test1.mdb;Mode=ReadWrite;Persist Security Info=False';

 // Form1.DBGrid1.Columns[0].FieldName:='Nom';
 // Form1.DBGrid1.Columns[1].FieldName:='Prénom';
 // Form1.DBGrid1.Columns[2].FieldName:='Adresse';
end;

end.
