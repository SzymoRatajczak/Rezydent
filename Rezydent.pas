{$M 31000,12344,186000}
uses Crt, Dos;
var
  Licznik : byte;
  i       : integer;
 {$F+}
 procedure Rezydent; interrupt;
 begin
  inc(Licznik);
  if(Licznik mod 2 = 0) then begin 
     Sound(1000); delay(1);NoSound;
  end;
  if(Licznik mod 30=0) then begin
     for i:=1 to 100 do begin Sound(10*i);delay(1);NoSound;end;
	 for i:=100 downto 1 do begin Sound(10*i);delay(1);NoSound;end;
	end;
	if(Licznik =5*16) then begin
	   Sound(500);Delay(10);NoSound;
	   Licznik:=(Licznik xor Licznik);
	   end;
	end;
	{$F-}
	begin
	 Licznik:=0;
	 SetIntVec($1c,Addr(Rezydent));
	 Keep(0);
	end.
  