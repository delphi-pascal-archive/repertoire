unit repertoire;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,data_repertoire,DB,DBTables,ADODB, Grids, DBGrids,
  ComCtrls, ToolWin, ImgList, ExtCtrls, Buttons, Mask, DBCtrls;

type
  TForm1 = class(TForm)
    ToolBar1: TToolBar;
    bout_ajout: TToolButton;
    bout_modif: TToolButton;
    bout_supprime: TToolButton;
    bout_recherche: TToolButton;
    ChoixPage: TPageControl;
    Ajout: TTabSheet;
    Modif: TTabSheet;
    supprime: TTabSheet;
    recherche: TTabSheet;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel_ajout: TPanel;
    Nom: TLabel;
    prenom: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit0: TEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Ajoute_contact: TBitBtn;
    EDIT4: TMaskEdit;
    edit5: TMaskEdit;
    edit6: TMaskEdit;
    Label7: TLabel;
    DBLookupComboBox4: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    Panel1: TPanel;
    DBLookupComboBox1: TDBLookupComboBox;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    EDIT18: TMaskEdit;
    EDIT19: TMaskEdit;
    EDIT17: TMaskEdit;
    Edit20: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Edit21: TEdit;
    Edit26: TEdit;
    EDIT28: TMaskEdit;
    EDIT29: TMaskEdit;
    Label26: TLabel;
    Edit22: TEdit;
    Edit23: TEdit;
    Edit25: TEdit;
    Edit24: TEdit;
    SpeedButton1: TSpeedButton;
    edit27: TMaskEdit;
    Rue: TLabel;
    Ville: TLabel;
    Departm: TLabel;
    Label22: TLabel;
    edit30: TEdit;
    SpeedButton2: TSpeedButton;
    GroupBox1: TGroupBox;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label46: TLabel;
    Label47: TLabel;
    ImageList1: TImageList;
    Edit_nom_modif: TEdit;
    Label48: TLabel;
    Label49: TLabel;
    nom_supp: TLabel;
    procedure bout_ajoutClick(Sender: TObject);
    procedure bout_modifClick(Sender: TObject);
    procedure bout_supprimeClick(Sender: TObject);
    procedure bout_rechercheClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    FUNCTION change_page(index:TTabsheet):boolean;
    procedure Ajoute_contactClick(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure DBLookupComboBox1MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DBLookupComboBox4Click(Sender: TObject);
    procedure DBLookupComboBox4MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBLookupComboBox3Click(Sender: TObject);
    procedure DBLookupComboBox3MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBLookupComboBox2MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DBLookupComboBox2Click(Sender: TObject);
    procedure Edit_efface(variable:integer);
    procedure init;

  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;
  page:TTabsheet;
  retour:boolean;

  Edit_valeur:TControl;
   tab_edit:array [1..10]of string;
     nomok:string;
     index_ref:integer;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
        modif.TabVisible:=false;
        supprime.TabVisible:=false;
        recherche.Tabvisible:=false;
        page:=ChoixPage.ActivePage;
         Dblookupcombobox1.Hint:='2 Clics pour recherche';
         Dblookupcombobox4.Hint:='2 Clics pour recherche';
         Dblookupcombobox3.Hint:='2 Clics pour recherche';
         Dblookupcombobox2.Hint:='2 Clics pour recherche';
end;

procedure TForm1.bout_ajoutClick(Sender: TObject);
begin
             page:=ChoixPage.ActivePage;
            if page <>ajout then
                  begin
                    change_page(page) ;
                    ajout.TabVisible:=true;
                    ajout.Show;
                  end;
end;

procedure TForm1.bout_modifClick(Sender: TObject);

begin
        page:=ChoixPage.ActivePage;
           if page <>modif then
              begin
                  DBlookupcombobox4.keyfield:='';
                  change_page(page);
                  modif.TabVisible:=true;
                  modif.Show;
                  edit_nom_modif.Text:='';
                  edit_efface(20);//Efface le texte des TEdit de la fiche

              end;

end;

procedure TForm1.bout_supprimeClick(Sender: TObject);
var i:integer;
begin
           page:=ChoixPage.ActivePage;
              if page <>supprime then
                 begin
                    dblookupcombobox3.KeyField:='';
                    nom_supp.Caption:='';
                     change_page(page);
                        For i := 30 To 39 Do
                          With TLabel(FindComponent('Label' + IntToStr(i))) Do
                              Begin
                                caption:='';
                              End;
                      supprime.TabVisible:=true;
                      supprime.Show;
                  end;
end;

procedure TForm1.bout_rechercheClick(Sender: TObject);

begin
            page:=ChoixPage.ActivePage;
           if page <>recherche then
                 begin
                    change_page(page);
                    recherche.TabVisible:=true;
                    recherche.Show;
                    DBlookupcombobox1.keyfield:='';
                    DBlookupcombobox2.keyfield:='';
                      edit_efface(10);//Efface le texte de TEdit de la fiche
                end;
end;

function TForm1.change_page(index:TTabsheet):boolean;
  begin
      if index=ajout then
      begin
          ajout.TabVisible:=false;
       end;

      if index=modif then
      begin
          modif.TabVisible:=false;
        end;

       if index=supprime then
       begin
          supprime.TabVisible:=false;
          end;
      if index=recherche then
          begin
          recherche.TabVisible:=false;
          end;

          change_page:=true;
   end;


procedure TForm1.Ajoute_contactClick(Sender: TObject);
Var I: Integer;
begin

  if (edit0.text='') or(edit1.text='') then
       begin
         ShowMessage('Entrer au moins un NOM et un Prénom');
         exit
       end;

  For I := 0 To 10 Do
    With TEdit(FindComponent('Edit' + IntToStr(I))) Do
     Begin
       Tab_edit[I]:=TEXT;
     End;

 with data do
  begin
        with Query_repertoire do
          begin
              SQL.Clear;
  SQL.Add('INSERT INTO repertoire(nom,prenom,adresse,societe,telephone,telephoporta,fax,email,ville,departement,codepostal)');

  SQL.ADD('VALUES (:Nom,:Prénom,:Adresse,:société,:Telephone,:Telephoporta,:Fax,:Email,:ville,:departement,:codepostal)');

               For I := 0 To 10 Do
                  Parameters[I].Value:=Tab_edit[I];

            ExecSQL ;
        end;

  end;
   For I := 0 To 10 Do
    With TEdit(FindComponent('Edit' + IntToStr(I))) Do
     Begin
       Clear;
     End;

end;

procedure TForm1.DBLookupComboBox1Click(Sender: TObject);

var i:integer;
begin

            edit_efface(10);//Efface le texte des TEdit de la fiche

     nomok:=dblookupcombobox1.Text;

with data.Query_repertoire do
          begin
              SQL.Clear;
              SQL.ADD('select * from repertoire');
              sql.Add('where nom ='+ QuotedStr(nomok));
              ExecSQL ;
              Open;
          end;

   for  I:=2 to 11 do
    With TEdit(FindComponent('Edit' + IntToStr(I+9))) Do
        Begin
          if  data.Query_repertoire.Fields.Fields[I].Value<>NULL then
                text:=data.Query_repertoire.Fields.Fields[I].Value;
        End;
               init;
end;

procedure TForm1.DBLookupComboBox1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

begin

      DBLookupComboBox2.KeyField:='';

           edit_efface(10);//Efface le texte des TEdit de la fiche
    with data do
   begin
           with dblookupcombobox1 do
            begin
              dropdownwidth:=400;
              listfield:='nom;prenom;refcontact';
              keyfield:='refcontact';
              listfieldindex:=0;
            end;
                init;
        end;
end;

procedure TForm1.DBLookupComboBox4Click(Sender: TObject);
var i:integer;

begin

        edit_efface(10); //Efface le texte des TEdit de la fiche
         Edit_nom_modif.Text:='';
        nomok:=dblookupcombobox4.TEXT;
        Edit_nom_modif.Text:=nomok ;


      with data.Query_repertoire do
          begin
              SQL.Clear;
              SQL.ADD('select * from repertoire');
              sql.Add('where nom ='+ QuotedStr(nomok));
              ExecSQL ;
              Open;
          end;

          index_ref:= data.Query_repertoire.Fields[0].Value ;//Récupére la
                                          //valeur du numéro auto de la table

   for  I:=2 to 11 do
       With TEdit(FindComponent('Edit' + IntToStr(I+19))) Do
            Begin
                if  data.Query_repertoire.Fields.Fields[I].Value<>NULL then
                  text:=data.Query_repertoire.Fields.Fields[I].Value;
            End;
                init;
 {with data.Query_repertoire do
          begin
                SQL.Clear;
                SQL.ADD('select * from repertoire');
                ExecSQL ;
                Open;
                sort:='nom ASC';

          end; }

           with dblookupcombobox4 do
            begin
              listfield:='';
              keyfield:='';
            end;


end;

procedure TForm1.DBLookupComboBox4MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    with data do
   begin
           with dblookupcombobox4 do
            begin
              dropdownwidth:=400;
              listfield:='nom;prenom;refcontact';
              keyfield:='refcontact';
              listfieldindex:=0;
            end;
                init;
        end;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
VAR I:integer;
begin
   nomok:=edit_nom_modif.Text;

For I := 21 To 30 Do
    With TEdit(FindComponent('Edit' + IntToStr(I))) Do
     Begin
       Tab_edit[I-20]:=TEXT;
     End;

          with data.Query_repertoire do
            begin
              locate('refcontact',index_ref,[loPartialKey]);//Va sur l'enregistrement
                                            // en cours  du refcontact
                edit;
              for i := 2 to 11 do
                  begin
                        FIELDS.Fields[i].Value:= Tab_edit[I-1];
                   end;
                    Post;
                    Close;
             end;       

     edit_efface(20);//Efface le texte des TEdit de la fiche
     edit_nom_modif.Text:='';
end;

procedure TForm1.DBLookupComboBox3Click(Sender: TObject);
var i:integer;

begin

     nom_supp.Caption:= dblookupcombobox3.Text;
         For I := 30 To 39 Do
      With TLabel(FindComponent('Label' + IntToStr(I))) Do
        Begin
           caption:='';
        End;

     nomok:=dblookupcombobox3.TEXT;
             with data.Query_repertoire do
          begin
              SQL.Clear;
              SQL.ADD('select * from repertoire');
              sql.Add('where nom ='+ QuotedStr(nomok));
              ExecSQL ;
           Open;
          end;

         For I := 2 To 11 Do
      With TLabel(FindComponent('Label' + IntToStr(I+28))) Do
        Begin

              if   data.Query_repertoire.Fields.Fields[I].Value<>NULL then
           caption:=data.Query_repertoire.Fields.Fields[I].Value;
        End;


  with data.Query_repertoire do
          begin
                SQL.Clear;
                SQL.ADD('select * from repertoire');
                ExecSQL ;
                Open;
                sort:='nom ASC';
          end;

          with dblookupcombobox3 do
            begin
              listfield:='';
              keyfield:='';
            end;

end;

procedure TForm1.DBLookupComboBox3MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

begin
  with data do
   begin
           with dblookupcombobox3 do
            begin
              dropdownwidth:=400;
              listfield:='nom;prenom;refcontact';
              keyfield:='refcontact';
              listfieldindex:=0;
            end;
              init;
       end;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
var i:integer;

begin

  
 if nom_supp.Caption<>''then
    begin

     if MessageDlg('Voulez vous supprimer?',
              mtConfirmation,[mbYes,mbNo],0)=mryes then
        begin

      with data.Query_repertoire do
          begin

              SQL.Clear;
              SQL.ADD('select * from repertoire');
              sql.Add('where nom ='+ QuotedStr(nomok));
              Open;
              ExecSQL;
              Delete ; //Supprime la ligne en cours
          end;
        //Efface tous les labels
          For I := 30 To 39 Do
              With TLabel(FindComponent('Label' + IntToStr(I))) Do
                  Begin
                    caption:='';
                  End;
         //ET le combobox
              nom_supp.Caption:='';
              dblookupcombobox3.KeyField:='';

        end;
    end;
 end;
procedure TForm1.DBLookupComboBox2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

begin

              edit_efface(10);
 with data do
   begin
           DBLookupComboBox1.KeyField:='';
           with dblookupcombobox2 do
            begin
              dropdownwidth:=700;
              listfield:='societe;nom;prenom';
              keyfield:='refcontact';
              listfieldindex:=1;
            end;
              init;
       end;
end;

procedure TForm1.DBLookupComboBox2Click(Sender: TObject);

var i:integer;
      nom:string;
begin

              edit_efface(10);

     nom:=dblookupcombobox2.Text;

with data.Query_repertoire do
          begin
              SQL.Clear;
              SQL.ADD('select * from repertoire');
              sql.Add('where nom ='+ QuotedStr(nom));
              ExecSQL ;
              Open;
          end;

   for  I:=2 to 11 do
    With TEdit(FindComponent('Edit' + IntToStr(I+9))) Do
        Begin
          if  data.Query_repertoire.Fields.Fields[I].Value<>NULL then
                text:=data.Query_repertoire.Fields.Fields[I].Value;
        End;
             init;
end;

//Efface les TEDIT des #fiches
procedure TForm1.Edit_efface(variable:integer);
   var i:integer;
    begin
      For I := 1 To 10 Do
          With TEdit(FindComponent('Edit' + IntToStr(I+variable))) Do
                Begin
                  Clear;
                 end;
      End;


 procedure TForm1.init;

  begin

  with data.Query_repertoire do
          begin
                SQL.Clear;
                SQL.ADD('select * from repertoire');
                ExecSQL ;
                Open;
                sort:='nom ASC';
          end;

  end;



end.
