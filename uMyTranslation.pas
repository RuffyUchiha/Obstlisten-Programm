unit uMyTranslation;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Translations;

implementation

var PODirectory: String;

initialization

begin
  PODirectory:='c:\lazarus\languages\';
  TranslateUnitResourceStrings('LCLStrConsts',PODirectory+
    'lazaruside.de.po','de','');
  PODirectory:='c:\lazarus\lcl\languages\';
  TranslateUnitResourceStrings('LCLStrConsts',PODirectory+
    'lclstrconsts.de.po','de','');
end;

end.

