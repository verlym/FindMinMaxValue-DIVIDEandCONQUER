program minmaksDC;
    {Mencari nilai maksimum dan minimum di dalam tabel A yang berukuran n elemen secara Divide and Conquer.
Masukan: tabel A yang sudah terdefinisi elemen-elemennya
Keluaran: nilai maksimum dan nilai minimum tabel}
uses crt;
type TabelInt = Array[1..10] of integer;
var
    A:TabelInt =(4,12,23,9,21,1,35,2,24,56);
    min,maks:integer;
    procedure minmaks(A:TabelInt;i:integer;j:integer;var min:integer;var maks:integer);
    var
        min1,min2,k,maks1,maks2 : integer;
    begin
        if i=j then {1 elemen}
        begin
                min  := A[i];
                maks := A[i];
        end
    else
        if (i=j-1) then { 2 elemen }
        begin
                if A[i]<A[j] then
                begin
                        maks:=A[j];
                        min:=A[i];
                end
                else
                begin
                        maks:=A[i];
                        min:=A[j];
                end
        end
        else { lebih dari 2 elemen }
        begin
                k:= (i+j) div 2; {bagidua tabel pada posisi k }
                minmaks(A,i,k,min1,maks1); 
                minmaks(A,k+1,j,min2,maks2);
                if min1<min2 then
                        min:= min1
                else
                        min:=min2;
                if maks1<maks2 then
                        maks:=maks2
                else
                        maks:=maks1;
        end
    end;
begin
clrscr;
           minmaks(A,1,10,min,maks);
           writeln(min);
           writeln(maks);
readln;
end.
